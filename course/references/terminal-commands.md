# Справочник команд терминала

> Команды терминала, встречающиеся в курсе. Это побочный справочный материал: знания по терминалу здесь не являются отдельной целью курса.

## Поиск исполняемых файлов


| Команда   | Описание                                                                               | Пример            |
| --------- | -------------------------------------------------------------------------------------- | ----------------- |
| `which`   | Показывает путь к исполняемому файлу, который будет запущен первым по текущему `PATH`. | `which python3`   |
| `whereis` | Показывает известные системе расположения бинарей, исходников и man-страниц.           | `whereis python3` |
| `type -a` | Показывает, как shell интерпретирует имя команды и какие варианты доступны.            | `type -a python3` |


## Переменные окружения и shell


| Команда      | Описание                                                   | Пример            |
| ------------ | ---------------------------------------------------------- | ----------------- |
| `echo $PATH` | Выводит текущее значение переменной `PATH`.                | `echo $PATH`      |
| `command -v` | Возвращает путь к команде в формате, удобном для скриптов. | `command -v pip3` |


## Файлы и симлинки


| Команда       | Описание                                                            | Пример                         |
| ------------- | ------------------------------------------------------------------- | ------------------------------ |
| `ls -l`       | Показывает подробный список файлов, включая информацию о симлинках. | `ls -l /usr/bin/python3`       |
| `readlink -f` | Разворачивает цепочку симлинков до конечного файла.                 | `readlink -f /usr/bin/python3` |


## Python и pip


| Команда                    | Описание                                                                | Пример                     |
| -------------------------- | ----------------------------------------------------------------------- | -------------------------- |
| `python3 -m site`          | Показывает пути Python, включая директории `site-packages`.             | `python3 -m site`          |
| `pip3 --version`           | Показывает версию pip и путь к Python, с которым связан этот pip.       | `pip3 --version`           |
| `python3 -m pip --version` | Показывает pip, запущенный строго через выбранный интерпретатор Python. | `python3 -m pip --version` |


## pip: установка и управление пакетами


| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `pip install <package>` | Устанавливает пакет из PyPI. | `pip install requests` |
| `pip install <package>==<version>` | Устанавливает конкретную версию пакета. | `pip install rich==13.7.0` |
| `pip uninstall <package>` | Удаляет установленный пакет. | `pip uninstall requests` |
| `pip install --upgrade <package>` | Обновляет пакет до последней версии. | `pip install --upgrade requests` |
| `pip show <package>` | Показывает метаданные установленного пакета. | `pip show requests` |
| `pip list` | Показывает список установленных пакетов в удобочитаемом формате. | `pip list` |
| `pip freeze` | Показывает установленные пакеты в формате `package==version` (для requirements.txt). | `pip freeze` |
| `pip install -r <file>` | Устанавливает пакеты из файла зависимостей. | `pip install -r requirements.txt` |
| `pip cache dir` | Показывает путь к директории кеша pip. | `pip cache dir` |
| `pip cache purge` | Очищает кеш pip. | `pip cache purge` |


## Загрузка и установка


| Команда | Описание                                                          | Пример                                |
| ------- | ----------------------------------------------------------------- | ------------------------------------- |
| `curl`  | Загружает данные по URL. Используется для установки pyenv и др.   | `curl https://pyenv.run \| bash`      |
| `dpkg -l` | Показывает список установленных системных пакетов.              | `dpkg -l \| grep libssl-dev`          |


## pyenv


| Команда                     | Описание                                                                  | Пример                          |
| --------------------------- | ------------------------------------------------------------------------- | ------------------------------- |
| `pyenv --version`           | Показывает версию установленного pyenv.                                   | `pyenv --version`               |
| `pyenv install <version>`   | Компилирует и устанавливает указанную версию Python.                      | `pyenv install 3.12.0`          |
| `pyenv install --list`      | Показывает все доступные для установки версии Python.                     | `pyenv install --list`          |
| `pyenv versions`            | Показывает все установленные версии Python (активная отмечена `*`).       | `pyenv versions`                |
| `pyenv version`             | Показывает текущую активную версию Python и источник настройки.           | `pyenv version`                 |
| `pyenv global <version>`    | Устанавливает глобальную версию Python (для всех терминалов).            | `pyenv global 3.12.0`          |
| `pyenv local <version>`     | Привязывает версию Python к текущей директории (создаёт `.python-version`). | `pyenv local 3.11.7`        |
| `pyenv local --unset`       | Удаляет файл `.python-version` из текущей директории.                    | `pyenv local --unset`           |
| `pyenv shell <version>`     | Устанавливает версию Python для текущей сессии терминала.                | `pyenv shell 3.13.0`           |
| `pyenv shell --unset`       | Сбрасывает сессионную версию Python.                                     | `pyenv shell --unset`           |
| `pyenv uninstall <version>` | Удаляет установленную версию Python.                                     | `pyenv uninstall 3.11.7`       |


