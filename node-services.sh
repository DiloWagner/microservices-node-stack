#!/usr/bin/env bash
#
# Funções shellscript auxiliares ao Makefile.
#
# Todas as funções presentes neste arquivo estão mapeadas no Makefile e podem
# ser executas pelo programa make. Ex $ make build
# Nem todas as opções do Makefile estão neste arquivo. Apenas as que demandam
# maior complexidade.
#
# Autor: Diego Wagner e André Luiz Haag
# See: https://google.github.io/styleguide/shell.xml

# Global vars
HELP_MSG="
Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
i,   install      Instala funções de atalho no terminal do usuário atual para manipulação dos containers
b,   build        Baixa imagensa base caso necessŕio e compila os containers
up,  start        Inicia os serviços
s    stop         Para os serviços em execução
rm,  remove       Para os containers e remove imagens compiladas
rmd, remove-data  Remove dados armazenados pelos SGBDs

h,   help         Obtem ajuda
V,   version      Mostra a versão
"
install=0
build=0
start=0
stop=0
remove=0
remove_data=0
help=0
version=0

# TODO: implementar metodo 'cfg_validate' para validar configurações de .env

start()
{
    docker-compose up --force-recreate
}

stop()
{
    docker-compose stop
}

#######################################
# Instala funções extras no bash do usuário para manipulação de containers.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
build ()
{
    # build services
    docker-compose build --force-rm
}

help()
{
    echo -e "$HELP_MSG"
    exit 0
}

#
# Main
#######################################

# tratamento das entradas da linha de comando
while test -n "$1"
do
    case "$1" in
        i   | install     ) install=1     ;;
        b   | build       ) build=1       ;;
        up  | start       ) start=1       ;;
        s   | stop        ) stop=1        ;;
        rm  | remove      ) remove=1      ;;
        rmd | remove-data ) remove_data=1 ;;
        h   | help        ) help=1        ;;
        V   | version     ) version=1     ;;
        *                    )
            echo "Opção inválida: $1"
            exit 1
    esac
    shift
done

#MYSQL_VERSION="$(awk -F "=" '/MYSQL_VERSION/ {print $2}' .env)"
#echo "$MYSQL_VERSION"
if [ $build == 1 ]; then
    build
fi

if [ $start == 1 ]; then
    start
fi

if [ $stop == 1 ]; then
    stop
fi

# realiza chamas as funções de acordo com os opções
if [ $help == 1 ]; then
    help
fi

exit 0
