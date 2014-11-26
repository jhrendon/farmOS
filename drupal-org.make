api = 2
core = 7.x

; -----------------------------------------------------------------------------
; Modules (contrib)
; -----------------------------------------------------------------------------

projects[addressfield][subdir] = "contrib"
projects[addressfield][version] = "1.0-beta5"

projects[autocomplete_deluxe][subdir] = "contrib"
projects[autocomplete_deluxe][version] = "2.0-beta3"

projects[commerce][subdir] = "contrib"
projects[commerce][version] = "1.10"

projects[commerce_features][subdir] = "contrib"
projects[commerce_features][version] = "1.0"

projects[commerce_price_savings_formatter][subdir] = "contrib"
projects[commerce_price_savings_formatter][version] = "1.4"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.5"

projects[date][subdir] = "contrib"
projects[date][version] = "2.8"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.5"

projects[entityreference][subdir] = "contrib"
projects[entityreference][version] = "1.1"

projects[features][subdir] = "contrib"
projects[features][version] = "1.0"

projects[field_collection][subdir] = "contrib"
projects[field_collection][version] = "1.0-beta8"

projects[field_group][subdir] = "contrib"
projects[field_group][version] = "1.4"

projects[filefield_paths][subdir] = "contrib"
projects[filefield_paths][version] = "1.0-beta4"

projects[fraction][subdir] = "contrib"
projects[fraction][version] = "1.2"

projects[geocoder][subdir] = "contrib"
projects[geocoder][version] = "1.2"
; Patch to fix multi-value filefield support.
projects[geocoder][patch][] = "http://www.drupal.org/files/issues/geocoder_multivalue_filefields-2352887-1.patch"
; Patch to add support for KMZ files.
projects[geocoder][patch][] = "http://www.drupal.org/files/issues/geocoder_kmz-2352931-2.patch"

projects[geofield][subdir] = "contrib"
projects[geofield][version] = "2.3"

projects[geophp][subdir] = "contrib"
projects[geophp][version] = "1.7"

projects[libraries][subdir] = "contrib"
projects[libraries][version] = "2.2"

projects[log][subdir] = "contrib"
projects[log][version] = "1.x"

projects[navbar][subdir] = "contrib"
projects[navbar][version] = "1.4"

projects[openlayers][subdir] = "contrib"
projects[openlayers][version] = "2.0-beta11"

projects[panels][subdir] = "contrib"
projects[panels][version] = "3.4"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.2"

projects[pathauto_entity][subdir] = "contrib"
projects[pathauto_entity][version] = "1.0"

projects[proj4js][subdir] = "contrib"
projects[proj4js][version] = "1.2"

projects[role_export][subdir] = "contrib"
projects[role_export][version] = "1.0"

projects[rules][subdir] = "contrib"
projects[rules][version] = "2.7"

projects[rules_array_create][subdir] = "contrib"
projects[rules_array_create]][version] = "1.0-alpha1"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[token][subdir] = "contrib"
projects[token][version] = "1.5"

projects[views][subdir] = "contrib"
projects[views][version] = "3.8"

projects[views_data_export][subdir] = "contrib"
projects[views_date_export][version] = "3.0-beta8"

; -----------------------------------------------------------------------------
; Modules (farm)
; -----------------------------------------------------------------------------

projects[farm_admin][subdir] = "farm"
projects[farm_admin][version] = "1.x-dev"

projects[farm_area][subdir] = "farm"
projects[farm_area][version] = "1.x-dev"

projects[farm_asset][subdir] = "farm"
projects[farm_asset][version] = "1.x-dev"

projects[farm_crop][subdir] = "farm"
projects[farm_crop][version] = "1.x-dev"

projects[farm_csa][subdir] = "farm"
projects[farm_csa][version] = "1.x-dev"

projects[farm_delivery][subdir] = "farm"
projects[farm_delivery][version] = "1.x-dev"

projects[farm_log][subdir] = "farm"
projects[farm_log][version] = "1.x-dev"

projects[farm_livestock][subdir] = "farm"
projects[farm_livestock][version] = "1.x-dev"

projects[farm_map][subdir] = "farm"
projects[farm_map][version] = "1.x-dev"

projects[farm_soil][subdir] = "farm"
projects[farm_soil][version] = "1.x-dev"

projects[farm_taxonomy][subdir] = "farm"
projects[farm_taxonomy][version] = "1.x-dev"

; -----------------------------------------------------------------------------
; Libraries
; -----------------------------------------------------------------------------

libraries[backbone][download][type] = "get"
libraries[backbone][download][url] = "http://github.com/documentcloud/backbone/archive/1.1.2.zip"

libraries[modernizr][download][type] = "get"
libraries[modernizr][download][url] = "http://github.com/modernizr/modernizr/archive/v2.8.3.tar.gz"

libraries[openlayers][download][type] = "get"
libraries[openlayers][download][url] = "http://github.com/openlayers/openlayers/releases/download/release-2.13.1/OpenLayers-2.13.1.tar.gz"

libraries[underscore][download][type] = "get"
libraries[underscore][download][url] = "http://github.com/documentcloud/underscore/archive/1.7.0.zip"
