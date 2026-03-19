#!/usr/bin/env bash
# BREAK SCRIPT: удаляет строки инициализации pyenv из ~/.bashrc
# Для сопровождающих: этот скрипт имитирует ситуацию, когда pyenv установлен,
# но инициализация в .bashrc отсутствует (удалена или не была добавлена).
# Решение: см. solution.md
set -euo pipefail

BASHRC="$HOME/.bashrc"

if [[ ! -f "$BASHRC" ]]; then
    echo "Файл $BASHRC не найден."
    exit 1
fi

cp "$BASHRC" "$BASHRC.bak.pyenv-debug"
echo "Резервная копия: $BASHRC.bak.pyenv-debug"

sed -i '/PYENV_ROOT/d' "$BASHRC"
sed -i '/pyenv init/d' "$BASHRC"
sed -i '/\.pyenv\/bin/d' "$BASHRC"

echo ""
echo "Окружение подготовлено. Строки инициализации pyenv удалены из ~/.bashrc."
echo ""
echo "Откройте НОВЫЙ терминал (или выполните: exec \"\$SHELL\") и прочитайте задание в README.md."
echo ""
echo "Для отката (если нужно вернуть всё как было):"
echo "  cp $BASHRC.bak.pyenv-debug $BASHRC && exec \"\$SHELL\""
