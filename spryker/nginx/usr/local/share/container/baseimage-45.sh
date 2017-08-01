#!/bin/bash
source /usr/local/share/spryker/spryker_functions.sh

alias_function do_build_permissions do_spryker_build_permissions_inner
do_build_permissions() {
  do_spryker_build_permissions_inner
  do_spryker_build
}

alias_function do_build do_spryker_nginx_build_inner
do_build() {
  export DEVELOPMENT_MODE="${BUILD_DEVELOPMENT_MODE}"
  export APPLICATION_ENV="${BUILD_APPLICATION_ENV}"
  do_spryker_nginx_build_inner
  do_templating
  do_generate_files
  do_build_assets
  do_spryker_app_permissions
}

alias_function do_templating do_spryker_templating_inner
do_templating() {
  do_spryker_templating
  do_spryker_templating_inner
  do_spryker_vhosts
}

alias_function do_development_start do_spryker_development_start_inner
do_development_start() {
  do_spryker_development_start_inner
  do_templating
  do_spryker_install
  do_spryker_app_permissions
}

do_setup() {
  do_templating
  do_spryker_install
  do_spryker_migrate
}
