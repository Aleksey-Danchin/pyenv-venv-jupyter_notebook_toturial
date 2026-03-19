← [Назад](../04-lab-export-reproduce/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Лабораторная: Итоговая по Jupyter

> **Модуль 8 · Лабораторная 05** | Время: ~45 мин

## Задание

Создайте проект `~/lab-jupyter-final` и выполните **полный цикл** от нуля до воспроизводимого ноутбука.

1. **Окружение:**
   - pyenv local (версия Python на выбор)
   - venv в `venv/`
   - Установить: jupyter, notebook, ipykernel, matplotlib
   - Зарегистрировать venv как ядро Jupyter (display-name: `Python (lab-jupyter-final)`)

2. **Ноутбук `final.ipynb`:**
   - Markdown-ячейка: заголовок и краткое описание проекта
   - Code: загрузка данных (встроенный список/словарь), визуализация (matplotlib)
   - Code: хотя бы одна магическая команда (`%timeit`, `%env` или `!pip list`)
   - Markdown: итог или выводы

3. **Экспорт и воспроизведение:**
   - `jupyter nbconvert --to html final.ipynb`
   - `pip freeze > requirements.txt`
   - Добавить в корень `.python-version` (или указать версию в README, если используется pyenv)

4. **Симуляция передачи:**
   - Удалить venv
   - Пересоздать окружение: `python -m venv venv`, `pip install -r requirements.txt`
   - Убедиться, что Jupyter запускается и ядро `Python (lab-jupyter-final)` доступно (после пересоздания venv — зарегистрировать ядро заново)

## Требования

- Директория `~/lab-jupyter-final`
- venv, Jupyter, ipykernel, matplotlib
- Ядро `Python (lab-jupyter-final)` зарегистрировано
- Файлы: `final.ipynb`, `final.html`, `requirements.txt`
- Ноутбук содержит: Markdown (описание), Code (данные + matplotlib), магическую команду, Markdown (итоги)

## Подсказка 1

<details><summary>Показать подсказку</summary>

Структура: pyenv local → venv → pip install jupyter notebook ipykernel matplotlib → python -m ipykernel install --user --name lab-jupyter-final --display-name "Python (lab-jupyter-final)". Jupyter notebook → создать final.ipynb.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Магические команды: `%timeit sum(range(1000))` или `%env` для переменных, `!pip list` для списка пакетов. Вставьте в отдельную Code-ячейку.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

После пересоздания venv ядро остаётся в `~/.local/share/jupyter/kernels/`, но указывает на старый (удалённый) путь. Нужно заново выполнить `python -m ipykernel install --user --name lab-jupyter-final --display-name "Python (lab-jupyter-final)"` из активированного venv.

</details>

## Самопроверка

```bash
cd ~/lab-jupyter-final
source venv/bin/activate
jupyter kernelspec list | grep -i lab-jupyter-final
ls -la final.ipynb final.html requirements.txt
```

**Ожидаемый результат:** ядро в списке, все три файла существуют.

---
← [Назад](../04-lab-export-reproduce/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)
