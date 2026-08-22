<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');

require_once __DIR__ . '/auth_guard.php';
require_once __DIR__ . '/db.php';

const AD_PLACEMENTS = ['sidebar'];
const AD_PROVIDERS  = ['revive_iframe', 'revive_js', 'adsense'];

/* Valide + normalise un payload de slot pub. Retourne [params PDO, null] ou [null, message d'erreur]. */
function validate_ad_slot(array $d): array
{
    $label = trim((string) ($d['label'] ?? ''));
    if ($label === '') {
        return [null, 'Label required'];
    }

    $placement = $d['placement'] ?? 'sidebar';
    if (!in_array($placement, AD_PLACEMENTS, true)) {
        return [null, 'Invalid placement'];
    }

    $provider = $d['provider'] ?? '';
    if (!in_array($provider, AD_PROVIDERS, true)) {
        return [null, 'Invalid provider'];
    }

    $isActive = (int) (bool) ($d['is_active'] ?? false);
    $weight   = max(1, (int) ($d['weight'] ?? 1));
    $width    = ($d['width']  !== null && $d['width']  !== '') ? (int) $d['width']  : null;
    $height   = ($d['height'] !== null && $d['height'] !== '') ? (int) $d['height'] : null;

    /* Les champs du provider non sélectionné sont forcés à NULL pour éviter
       une config résiduelle contradictoire si on change de provider. */
    $reviveServerUrl = $reviveZoneId = $adsenseClientId = $adsenseSlotId = null;

    if (in_array($provider, ['revive_iframe', 'revive_js'], true)) {
        $url = trim((string) ($d['revive_server_url'] ?? ''));
        if ($url === '' || !filter_var($url, FILTER_VALIDATE_URL) || !str_starts_with($url, 'https://')) {
            return [null, 'Invalid Revive server URL'];
        }
        $reviveServerUrl = rtrim($url, '/');

        $zone = (string) ($d['revive_zone_id'] ?? '');
        if (!preg_match('/^\d{1,10}$/', $zone)) {
            return [null, 'Invalid Revive zone id'];
        }
        $reviveZoneId = $zone;
    }

    if ($provider === 'adsense') {
        $client = (string) ($d['adsense_client_id'] ?? '');
        if (!preg_match('/^ca-pub-\d{10,20}$/', $client)) {
            return [null, 'Invalid AdSense client id'];
        }
        $adsenseClientId = $client;

        $slot = (string) ($d['adsense_slot_id'] ?? '');
        if (!preg_match('/^\d{6,15}$/', $slot)) {
            return [null, 'Invalid AdSense slot id'];
        }
        $adsenseSlotId = $slot;
    }

    return [[
        ':label'             => $label,
        ':placement'         => $placement,
        ':provider'          => $provider,
        ':is_active'         => $isActive,
        ':weight'            => $weight,
        ':width'             => $width,
        ':height'            => $height,
        ':revive_server_url' => $reviveServerUrl,
        ':revive_zone_id'    => $reviveZoneId,
        ':adsense_client_id' => $adsenseClientId,
        ':adsense_slot_id'   => $adsenseSlotId,
    ], null];
}

switch (method()) {
    case 'GET':
        /* Mode public : ?placement= whitelisté, uniquement les slots actifs,
           colonnes limitées au rendu (label/is_active jamais exposés). */
        if (isset($_GET['placement'])) {
            $placement = $_GET['placement'];
            if (!in_array($placement, AD_PLACEMENTS, true)) {
                json_response(['error' => 'Invalid placement'], 400);
            }
            $stmt = $pdo->prepare(
                'SELECT `id`,`provider`,`width`,`height`,`weight`,
                        `revive_server_url`,`revive_zone_id`,`adsense_client_id`,`adsense_slot_id`
                 FROM `ad_slots`
                 WHERE `placement` = :placement AND `is_active` = 1
                 ORDER BY `id` ASC'
            );
            $stmt->execute([':placement' => $placement]);
            json_response($stmt->fetchAll());
        }

        /* Mode admin : liste complète (pour le tableau CRUD), authentifié. */
        require_auth();
        $rows = $pdo->query(
            'SELECT `id`,`label`,`placement`,`provider`,`is_active`,`weight`,`width`,`height`,
                    `revive_server_url`,`revive_zone_id`,`adsense_client_id`,`adsense_slot_id`
             FROM `ad_slots` ORDER BY `id` DESC'
        )->fetchAll();
        json_response($rows);

    case 'POST':
        require_min_role('editor');
        [$fields, $err] = validate_ad_slot(body());
        if ($err !== null) {
            json_response(['error' => $err], 400);
        }
        $stmt = $pdo->prepare(
            'INSERT INTO `ad_slots`
                 (`label`,`placement`,`provider`,`is_active`,`weight`,`width`,`height`,
                  `revive_server_url`,`revive_zone_id`,`adsense_client_id`,`adsense_slot_id`)
             VALUES
                 (:label,:placement,:provider,:is_active,:weight,:width,:height,
                  :revive_server_url,:revive_zone_id,:adsense_client_id,:adsense_slot_id)'
        );
        $stmt->execute($fields);
        json_response(['success' => true, 'id' => (int) $pdo->lastInsertId()], 201);

    case 'PUT':
        require_min_role('editor');
        $d  = body();
        $id = intval($d['id'] ?? 0);
        if ($id <= 0) {
            json_response(['error' => 'Invalid id'], 400);
        }
        [$fields, $err] = validate_ad_slot($d);
        if ($err !== null) {
            json_response(['error' => $err], 400);
        }
        $fields[':id'] = $id;
        $stmt = $pdo->prepare(
            'UPDATE `ad_slots` SET
                 `label`=:label, `placement`=:placement, `provider`=:provider, `is_active`=:is_active,
                 `weight`=:weight, `width`=:width, `height`=:height,
                 `revive_server_url`=:revive_server_url, `revive_zone_id`=:revive_zone_id,
                 `adsense_client_id`=:adsense_client_id, `adsense_slot_id`=:adsense_slot_id
             WHERE `id`=:id'
        );
        $stmt->execute($fields);
        if ($stmt->rowCount() === 0) {
            json_response(['error' => 'Not found'], 404);
        }
        json_response(['success' => true]);

    case 'DELETE':
        require_min_role('admin');
        $id = intval($_GET['id'] ?? 0);
        if ($id <= 0) {
            json_response(['error' => 'Invalid id'], 400);
        }
        $stmt = $pdo->prepare('DELETE FROM `ad_slots` WHERE `id` = ?');
        $stmt->execute([$id]);
        if ($stmt->rowCount() === 0) {
            json_response(['error' => 'Not found'], 404);
        }
        json_response(['success' => true]);

    default:
        json_response(['error' => 'Method not allowed'], 405);
}
