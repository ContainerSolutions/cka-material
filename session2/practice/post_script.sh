#! /bin/bash


cmd_b64="bWluaWt1YmUgc3NoIC0tbmF0aXZlLXNzaD1mYWxzZSAtLSBzdWRvIG12IC9ldGMva3ViZXJuZXRlcy9rdWJlLXNjaGVkdWxlci55YW1sIC9ldGMva3ViZXJuZXRlcy9tYW5pZmVzdHMva3ViZS1zY2hlZHVsZXIueWFtbA=="

# To see the command being executed, you can run this line
# echo -ne $( echo -ne $cmd_b64 | base64 -d)

$(echo -ne $cmd_b64 | base64 -d)