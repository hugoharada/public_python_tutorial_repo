#!/bin/bash

get_var_value() {
  local var_name=$1
  local file_name=".env"
  
  if [[ -z "$var_name" ]]; then
    echo "Usage: get_var_value <variable_name>"
    return 1
  fi
  
  if [[ ! -f "$file_name" ]]; then
    echo "File $file_name does not exist."
    return 1
  fi

  local value=$(grep "^${var_name}=" "$file_name" | cut -d '=' -f2)
  
  if [[ -z "$value" ]]; then
    echo "Variable $var_name not found."
    return 1
  fi
  
  echo "$value"
}

