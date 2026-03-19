#!/usr/bin/env bash
# BREAK SCRIPT: запускает два экземпляра Jupyter Notebook на портах 8888 и 8889
# Для сопровождающих: симулирует ситуацию «несколько Jupyter-серверов — путаница».
# Студент должен: jupyter notebook list / ps / lsof — найти серверы, выбрать один, остановить лишние.
# Решение: см. solution.md
set -euo pipefail

echo "Подготовка: запуск двух Jupyter-серверов на портах 8888 и 8889..."
echo ""

# Проверяем, есть ли jupyter
if ! command -v jupyter &>/dev/null; then
    echo "Jupyter не найден. Установите: pip install jupyter notebook"
    echo "Или активируйте venv с установленным Jupyter."
    exit 1
fi

# Запускаем первый сервер в фоне на 8888
jupyter notebook --no-browser --port=8888 &
PID1=$!
sleep 2

# Запускаем второй сервер в фоне на 8889
jupyter notebook --no-browser --port=8889 &
PID2=$!
sleep 2

echo "Запущены два Jupyter-сервера:"
echo "  - Порт 8888 (PID $PID1)"
echo "  - Порт 8889 (PID $PID2)"
echo ""
echo "Проверьте: jupyter notebook list"
echo "Или: ps aux | grep jupyter"
echo ""
echo "Ваше задание: определить оба сервера, выбрать один для работы, остановить другой."
echo "Для остановки: kill $PID1 или kill $PID2 (или Ctrl+C в терминале, где запущен)."
echo ""
echo "Серверы работают в фоне. По завершении диагностики остановите их вручную."
