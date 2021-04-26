![MikroTik](https://i.mt.lv/img/mt/v2/logo.svg)
 
## Tools MikroTik
 
O Tools MikroTik é um conjunto de ferramentas, criadas para automatizar algumas tarefas no RouterOS, as ferramentas são executadas diretamente no Terminal
 
 
## Como Utilizar: 
  
* PPPoE Server com VLANs:
>   /tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/pppoe.rsc" mode=http
> 	/import file-name="pppoe.rsc"

* VLANs Individuais:
>   /tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/vlan.rsc" mode=http
> 	/import file-name="vlan.rsc"

* Script Failover:
>   /tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/failover.rsc" mode=http
> 	/import file-name="failover.rsc"