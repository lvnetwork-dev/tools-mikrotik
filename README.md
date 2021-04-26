# Tools MikroTik

## O Tools MikroTik é um conjunto de ferramentas, criadas para automação algumas tarefas no RouterOS, as ferramentas são executadas diretamente no Terminal, para utiliza-las:

Configurar PPPoE Server com VLANs: </br>
/tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/pppoe.rsc" mode=http </br>
/import file-name="pppoe.rsc"</br>

Configurar VLANs Individuais: </br>
/tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/vlan.rsc" mode=http </br>
/import file-name="vlan.rsc"</br>

Configurar Script Failover: </br>
/tool fetch url="https://raw.githubusercontent.com/lvnetwork-dev/tools-mikrotik/master/failover.rsc" mode=http </br>
/import file-name="failover.rsc" </br>