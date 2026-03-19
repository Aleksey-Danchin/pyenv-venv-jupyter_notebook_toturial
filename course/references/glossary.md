# Глоссарий

> Определения терминов, встречающихся в курсе. При первом появлении термин определяется в тексте урока и добавляется сюда.


| Термин                      | Определение                                                                                                | Где впервые встречается                                               |
| --------------------------- | ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| **PATH**                    | Переменная окружения со списком директорий, в которых shell ищет исполняемые файлы команд.                 | [Модуль 0, Урок 02](../00-python-environment/02-path-resolution/README.md)     |
| **shim**                    | Прокси-исполняемый файл, который перехватывает вызов команды и перенаправляет его на нужный бинарный файл. | [Модуль 0, Урок 06](../00-python-environment/06-shims-intro/README.md)         |
| **site-packages**           | Директория Python, где хранятся установленные пакеты и зависимости.                                        | [Модуль 0, Урок 05](../00-python-environment/05-pip-global-packages/README.md) |
| **симлинк (symbolic link)** | Специальный файловый объект-ссылка на другой файл или директорию.                                          | [Модуль 0, Урок 03](../00-python-environment/03-python-symlinks/README.md)     |
| **системный Python**        | Версия Python, установленная и поддерживаемая пакетным менеджером ОС для работы системных инструментов.    | [Модуль 0, Урок 01](../00-python-environment/01-system-python/README.md)       |
| **pyenv**                   | Менеджер версий Python — позволяет устанавливать, переключать и удалять версии интерпретатора изолированно от системного Python. | [Модуль 1, Урок 01](../01-pyenv-basics/01-what-is-pyenv/README.md)            |
| **зависимости сборки (build dependencies)** | Системные пакеты (компилятор, заголовочные файлы библиотек), необходимые для компиляции Python из исходников. | [Модуль 1, Тренажёр 02](../01-pyenv-basics/02-trainer-pyenv-install/README.md) |
| **глобальная версия (pyenv)** | Версия Python по умолчанию для всех терминалов, хранится в файле `~/.pyenv/version`. | [Модуль 2, Урок 01](../02-pyenv-advanced/01-pyenv-global/README.md) |
| **локальная версия (pyenv)** | Версия Python, привязанная к конкретной директории через файл `.python-version`. | [Модуль 2, Урок 02](../02-pyenv-advanced/02-pyenv-local/README.md) |
| **`.python-version`** | Текстовый файл в директории проекта, фиксирующий версию Python для pyenv. | [Модуль 2, Урок 02](../02-pyenv-advanced/02-pyenv-local/README.md) |
| **`PYENV_VERSION`** | Переменная окружения, задающая версию Python для текущей сессии shell (наивысший приоритет в pyenv). | [Модуль 2, Урок 03](../02-pyenv-advanced/03-pyenv-shell/README.md) |
| **ядро (kernel)** | Среда выполнения кода в ноутбуке Jupyter: интерпретатор Python и все пакеты его окружения. Отдельно от терминала, в котором запущен Jupyter. | [Модуль 7, Урок 01](../07-jupyter-kernels/01-kernels-intro/README.md) |
| **ipykernel** | Пакет для регистрации Python-окружения как ядра Jupyter. Устанавливается в venv, после чего окружение появляется в Kernel → Change kernel. | [Модуль 7, Тренажёр 02](../07-jupyter-kernels/02-trainer-register-venv-kernel/README.md) |
| **kernelspec** | Описание ядра Jupyter (путь к интерпретатору, метаданные). Хранится в `~/.local/share/jupyter/kernels/` для пользовательских ядер. | [Модуль 7, Урок 03](../07-jupyter-kernels/03-manage-kernels/README.md) |
| **pip** | Стандартный менеджер пакетов Python — устанавливает, удаляет и обновляет библиотеки. Привязан к конкретному интерпретатору Python. | [Модуль 3, Урок 01](../03-pip/01-what-is-pip-pypi/README.md) |
| **PyPI** | Python Package Index — центральный репозиторий Python-пакетов (pypi.org), откуда pip по умолчанию скачивает пакеты. | [Модуль 3, Урок 01](../03-pip/01-what-is-pip-pypi/README.md) |
| **индекс пакетов** | Каталог метаданных пакетов, откуда pip получает информацию о доступных версиях и ссылках на скачивание. По умолчанию — PyPI. | [Модуль 3, Урок 04](../03-pip/04-pypi-indexes-cache/README.md) |
| **`requirements.txt`** | Файл со списком зависимостей проекта в формате `package==version`. Создаётся через `pip freeze`, используется для воспроизведения окружения. | [Модуль 3, Урок 03](../03-pip/03-freeze-list-requirements/README.md) |
| **кеш pip** | Локальная директория, куда pip сохраняет скачанные пакеты для повторного использования без повторной загрузки. | [Модуль 3, Урок 04](../03-pip/04-pypi-indexes-cache/README.md) |
| **venv** | Встроенный в Python (с 3.3) модуль для создания виртуальных окружений — изолированных копий интерпретатора и site-packages для проекта. | [Модуль 4, Урок 01](../04-venv-basics/01-what-is-venv/README.md) |
| **виртуальное окружение** | Изолированная среда: свой Python, pip и site-packages, не затрагивающая системный Python и другие проекты. | [Модуль 4, Урок 01](../04-venv-basics/01-what-is-venv/README.md) |
| **изоляция зависимостей** | Разделение пакетов проекта от глобальной установки и других проектов — у каждого проекта свой набор библиотек. | [Модуль 4, Урок 01](../04-venv-basics/01-what-is-venv/README.md) |
| **`VIRTUAL_ENV`** | Переменная окружения, устанавливаемая при активации venv — содержит путь к корню активированного окружения. | [Модуль 4, Урок 04](../04-venv-basics/04-what-happens-on-activate/README.md) |
| **воспроизведение окружения** | Создание копии окружения проекта на другой машине или в новом venv по `requirements.txt` и `.python-version`. | [Модуль 5, Урок 02](../05-venv-advanced/02-requirements-in-venv/README.md) |
| **`--system-site-packages`** | Флаг `python -m venv`: даёт venv доступ к пакетам системного Python (импорт). По умолчанию venv полностью изолирован. | [Модуль 5, Урок 04](../05-venv-advanced/04-system-site-packages/README.md) |
| **Jupyter Notebook** | Веб-приложение для интерактивной работы с кодом и документацией: сервер + браузерный интерфейс, файлы в формате .ipynb. | [Модуль 6, Урок 01](../06-jupyter-notebook/01-what-is-jupyter-notebook/README.md) |
| **JupyterLab** | Наследник Jupyter Notebook: модульный веб-интерфейс с вкладками, встроенным терминалом, файловым менеджером и просмотром данных. Открывает те же .ipynb файлы и использует те же ядра. | [Модуль 9, Урок 01](../09-jupyterlab/01-jupyterlab-intro/README.md) |
| **магическая команда** | Специальная команда IPython/Jupyter, начинающаяся с `%` или `%%`, расширяющая возможности ячейки (профилирование, shell, переменные окружения). | [Модуль 6, Урок 09](../06-jupyter-notebook/09-magic-commands/README.md) |
| **миграция проекта** | Переключение проекта на другую версию Python: pyenv local, пересоздание venv, `pip install -r requirements.txt`, перерегистрация ядра Jupyter. | [Модуль 11, Лабораторная 03](../11-integration/03-lab-migrate-python-version/README.md) |
| **nbconvert** | Инструмент Jupyter для конвертации ноутбуков (.ipynb) в другие форматы: HTML, PDF, LaTeX, Markdown, Python-скрипт (.py). | [Модуль 6, Урок 10](../06-jupyter-notebook/10-export-notebook/README.md) |
| **ноутбук (notebook)** | Документ .ipynb, объединяющий исполняемый код и Markdown-документацию в ячейках; открывается в Jupyter Notebook или JupyterLab. | [Модуль 6, Урок 01](../06-jupyter-notebook/01-what-is-jupyter-notebook/README.md) |
| **ячейка** | Элемент ноутбука Jupyter — блок содержимого: Code (Python), Markdown (документация) или Raw (без обработки). | [Модуль 6, Урок 05](../06-jupyter-notebook/05-cell-types/README.md) |
| **`.gitignore`** | Файл в корне проекта, указывающий git, какие файлы и папки не отслеживать (venv, __pycache__, .ipynb_checkpoints и т.д.). | [Модуль 10, Урок 02](../10-project-practice/02-gitignore-python/README.md) |
| **`requirements-dev.txt`** | Файл с dev-зависимостями проекта (pytest, black, jupyter и др.). Часто включает `-r requirements.txt` для объединения с production-зависимостями. | [Модуль 10, Урок 03](../10-project-practice/03-requirements-vs-dev/README.md) |
| **репозиторий (git)** | Директория с историей изменений, управляемая git. Содержит папку `.git` и отслеживаемые файлы. | [Модуль 10, Урок 04](../10-project-practice/04-basic-git/README.md) |

