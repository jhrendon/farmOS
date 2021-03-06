<?php
/**
 * @file
 * Farm api form for configuring OAuth Clients.
 */

/**
 * OAuth client configuration form.
 */
function farm_api_oauth_settings_form($form, &$form_state) {

  // Ask modules for oauth client rediect uri.
  $clients = module_invoke_all('farm_api_oauth2_client');

  if (empty($clients)) {
    $form['empty'] = array(
      '#type' => 'markup',
      '#markup' => 'There are no OAuth Clients available.',
    );
    return $form;
  }

  // Create a set of checkboxes for the clients.
  $options = array();
  foreach ($clients as $key => $client) {
    if (!empty($client['label'])) {
      $options[$key] = $client['label'];
    }
  }

  // Load the list of enabled clients.
  $default_value = array();
  $query = new EntityFieldQuery();
  $query->entityCondition('entity_type', 'oauth2_server_client');
  $result = $query->execute();
  if (isset($result['oauth2_server_client'])) {
    $client_ids = array_keys($result['oauth2_server_client']);
    $active_clients = entity_load('oauth2_server_client', $client_ids);
    foreach ($active_clients as $client) {
      $default_value[] = $client->client_key;
    }
  }

  // Display as a list of checkboxes.
  $form['farm_api_enabled_clients'] = array(
    '#type' => 'checkboxes',
    '#title' => t('Enable or disable OAuth Clients.'),
    '#options' => $options,
    '#default_value' => $default_value,
  );

  // Submit.
  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => t('Save configuration'),
  );

  // Return the form.
  return $form;

}

/**
 * Form submit handler for farm_api_oauth_settings_form
 */
function farm_api_oauth_settings_form_submit(array $form, array &$form_state) {

  // Save the submitted form values.
  $submitted = $form_state['values']['farm_api_enabled_clients'];

  // Filter only the enabled clients.
  $submitted_enabled = array_filter($submitted);

  // Start an array to collect existing clients.
  // It is easier to check this list than an array of
  // OAuth2 Server Client entities.
  $enabled_clients = array();

  // Load oauth2_server clients
  $query = new EntityFieldQuery();
  $query->entityCondition('entity_type', 'oauth2_server_client');
  $result = $query->execute();

  // Check if we need to disable any existing clients.
  if (isset($result['oauth2_server_client'])) {

    // Load the entities
    $client_ids = array_keys($result['oauth2_server_client']);
    $active_clients = entity_load('oauth2_server_client', $client_ids);

    // Check for the "client_key" in supplied hooks.
    foreach ($active_clients as $active_client) {

      // Load the client key.
      $client_wrapper = entity_metadata_wrapper('oauth2_server_client', $active_client);
      $client_key = $client_wrapper->client_key->value();
      $client_label = $client_wrapper->label->value();

      // Check if client is included with the the form.
      if (isset($submitted[$client_key])) {

        // See if the client should be enabled.
        $enabled = isset($submitted_enabled[$client_key]);

        // If disabled, remove the client.
        if (!$enabled) {

          // Delete OAuth2 Server Client Entity
          $client_id = $client_wrapper->getIdentifier();
          entity_delete('oauth2_server_client', $client_id);

          // Notify that client was disabled.
          drupal_set_message(t('Disabled OAuth Client: @client_label', array('@client_label' => $client_label)));
        }

        else {

          // This client is still enabled. Add to enabled list.
          $enabled_clients[] = $client_key;
        }
      }
    }
  }

  // Ask modules for oauth clients.
  $clients = module_invoke_all('farm_api_oauth2_client');
  foreach($clients as $client) {

    // Save the client key.
    $client_key = $client['client_key'];

    // See if the client should be enabled.
    $enabled = isset($submitted_enabled[$client_key]);

    // Enable the client if not already enabled.
    if ($enabled && !in_array($client_key, $enabled_clients)) {

      // Check if optional client_secret was supplied.
      $client_secret = !empty($client['client_secret']) ? $client['client_secret'] : '';

      // Check if optional client settings were supplied.
      $client_settings = !empty($client['settings']) ? $client['settings'] : array();

      // Use the helper function.
      farm_api_enable_oauth_client($client['label'], $client_key, $client_secret, $client['redirect_uri'], $client_settings);

      // Notify that client was created.
      drupal_set_message(t('Created OAuth Client for @client_label', array('@client_label' => $client['label'])));
    }
  }
}
