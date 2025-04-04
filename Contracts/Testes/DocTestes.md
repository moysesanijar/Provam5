Primeiro Teste:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol"; 
import "remix_accounts.sol"; 
import "../Contracts/jokenpo.sol"; 

contract TestJokenpo {

    Jokenpo jokenpo;
    address conta0; 
    address conta1; 

    function beforeAll() public {
        jokenpo = new Jokenpo();
        conta0 = TestsAccounts.getAccount(0);
        conta1 = TestsAccounts.getAccount(1);
    }
    function testApenasOwnerDefineJogador2() public {        
        jokenpo.definirJogador2(conta1);

        Assert.equal(
            jokenpo.jogador2(), 
            conta1, 
            "Jogador2 deveria ser igual a conta1"
        );
    }
}

Output: Teste 1.png


Segundo Teste: Esse não consegui fazer rodar, a visão era entender se o fluxo do jogo esta funcionando

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol";
import "remix_accounts.sol";
import "../Contracts/jokenpo.sol";


contract TestJokenpoFuncionando {
    Jokenpo jokenpo;
    jogador jogador;
    address conta1;

    function beforeAll() public {
        jokenpo = new Jokenpo();
        jogador = new jogador();
        conta1 = TestsAccounts.getAccount(1);
    }

    function testPartidaFuncionando() public {
        jokenpo.definirJogador2(address(jogador));
        jokenpo.fazerJogada(Jokenpo.Jogada.Pedra);
        jogador.fazerJogada(address(jokenpo), Jokenpo.Jogada.Tesoura);
        string memory vencedor = jokenpo.verVencedor();
        Assert.equal(vencedor, "Jogador1",);
    }
}