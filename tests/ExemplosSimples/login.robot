*** Settings ***

Documentation   
...     Validar RobotFramework com Java Swing usando a Library RemoteSwingLibrary

#Essa é a forma de importar do Robot
Library             RemoteSwingLibrary 
Suite Setup         Start Test Application
Test Teardown       Close Application

#Utilizando variavel para informar o caminho do meu JNPL 
#Aqui voce poderia passar o embarcado com java -jar
***Variables***

#Quando windows usar \\
${JNLP_URL}         C:\\temp\\minhaApp.jnlp

***Test Cases***
POC Login no Sistema 
#Formato em BDD meramente ilustrativo
#Que precisa saber aqui é que cada frase do Test Case será implementada em Keywords

    Dado que informe minhas credenciais
    Quando logar no sistema
    Então eu quero ver a página principal

***Keywords****
#Como declaramos essa palavra reservada no Suite Setup , aqui é a aimplementação para abrir sua apliação
#Usado timeout para casos de delay para abrir a dialog 

Start Test Application
    Start Application       minhaApp    javaws ${JNLP_URL}  timeout=30

Dado que informe minhas credenciais
    Select Dialog           regexp=^C.* 
    Type Into Textfield     componentUser        myusername
    Type Into Textfield     componetpasswor      mypassword

Quando logar no sistema
#Voce pode passar o nome do Botao ou o id do Button
    Push Button             NomeBotaoLogin 

Então eu quero ver a página principal
#Essa implementacao faz a validacao, vai selecionar seu form logado
#Vai pegar o valor do componentUser
#Should Be Equal vai verificar se o valor armazenado no componente é o correpondente ao usuario informado no login
    Select Main Window
    ${textFieldValue}=     Get Textfield Value     componentUser   
    Should Be Equal        componentUser            ${textFieldValue}

Close Application
    Select Main Window
    Close Window            regexp=^C.*
    
