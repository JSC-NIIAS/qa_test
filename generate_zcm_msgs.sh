REPO_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

zcm-gen --python --ppath ${REPO_PATH}/zcm_types/py ${REPO_PATH}/zcm_types/service.zcm \
                                                   ${REPO_PATH}/zcm_types/orientus.zcm
