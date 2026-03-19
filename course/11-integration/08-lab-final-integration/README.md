← [Назад](../07-lab-debug-pyenv-venv-conflict/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Лабораторная: Финальная — полный цикл

> **Модуль 11 · Лабораторная 8** | Время: ~60 мин

## Задание

Пройдите полный цикл разработки Python-проекта с Jupyter от нуля до готовности к передаче коллеге. Работа ведётся в директории `~/m11-final-project`.

Выполните по порядку:

1. **Инициализация**
   - Создайте директорию проекта `~/m11-final-project`.
   - Установите нужную версию Python через pyenv (например, 3.12.5) и привяжите её через `pyenv local`.
   - Создайте venv, активируйте его.

2. **Зависимости**
   - Установите `jupyter`, `ipykernel` и любую библиотеку (например, `requests`).
   - Создайте `requirements.txt` через `pip freeze`.
   - Создайте `.python-version` (он уже есть от pyenv local) и `.gitignore` (venv, __pycache__, .ipynb_checkpoints).

3. **Jupyter**
   - Зарегистрируйте venv как ядро Jupyter с именем `m11-final`.
   - Убедитесь, что Jupyter запускается и видит ядро.

4. **Воспроизведение**
   - Деактивируйте venv и удалите директорию venv.
   - Удалите зарегистрированное ядро `m11-final`.
   - Воссоздайте окружение заново: venv, `pip install -r requirements.txt`, ipykernel, регистрация ядра.
   - Убедитесь, что `import requests` и `jupyter --version` работают.

## Требования

- Проект в `~/m11-final-project`
- Файлы: `.python-version`, `requirements.txt`, `.gitignore`
- Ядро `m11-final` зарегистрировано
- Окружение воспроизводимо по `requirements.txt` и `.python-version`

## Подсказка 1

<details><summary>Показать подсказку</summary>

Используйте цепочку из тренажёра 01: pyenv local → venv → pip install → ipykernel install. Для воспроизведения — удалите venv и ядро, затем воссоздайте всё по файлам.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Команды: `jupyter kernelspec remove m11-final` для удаления ядра; `pyenv local 3.12.5` (или ваша версия) для привязки; `pip freeze > requirements.txt` для фиксации зависимостей.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полный цикл воспроизведения: `cd ~/m11-final-project`, `pyenv local $(cat .python-version)`, `python -m venv venv`, `source venv/bin/activate`, `pip install -r requirements.txt`, `python -m ipykernel install --user --name m11-final --display-name "Python (m11-final)"`.

</details>

## Самопроверка

```bash
cd ~/m11-final-project
source venv/bin/activate
python -c "import requests; print('OK')"
jupyter kernelspec list | grep m11-final
```

**Ожидаемый результат:**

```
OK
  m11-final    /home/USER/.local/share/jupyter/kernels/m11-final
```

---
← [Назад](../07-lab-debug-pyenv-venv-conflict/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)
