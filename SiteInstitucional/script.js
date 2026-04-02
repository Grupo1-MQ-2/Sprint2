// Declaração de variáveis Globais

function Entrar(){

        let cliente = ipt_email_user.value
        let senhaCliente = ipt_senha_user.value

        let cliente1 = `simpaticoCliente@gmail.com`
        let senha1 = `simpaticaSenha123`;

        if(cliente != cliente1 || senhaCliente != senha1)
        {
            alert(`Usuário não cadastrado!`)
        }
        else 
        {
            alert(`Conectado! Bem vindo '${cliente}'!`)
        }

        ipt_email_user.value = " ";
        ipt_senha_user.value = "";
    } 

function Cadastrar(){
    let email = ipt_email_user.value.trim();
    let CNPJ = ipt_CNPJ.value.trim();
    let senha = ipt_senha_user.value.trim();
    let confirmacaoSenha = ipt_confirmaSenha.value.trim();

    if(!email.includes('@') || !email.includes('.')){
        alert("/ Email deve conter @ e um domínio! /");
    }
    else if(CNPJ.length != 14) // CNPJ tem que ter exatos 14 caracteres! (Sem pontuações)
    {
        alert("/ O CNPJ deve ter 14 Caracteres! /")
    }
    else if(senha.length < 8) // Senha deve ter no minimo 8 caracteres!
    {
        alert("/ Senha deve ter no minimo 8 caracteres! /")
    }
    else if (confirmacaoSenha != senha)
    {
        alert("As senhas não estão iguais!");
    }
    else
    {
        alert("Usuário Criado!");
    }

    
    
}
