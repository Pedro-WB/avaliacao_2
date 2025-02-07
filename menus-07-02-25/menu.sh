#!/bin/bash

while true; do
    # Exibe o menu
    echo "Escolha uma opção:"
    echo "a -> Executar ping para um host (ip ou site)"
    echo "b -> Listar os usuários atualmente logados na máquina"
    echo "c -> Exibir o uso de memória e de disco da máquina"
    echo "d -> Verificar se um arquivo tem permissão de execução"
    echo "e -> Sair"

    # Lê a opção do usuário
    read -p "Digite a opção: " opcao

    case $opcao in
        a)
            # Solicita o host para o ping
            read -p "Digite o host (ip ou site): " host
            echo "Executando ping para $host..."
            ping -c 4 $host
            ;;
        b)
            # Lista os usuários logados
            echo "Usuários atualmente logados:"
            who
            ;;
        c)
            # Exibe o uso de memória e de disco
            echo "Uso de memória:"
            free -h
            echo "Uso de disco:"
            df -h
            ;;
        d)
            # Solicita o nome do arquivo para verificar permissão de execução
            read -p "Digite o nome do arquivo: " arquivo
            if [ -x "$arquivo" ]; then
                echo "O arquivo $arquivo tem permissão de execução."
            else
                echo "O arquivo $arquivo NÃO tem permissão de execução."
            fi
            ;;
        e)
            # Encerra o loop
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done

