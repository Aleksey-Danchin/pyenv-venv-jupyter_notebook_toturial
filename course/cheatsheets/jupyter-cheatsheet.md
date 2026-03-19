# Справочник: Jupyter

> Краткий справочник команд Jupyter, Notebook и работы с ядрами. Подробности — в соответствующих уроках.

## Установка

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip install jupyter notebook` | Установить Jupyter в активированное venv | `pip install jupyter notebook` |
| `jupyter --version` | Показать версии компонентов Jupyter | `jupyter --version` |
| `which jupyter` | Проверить, какой jupyter используется (должен быть из venv) | `which jupyter` |

## Ядра (kernels)

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip install ipykernel` | Установить ipykernel в окружение | `pip install ipykernel` |
| `python -m ipykernel install --user --name=<имя> --display-name="<отображаемое имя>"` | Зарегистрировать окружение как ядро Jupyter | `python -m ipykernel install --user --name myenv --display-name "Python (myenv)"` |
| `jupyter kernelspec list` | Показать зарегистрированные ядра | `jupyter kernelspec list` |
| `jupyter kernelspec remove <имя>` | Удалить ядро | `jupyter kernelspec remove myenv` |

## Запуск сервера

| Команда | Описание | Пример |
|---------|----------|--------|
| `jupyter notebook` | Запустить Jupyter Notebook (порт 8888 по умолчанию) | `jupyter notebook` |
| `jupyter notebook --port <N>` | Запустить на указанном порту | `jupyter notebook --port 8889` |
| `jupyter notebook --no-browser` | Запустить без автоматического открытия браузера | `jupyter notebook --no-browser` |
| `jupyter notebook list` | Показать запущенные серверы (если доступно) | `jupyter notebook list` |

## Экспорт ноутбука (nbconvert)

| Команда | Описание | Пример |
|---------|----------|--------|
| `jupyter nbconvert --to html <файл>` | Экспорт ноутбука в HTML | `jupyter nbconvert --to html notebook.ipynb` |
| `jupyter nbconvert --to script <файл>` | Экспорт в Python-скрипт (.py) | `jupyter nbconvert --to script notebook.ipynb` |
| `jupyter nbconvert --to pdf <файл>` | Экспорт в PDF (требует LaTeX) | `jupyter nbconvert --to pdf notebook.ipynb` |

## JupyterLab

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip install jupyterlab` | Установить JupyterLab в venv | `pip install jupyterlab` |
| `jupyter lab` | Запустить JupyterLab (порт 8888 по умолчанию) | `jupyter lab` |
| `jupyter lab --port=<N>` | Запустить на указанном порту | `jupyter lab --port=8889` |
| `jupyter lab --no-browser` | Запустить без автозапуска браузера | `jupyter lab --no-browser` |
