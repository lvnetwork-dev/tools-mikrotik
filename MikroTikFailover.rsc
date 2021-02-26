:put "-- Carregando Script --"
:put ""
:delay 2s

:put "Digite o Gateway Default:"
:global readGateway do={:return}
:local gateway [$readGateway]
:put ""
:delay 1s

:put "Digite o Comentario da Rota: [EX: ROTA-DEFAULT]"
:global readComment do={:return}
:local comment [$readComment]
:put ""
:delay 1s

:put "Digite o Distancia da Rota:"
:global readDistance do={:return}
:local distance [$readDistance]
:put ""
:put "[Configurando a Rota Default]"
:put ""
:put "Gateway: $gateway / Comentario: $comment / Distancia: $distance"
:log warning "Gateway: $gateway / Comentario: $comment / Distancia: $distance"
:log error "Configurando a Rota Default"
:put ""
:put "Configurando a Rota Default"
:put ""
/ip route add gateway=$gateway comment=$comment distance=$distance
:delay 3s

:put "Digite o primeiro IP a ser monitorado: [EX: 1.0.0.1]"
:global readFristIP do={:return}
:local fristIP [$readFristIP]
:put ""
:delay 1s

:put "Digite o Comentario do primeiro IP: [EX: CLOUDFLARE]"
:global readCommentFristIP do={:return}
:local commentFristIP [$readCommentFristIP]
:put ""
:put "[Configurando Netwatch]"
:put ""
:put "Primeiro IP: $fristIP / Comentario: $commentFristIP"
:log warning "Primeiro IP: $fristIP / Comentario: $commentFristIP"
:put ""
:put "Configurando a Rota"
:put ""
:log error "Configurando a Rota"
/ip route add dst-address=$fristIP gateway=$gateway comment="Monitora_$commentFristIP"
:delay 3s


:put "Digite o segundo IP a ser monitorado: [EX: 8.8.4.4]"
:global readSecondIP do={:return}
:local secondIP [$readSecondIP]
:put ""
:delay 1s

:put "Digite o Comentario do segundo IP: [EX: GOOGLE]"
:global readCommentSecondIP do={:return}
:local commentSecondIP [$readCommentSecondIP]
:put ""
:put "[Configurando Netwatch]"
:put ""
:put "Segundo IP: $secondIP / Comentario: $commentSecondIP"
:log warning "Segundo IP: $secondIP / Comentario: $commentSecondIP"
:put ""
:log error "Configurando a Rota"
/ip route add dst-address=$secondIP gateway=$gateway comment="Monitora_$commentSecondIP"
:delay 3s


:put "Digite o terceiro IP a ser monitorado: [EX: 208.67.220.220]"
:global readThirdIP do={:return}
:local thirdIP [$readThirdIP]
:put ""
:delay 1s

:put "Digite o Comentario do terceiro IP: [EX: OPENDNS]"
:global readCommentThirdIP do={:return}
:local commentThirdIP [$readCommentThirdIP]
:put ""
:put "[Configurando Netwatch]"
:put ""
:put "Terceiro IP: $thirdIP / Comentario: $commentThirdIP"
:log warning "Terceiro IP: $thirdIP / Comentario: $commentThirdIP"
:put ""
:log error "Configurando a Rota"
/ip route add dst-address=$thirdIP gateway=$gateway comment="Monitora_$commentThirdIP"
:delay 3s

:put "[Configurando Scripts]"
:put ""
/system script add name=CHECK_1_DOWN dont-require-permissions=yes source=":delay 5s\n\r\n/tool netwatch enable numbers=[find comment=\"CHECK_2\"]\n\r\n:delay 2s\n\r\n/tool netwatch disable numbers=[find comment=\"CHECK_1\"]"

/system script add name=CHECK_1_UP dont-require-permissions=yes source=":delay 15s\n\r\nip route set distance=\"$distance\" numbers=[find comment=\"$comment\"]\n\r\n:delay 2s\n\r\n/tool netwatch disable numbers=[find comment=\"CHECK_2\"]"

/system script add name=CHECK_2_DOWN dont-require-permissions=yes source=":delay 5s\n\r\n/tool netwatch enable numbers=[find comment=\"CHECK_3\"]\n\r\n:delay 2s\n\r\n/tool netwatch disable numbers=[find comment=\"CHECK_2\"]"

/system script add name=CHECK_2_UP dont-require-permissions=yes source=":delay 15s\n\r\n/tool netwatch enable numbers=[find comment=\"CHECK_1\"]\n\r\n:delay 2s\n\r\n/tool netwatch disable numbers=[find comment=\"CHECK_2\"]"

/system script add name=CHECK_3_DOWN dont-require-permissions=yes source=":delay 5s\n\r\n/ip route set distance=($distance+2) numbers=[find comment=\"$comment\"]"

/system script add name=CHECK_3_UP dont-require-permissions=yes source=":delay 15s\n\r\n/tool netwatch enable numbers=[find comment=\"CHECK_2\"]\n\r\n:delay 2s\n\r\n/tool netwatch disable numbers=[find comment=\"CHECK_3\"]"

:delay 3s

:put "[Configurando Netwatch]"
:put ""
/tool netwatch add host=$fristIP up-script="CHECK_1_UP" down-script="CHECK_1_DOWN" comment="CHECK_1"
/tool netwatch add host=$secondIP up-script="CHECK_2_UP" down-script="CHECK_2_DOWN" comment="CHECK_2" disabled=yes
/tool netwatch add host=$thirdIP up-script="CHECK_3_UP" down-script="CHECK_3_DOWN" comment="CHECK_3" disabled=yes

:delay 3s

:put "[NETWATCH PRONTO!]"

/file remove MikroTikFailover.rsc