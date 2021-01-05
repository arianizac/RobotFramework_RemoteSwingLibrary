*** Settings ***

Documentation   
...     Objetivo: Fazer um login em aplicação Java Swing usando a Library RemoteSwingLibrary do Robot Framework

#Essa é a forma de importar do Robot
Library             RemoteSwingLibrary 
Suite Setup         Start Test Application
Test Teardown       Close Application

#Utilizando variavel para informar o caminho do meu JNPL 

***Variables***

#Quando windows usar \\
${JNLP}         C:\\temp\\minhaApp.jnlp

***Test Cases***
Logar no Sistema com Sucesso 
#Formato em BDD meramente ilustrativo
#O que precisa saber aqui é que cada frase do Test Case será implementada em Keywords

    Dado que informe minhas credenciais
    Quando logar no sistema
    Então eu quero ver a página principal

***Keywords****
#Como declaramos essa palavra reservada no Suite Setup , aqui é a implementação para abrir sua aplicação
#Usado timeout para casos de delay para abrir a Dialog que informará user e senha

Start Test Application
    Start Application       minhaApp    javaws ${JNLP}  timeout=30

Dado que informe minhas credenciais
    Select Dialog           regexp=^C.* 
    Type Into Textfield     componentUser          myusername
    Type Into Textfield     componentPassword      mypassword

Quando logar no sistema
#Voce pode passar o nome do Botao ou o id do Button
    Push Button             NomeBotaoLogin 

Então eu quero ver a página principal
#Essa implementacao faz a validacao de que está logado
#Então, vai selecionar seu form logado com Select Main Window
#Vai pegar o valor do componentUser atribuindo a variável  ${textFieldValue} o valor obritdo em Get Textfield Value     componentUser 
#Should Be Equal vai verificar se o valor armazenado no componente é o correspondente ao usuario informado no login
    Select Main Window
    ${textFieldValue}=     Get Textfield Value     componentUser   
    Should Be Equal        componentUser            ${textFieldValue}

#Aqui será a implementação da palavra reservada utilizada no Test Teardown
#No Java Swing para achar os elementos é necessário sempre dar foco na Dialog/Form que está trabalhando
Close Application
    Select Main Window
    Close Window            regexp=^C.*
    
