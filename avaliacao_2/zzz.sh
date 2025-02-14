#!/bin/bash

exibe_menu() {
    clear
    echo "========================="
    echo "Escolha uma opção:"
    echo "1. Criar novo arquivo .zip"
    echo "2. Usar arquivo .zip existente"
    echo "3. Sair"
    echo "========================="
    read -p "Digite sua escolha (1-3): " escolha
}

listar_conteudo_zip() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        echo "Conteúdo do arquivo $zzz:"
        unzip -l "$zzz"
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

listar_conteudo_com_cor() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        echo "Conteúdo do arquivo $zzz:"
        unzip -l "$zzz" | while read lll; do
            if [[ "$lll" == *"/"* ]]; then
                echo -e "\033[34m$lll\033[0m" # Azul para diretórios
            elif [[ "$lll" == *".sh"* || "$lll" == *".bin"* ]]; then
                echo -e "\033[32m$lll\033[0m" # Verde para executáveis
            else
                echo "$lll"
            fi
        done
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

pre_visualizar_arquivo() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        read -p "Digite o nome do arquivo para pré-visualizar: " nzz
        unzip -p "$zzz" "$nzz"
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

adicionar_arquivos() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        read -p "Digite os arquivos que deseja adicionar (separados por espaço): " szz
        zip "$zzz" $szz
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

remover_arquivos() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        read -p "Digite os arquivos que deseja remover (separados por espaço): " szz
        zip -d "$zzz" $szz
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

extrair_conteudo() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        unzip "$zzz"
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

extrair_arquivos() {
    clear
    read -p "Digite o caminho do arquivo .zip: " zzz
    if [ -f "$zzz" ]; then
        read -p "Digite os arquivos que deseja extrair (separados por espaço): " szz
        unzip "$zzz" $szz
    else
        echo "Arquivo não encontrado."
    fi
    read -p "Pressione qualquer tecla para continuar..." aaa
}

principal() {
    while true; do
        exibe_menu
        case $escolha in
            1) # Criar novo arquivo .zip
                read -p "Digite o nome do novo arquivo .zip: " ggg
                zip -r "$ggg" .
                echo "Novo arquivo .zip $ggg criado!"
                read -p "Pressione qualquer tecla para continuar..." aaa
                ;;
            2) # Usar arquivo .zip existente
                while true; do
                    clear
                    echo "========================="
                    echo "Escolha uma opção:"
                    echo "1. Listar conteúdo do arquivo .zip"
                    echo "2. Listar conteúdo com cor"
                    echo "3. Pré-visualizar arquivo dentro do .zip"
                    echo "4. Adicionar arquivos ao .zip"
                    echo "5. Remover arquivos do .zip"
                    echo "6. Extrair todo o conteúdo do .zip"
                    echo "7. Extrair arquivos específicos do .zip"
                    echo "8. Voltar"
                    echo "========================="
                    read -p "Digite sua escolha (1-8): " escolha_interna
                    case $escolha_interna in
                        1) listar_conteudo_zip ;;
                        2) listar_conteudo_com_cor ;;
                        3) pre_visualizar_arquivo ;;
                        4) adicionar_arquivos ;;
                        5) remover_arquivos ;;
                        6) extrair_conteudo ;;
                        7) extrair_arquivos ;;
                        8) break ;;
                        *) echo "Opção inválida!" ;;
                    esac
                done
                ;;
            3) # Sair
                echo "Saindo..."
                break
                ;;
            *) echo "Opção inválida!" ;;
        esac
    done
}

principal