## venv: виртуальные окружения

| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `python -m venv <dir>` | Создаёт виртуальное окружение в указанной директории. | `python -m venv venv` |
| `python -m venv --system-site-packages <dir>` | Создаёт venv с доступом к системным пакетам. | `python -m venv --system-site-packages venv` |
| `source <venv>/bin/activate` | Активирует venv в bash/zsh (Linux/macOS). | `source venv/bin/activate` |
| `deactivate` | Деактивирует текущее виртуальное окружение. | `deactivate` |
| `echo $VIRTUAL_ENV` | Показывает путь к активированному окружению (пусто, если не активировано). | `echo $VIRTUAL_ENV` |
| `rm -rf <venv>/` | Удаляет виртуальное окружение (деактивировать перед удалением). | `rm -rf venv/` |

## Jupyter Notebook: установка и запуск

| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `pip install jupyter notebook` | Устанавливает Jupyter Notebook в активированное окружение. | `pip install jupyter notebook` |
| `jupyter --version` | Показывает версии компонентов Jupyter (notebook, ipykernel и др.). | `jupyter --version` |
| `jupyter notebook` | Запускает Jupyter Notebook (сервер по умолчанию на порту 8888). | `jupyter notebook` |
| `jupyter nbconvert --to <формат> <файл>` | Конвертирует ноутбук в указанный формат (html, pdf, script). | `jupyter nbconvert --to html notebook.ipynb` |

## Jupyter: ядра (kernels)

| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `pip install ipykernel` | Устанавливает ipykernel в текущее окружение Python. | `pip install ipykernel` |
| `python -m ipykernel install --user --name=... --display-name=...` | Регистрирует окружение как ядро Jupyter. | `python -m ipykernel install --user --name myenv --display-name "Python (myenv)"` |
| `jupyter kernelspec list` | Показывает зарегистрированные ядра и пути к их описаниям. | `jupyter kernelspec list` |
| `jupyter kernelspec remove <имя>` | Удаляет ядро по имени. | `jupyter kernelspec remove myenv` |
| `jupyter notebook --port <N>` | Запускает Jupyter Notebook на указанном порту. | `jupyter notebook --port 8889` |
| `jupyter notebook list` | Показывает запущенные Jupyter-серверы (если доступно). | `jupyter notebook list` |

## JupyterLab

| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `pip install jupyterlab` | Устанавливает JupyterLab в активированное окружение. | `pip install jupyterlab` |
| `jupyter lab` | Запускает JupyterLab (сервер по умолчанию на порту 8888). | `jupyter lab` |
| `jupyter lab --port=<N>` | Запускает JupyterLab на указанном порту. | `jupyter lab --port=8889` |
| `jupyter lab --no-browser` | Запускает JupyterLab без автоматического открытия браузера. | `jupyter lab --no-browser` |

## Git (базовые команды для публикации проекта)

> **Важно:** это не курс по git. Команды даны в контексте публикации Python-проекта на GitHub.

| Команда | Описание | Пример |
| ------- | -------- | ------ |
| `git init` | Инициализирует git-репозиторий в текущей директории (создаёт папку .git). | `git init` |
| `git status` | Показывает статус файлов: изменённые, добавленные в индекс, неотслеживаемые. | `git status` |
| `git add <файл>` | Добавляет файлы в индекс (staging area) для следующего коммита. | `git add .` |
| `git commit -m "<сообщение>"` | Создаёт коммит с указанным сообщением. | `git commit -m "Первый коммит"` |
| `git remote add <имя> <URL>` | Подключает удалённый репозиторий (обычно origin). | `git remote add origin https://github.com/user/repo.git` |
| `git push -u <remote> <ветка>` | Отправляет коммиты на удалённый сервер. `-u` связывает локальную и удалённую ветку. | `git push -u origin main` |
| `git remote -v` | Показывает подключённые удалённые репозитории. | `git remote -v` |

