*** Settings ***

Documentation   
...     Objetivo: Abrir uma tela clicando em um menu

Library             RemoteSwingLibrary 

***Test Cases***

Acessar tela de cadastro de cliente
    Clicar no menu da tela cadastro de cliente

Sair do Sistema através do menu
    Clicar no menu para sair do Sistema

***Keywords****

Clicar no menu da tela cadastro de cliente
    #Para manipular os elementos é preciso dar foco na tela
    Select Main Window
    #Com essa palavra reservada você clica no menu e espera a tela ser carregada
    # Na estrura, ficaria Select From Menu And Wait  Menu Principal|Sub-Menu1|Sub-Menu2
    # Digamos que nesse exemplo, o caminho do menu para abirir a tela de Cadastro de Clientes seja: Cadastros -> Cliente -> Cadastro de Cliente
    Select From Menu And Wait      Cadastros|Cliente|Cadastro de Cliente

Clicar no menu para sair do Sistema
    Select Main Window
    #Nesse caso não temos que esperar nada ser aberto então uma outra opção para manipular menu seria o:
    #Na estrutura, ficaria  Select From Menu Menu|sub-menu
    Select From Menu       Principal|Sair