#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Użycie: $0 <liczba_krokow> <dt>"
    echo "Przykład: $0 10000 1e-5"
    exit 1
fi

STEPS="$1"
DT="$2"
INTERVAL=100

# Wyliczenie ostatniego indeksu (dla 10000 daje 9900)
MAX_FRAME=$(( STEPS - INTERVAL ))

RUN_DIR="/code/res/${DT}"
DATA_DIR="${RUN_DIR}/data"
ANIM_FILE="${RUN_DIR}/heat_2d_${STEPS}.gif"

# Przygotowanie podfolderu na pliki out_*.data
mkdir -p "${DATA_DIR}"

echo "=== [1/2] Obliczenia: kroki = ${STEPS}, dt = ${DT} ==="
(
    cd "${DATA_DIR}"
    /code/build/examples/heat_2d "${STEPS}" "${DT}"
)

echo "=== [2/2] Renderowanie GIF: klatki 0..${MAX_FRAME} (co ${INTERVAL}) ==="
gnuplot \
    -e "title='heat2D (kroki: ${STEPS}, dt=${DT})'" \
    -e "data_dir='${DATA_DIR}'" \
    -e "out_gif='${ANIM_FILE}'" \
    -e "max_step=${MAX_FRAME}" \
    /code/anim.gp

echo "Gotowe!"
echo "  Pliki danych: ${DATA_DIR}/out_*.data"
echo "  Animacja:     ${ANIM_FILE}"