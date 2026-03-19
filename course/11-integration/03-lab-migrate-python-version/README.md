← [Назад](../02-trainer-project-jupyterlab/README.md) | [Оглавление](../../README.md) | [Далее →](../04-lab-two-projects/README.md)

# Лабораторная: Переключение проекта на другую версию Python (миграция)

> **Модуль 11 · Лабораторная 3** | Время: ~30 мин

## Задание

У вас есть проект `~/m11-project-from-scratch` (или аналогичный из тренажёра 01) с Python 3.11.x, venv, Jupyter и зарегистрированным ядром. Мигрируйте проект на **другую версию Python** (например, 3.12.x, если сейчас 3.11, или наоборот).

После миграции:
- В директории проекта `pyenv version` должен показывать новую версию.
- venv должен быть пересоздан на базе новой версии Python.
- `pip install -r requirements.txt` должен установить зависимости в новое venv.
- Ядро Jupyter должно быть перерегистрировано и работать.

## Требования

1. Установите целевую версию Python через pyenv (если ещё не установлена).
2. Обновите `.python-version` в проекте.
3. Удалите старый venv и создайте новый на базе новой версии.
4. Восстановите зависимости из `requirements.txt`.
5. Перерегистрируйте venv как ядро Jupyter (удалите старое ядро при необходимости).
6. Проверьте: Jupyter запускается, ядро корректно выполняет код.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Порядок миграции важен. Сначала обновите `.python-version` и убедитесь, что `python` указывает на новую версию. Только после этого пересоздавайте venv.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Старое ядро Jupyter может остаться в `~/.local/share/jupyter/kernels/` и ссылаться на удалённый venv. Удалите его командой `jupyter kernelspec remove <имя>`, затем зарегистрируйте новое окружение через `python -m ipykernel install`.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полная последовательность: `pyenv install 3.12.x` → `pyenv local 3.12.x` → `deactivate` (если venv активирован) → `rm -rf venv` → `python -m venv venv` → `source venv/bin/activate` → `pip install -r requirements.txt` → `jupyter kernelspec remove m11-from-scratch` (если было) → `python -m ipykernel install --user --name m11-from-scratch --display-name "Python (m11-from-scratch)"`.

</details>

## Самопроверка

```bash
cd ~/m11-project-from-scratch
pyenv version
# Должно показать целевую версию (например, 3.12.x)

source venv/bin/activate
python --version
# Должно совпадать с pyenv version

python -c "import jupyter; print('OK')"
# OK

jupyter kernelspec list | grep m11-from-scratch
# m11-from-scratch должен быть в списке
```

**Ожидаемый результат:** все команды выполняются без ошибок, версия Python в venv соответствует `.python-version`.

---
← [Назад](../02-trainer-project-jupyterlab/README.md) | [Оглавление](../../README.md) | [Далее →](../04-lab-two-projects/README.md)
