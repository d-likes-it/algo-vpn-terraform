# Algo Vpn with Terraform

## Prior Work

Algo-vpn is an excellent vpn solution for some usecases.   

## Problem

I found no good way to deallocate algo-vpn resources after creation.

## Idea

Use terraform, that has a nice destroy feature to do the heavy lifting.

## Implementation

For coste efficiency aws lightsail is chosen. 
Biggest problem is that the firewall settings of the instance are not available in the terraform directives.

This is worked around by using boto3 to configure the instance and getting relevat info from terraform.

## Further things

algo-vpn could benefit form a "export a terraform file" option. 
