// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Jokenpo {
    enum Jogada { None, Pedra, Papel, Tesoura }

    address public owner;
    address public jogador1;
    address public jogador2;
    Jogada public jogada1;
    Jogada public jogada2;

    constructor() {
        owner = msg.sender;
        jogador1 = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Apenas o owner do contrato pode executar esta funcao");
        _;
    }

    function definirJogador2(address _jogador2) external onlyOwner {
        require(jogador2 == address(0), "Jogador2 ja definido");
        jogador2 = _jogador2;
    }

    function fazerJogada(Jogada _jogada) external {
        require(msg.sender == jogador1 || msg.sender == jogador2, "Voce nao participa do jogo");
        require(_jogada != Jogada.None, "Jogada invalida");

        if (msg.sender == jogador1) {
            jogada1 = _jogada;
        } else {
            jogada2 = _jogada;
        }
    }

    function verVencedor() external view returns (string memory) {
        require(jogada1 != Jogada.None && jogada2 != Jogada.None, "Ambos devem ter jogado antes de verificar o vencedor");

        if (jogada1 == jogada2) {
            return "Empate";
        }

        if (
            (jogada1 == Jogada.Pedra && jogada2 == Jogada.Tesoura) ||
            (jogada1 == Jogada.Tesoura && jogada2 == Jogada.Papel) ||
            (jogada1 == Jogada.Papel && jogada2 == Jogada.Pedra)
        ) {
            return "Jogador1";
        } else {
            return "Jogador2";
        }
    }
}