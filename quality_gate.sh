#!/usr/bin/env bash

#set -x

## Install "curl" & "jq"
#apt-get update
#apt-get install -y curl jq

# Create Quality Gate and obtain gateId
echo "Creating Quality Gate 'Aiwin Way' ..."
GATE_ID=$(curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "name=Aiwin Way" "$SONAR_HOST_URL/api/qualitygates/create" 2>/dev/null | jq .id)
echo "Quality Gate created successfully with id: $GATE_ID"

if [ -z "$GATE_ID" ]; then
    echo "Exiting due empty value in gateId"
    exit -1
else
    # Create Quality Gate Conditions
    echo "Creating Quality Gate Conditions ..."
    curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "gateId=$GATE_ID" -F "metric=new_vulnerabilities"  -F "error=0"  -F "op=GT" -F "period=1" "$SONAR_HOST_URL/api/qualitygates/create_condition" 2>/dev/null
    curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "gateId=$GATE_ID" -F "metric=new_bugs"             -F "error=0"  -F "op=GT" -F "period=1" "$SONAR_HOST_URL/api/qualitygates/create_condition" 2>/dev/null
    curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "gateId=$GATE_ID" -F "metric=new_sqale_debt_ratio" -F "error=5"  -F "op=GT" -F "period=1" "$SONAR_HOST_URL/api/qualitygates/create_condition" 2>/dev/null
    #curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "gateId=$GATE_ID" -F "metric=overall_coverage"     -F "error=80" -F "op=LT" -F "period=1" "$SONAR_HOST_URL/api/qualitygates/create_condition" 2>/dev/null

    # Set Quality Gate as default
    echo "Setting Quality Gate as default ..."
    curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: multipart/form-data" -F "id=$GATE_ID" "$SONAR_HOST_URL/api/qualitygates/set_as_default" 2>/dev/null
fi
