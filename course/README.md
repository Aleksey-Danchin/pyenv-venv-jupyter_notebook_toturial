# Оглавление курса «pyenv + venv + Jupyter Notebook»

> Курс по управлению Python-средой в Linux (Ubuntu-based): от системного Python до pyenv, venv и Jupyter.

## Модули

| # | Модуль | Ссылка | Статус |
|---|--------|--------|--------|
| 00 | Python-среда в Linux | [Открыть](00-python-environment/README.md) | В процессе |
| 01 | pyenv: установка и основы | [Открыть](01-pyenv-basics/README.md) | В процессе |
| 02 | pyenv: управление версиями | [Открыть](02-pyenv-advanced/README.md) | В процессе |
| 03 | pip и управление пакетами | [Открыть](03-pip/README.md) | В процессе |
| 04 | venv: создание и работа | [Открыть](04-venv-basics/README.md) | В процессе |
| 05 | venv: продвинутое использование | [Открыть](05-venv-advanced/README.md) | В процессе |
| 06 | Jupyter Notebook | [Открыть](06-jupyter-notebook/README.md) | В процессе |
| 07 | Jupyter: ядра и интеграция | [Открыть](07-jupyter-kernels/README.md) | В процессе |
| 08 | Jupyter: практикум | [Открыть](08-jupyter-practice/README.md) | В процессе |
| 09 | JupyterLab | [Открыть](09-jupyterlab/README.md) | В процессе |
| 10 | Проектная практика | [Открыть](10-project-practice/README.md) | В процессе |
| 11 | Интеграция: сквозные сценарии | [Открыть](11-integration/README.md) | В процессе |

## Модуль 0: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Где лежит системный Python](00-python-environment/01-system-python/README.md) | Урок |
| 02 | [Что такое PATH и как система находит исполняемые файлы](00-python-environment/02-path-resolution/README.md) | Урок |
| 03 | [Симлинки: `python -> python3 -> python3.x`](00-python-environment/03-python-symlinks/README.md) | Урок |
| 04 | [Зачем нельзя трогать системный Python](00-python-environment/04-system-python-risks/README.md) | Урок |
| 05 | [Что такое pip и куда он устанавливает пакеты глобально](00-python-environment/05-pip-global-packages/README.md) | Урок |
| 06 | [Что такое shims — предвосхищение pyenv](00-python-environment/06-shims-intro/README.md) | Урок |
| 07 | [Тест: Python-среда в Linux](00-python-environment/07-test-python-environment/README.md) | Тест |
| 08 | [Лабораторная: диагностика Python-среды в Linux](00-python-environment/08-lab-python-environment-basics/README.md) | Лабораторная |

## Модуль 1: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Что такое pyenv и зачем он нужен](01-pyenv-basics/01-what-is-pyenv/README.md) | Урок |
| 02 | [Установка pyenv](01-pyenv-basics/02-trainer-pyenv-install/README.md) | Тренажёр |
| 03 | [Установка версии Python через pyenv](01-pyenv-basics/03-installing-python/README.md) | Урок |
| 04 | [Просмотр доступных и установленных версий](01-pyenv-basics/04-listing-versions/README.md) | Урок |
| 05 | [Тест: pyenv — установка и основы](01-pyenv-basics/05-test-pyenv-basics/README.md) | Тест |
| 06 | [Лабораторная: установка и просмотр версий](01-pyenv-basics/06-lab-pyenv-install-versions/README.md) | Лабораторная |
| 07 | [Диагностика: pyenv install не компилирует](01-pyenv-basics/07-lab-debug-build-deps/README.md) | Диагностика |

## Модуль 2: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Переключение глобальной версии](02-pyenv-advanced/01-pyenv-global/README.md) | Урок |
| 02 | [Локальная версия для проекта](02-pyenv-advanced/02-pyenv-local/README.md) | Урок |
| 03 | [Версия для текущей сессии](02-pyenv-advanced/03-pyenv-shell/README.md) | Урок |
| 04 | [Приоритет версий](02-pyenv-advanced/04-version-priority/README.md) | Урок |
| 05 | [Тест: переключение версий](02-pyenv-advanced/05-test-version-switching/README.md) | Тест |
| 06 | [Лабораторная: переключение версий](02-pyenv-advanced/06-lab-version-switching/README.md) | Лабораторная |
| 07 | [Удаление версии Python](02-pyenv-advanced/07-uninstall-python/README.md) | Урок |
| 08 | [Обновление и деинсталляция pyenv](02-pyenv-advanced/08-update-remove-pyenv/README.md) | Урок |
| 09 | [Диагностика: python не найден](02-pyenv-advanced/09-lab-debug-python-not-found/README.md) | Диагностика |
| 10 | [Итоговая лабораторная по pyenv](02-pyenv-advanced/10-lab-pyenv-final/README.md) | Лабораторная |

## Модуль 3: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Что такое pip и PyPI](03-pip/01-what-is-pip-pypi/README.md) | Урок |
| 02 | [Установка, удаление, обновление пакетов](03-pip/02-install-remove-update/README.md) | Урок |
| 03 | [pip freeze, pip list и requirements.txt](03-pip/03-freeze-list-requirements/README.md) | Урок |
| 04 | [Откуда берутся пакеты: PyPI, индексы, кеш](03-pip/04-pypi-indexes-cache/README.md) | Урок |
| 05 | [Тест: pip-операции и requirements](03-pip/05-test-pip-operations/README.md) | Тест |
| 06 | [Лабораторная: pip-операции и requirements](03-pip/06-lab-pip-operations/README.md) | Лабораторная |
| 07 | [pip vs системный пакетный менеджер (apt)](03-pip/07-pip-vs-apt/README.md) | Урок |

## Модуль 4: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Что такое venv и зачем нужна изоляция](04-venv-basics/01-what-is-venv/README.md) | Урок |
| 02 | [Создание виртуального окружения](04-venv-basics/02-trainer-create-venv/README.md) | Тренажёр |
| 03 | [Активация и деактивация окружения](04-venv-basics/03-activate-deactivate/README.md) | Урок |
| 04 | [Что происходит при активации](04-venv-basics/04-what-happens-on-activate/README.md) | Урок |
| 05 | [Тест: venv — создание, активация, деактивация](04-venv-basics/05-test-venv-basics/README.md) | Тест |
| 06 | [Лабораторная: создание, активация, деактивация](04-venv-basics/06-lab-venv-create-activate/README.md) | Лабораторная |
| 07 | [Установка пакетов внутри окружения](04-venv-basics/07-pip-inside-venv/README.md) | Урок |
| 08 | [Где физически хранится окружение](04-venv-basics/08-venv-internals/README.md) | Урок |

## Модуль 5: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Создание venv на базе конкретной версии Python (из pyenv)](05-venv-advanced/01-venv-from-pyenv-version/README.md) | Урок |
| 02 | [requirements.txt в контексте venv](05-venv-advanced/02-requirements-in-venv/README.md) | Урок |
| 03 | [Несколько окружений для одного проекта](05-venv-advanced/03-multiple-envs-per-project/README.md) | Урок |
| 04 | [--system-site-packages — доступ к системным пакетам](05-venv-advanced/04-system-site-packages/README.md) | Урок |
| 05 | [Удаление окружения](05-venv-advanced/05-removing-venv/README.md) | Урок |
| 06 | [Тест: venv + pyenv, requirements](05-venv-advanced/06-test-venv-advanced/README.md) | Тест |
| 07 | [Лабораторная: venv + pyenv, requirements](05-venv-advanced/07-lab-venv-pyenv-requirements/README.md) | Лабораторная |
| 08 | [Диагностика: pip внутри venv указывает на системный](05-venv-advanced/08-lab-debug-pip-system/README.md) | Диагностика |
| 09 | [Диагностика: сломанный venv](05-venv-advanced/09-lab-debug-broken-venv/README.md) | Диагностика |

## Модуль 6: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Что такое Jupyter Notebook](06-jupyter-notebook/01-what-is-jupyter-notebook/README.md) | Урок |
| 02 | [Установка Jupyter внутри venv](06-jupyter-notebook/02-trainer-jupyter-install/README.md) | Тренажёр |
| 03 | [Запуск notebook-сервера, интерфейс браузера](06-jupyter-notebook/03-notebook-server-interface/README.md) | Урок |
| 04 | [Создание, переименование, удаление ноутбуков](06-jupyter-notebook/04-create-rename-delete-notebooks/README.md) | Урок |
| 05 | [Типы ячеек: Code, Markdown, Raw](06-jupyter-notebook/05-cell-types/README.md) | Урок |
| 06 | [Базовые горячие клавиши](06-jupyter-notebook/06-hotkeys/README.md) | Урок |
| 07 | [Тест: установка, запуск, ячейки](06-jupyter-notebook/07-test-jupyter-basics/README.md) | Тест |
| 08 | [Лабораторная: установка, запуск, ячейки](06-jupyter-notebook/08-lab-jupyter-basics/README.md) | Лабораторная |
| 09 | [Магические команды](06-jupyter-notebook/09-magic-commands/README.md) | Урок |
| 10 | [Экспорт ноутбука](06-jupyter-notebook/10-export-notebook/README.md) | Урок |

## Модуль 7: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Ядра (kernels): что это, какие бывают, как переключить](07-jupyter-kernels/01-kernels-intro/README.md) | Урок |
| 02 | [Регистрация venv как ядра Jupyter (ipykernel)](07-jupyter-kernels/02-trainer-register-venv-kernel/README.md) | Тренажёр |
| 03 | [Управление ядрами: список, удаление](07-jupyter-kernels/03-manage-kernels/README.md) | Урок |
| 04 | [Тест: ядра, регистрация, переключение](07-jupyter-kernels/04-test-kernels/README.md) | Тест |
| 05 | [Лабораторная: ядра, регистрация, переключение](07-jupyter-kernels/05-lab-kernels-register/README.md) | Лабораторная |
| 06 | [Диагностика: Jupyter использует системное ядро, а не venv](07-jupyter-kernels/06-lab-debug-system-kernel/README.md) | Диагностика |
| 07 | [Диагностика: несколько Jupyter-серверов на разных портах](07-jupyter-kernels/07-lab-debug-multiple-servers/README.md) | Диагностика |

## Модуль 8: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Практика: работа с данными и визуализацией (matplotlib)](08-jupyter-practice/01-lab-data-visualization/README.md) | Практика |
| 02 | [Практика: markdown-документация внутри ноутбука](08-jupyter-practice/02-lab-markdown-docs/README.md) | Практика |
| 03 | [Практика: магические команды в реальном сценарии](08-jupyter-practice/03-lab-magic-commands/README.md) | Практика |
| 04 | [Лабораторная: экспорт и воспроизведение ноутбука](08-jupyter-practice/04-lab-export-reproduce/README.md) | Лабораторная |
| 05 | [Итоговая лабораторная по Jupyter](08-jupyter-practice/05-lab-jupyter-final/README.md) | Лабораторная |

## Модуль 9: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Что такое JupyterLab и чем отличается от Notebook](09-jupyterlab/01-jupyterlab-intro/README.md) | Урок |
| 02 | [Установка и запуск JupyterLab](09-jupyterlab/02-trainer-install-jupyterlab/README.md) | Тренажёр |
| 03 | [Интерфейс: вкладки, терминал, файловый менеджер, просмотр данных](09-jupyterlab/03-jupyterlab-interface/README.md) | Урок |
| 04 | [Лабораторная: работа в JupyterLab (миграция с Notebook)](09-jupyterlab/04-lab-jupyterlab-migration/README.md) | Лабораторная |

## Модуль 10: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Структура Python-проекта: что где лежит](10-project-practice/01-project-structure/README.md) | Урок |
| 02 | [.gitignore для Python-проектов](10-project-practice/02-gitignore-python/README.md) | Урок |
| 03 | [requirements.txt vs requirements-dev.txt](10-project-practice/03-requirements-vs-dev/README.md) | Урок |
| 04 | [Базовый git: init, add, commit, push](10-project-practice/04-basic-git/README.md) | Урок |
| 05 | [Тест: организация проекта](10-project-practice/05-test-project-organization/README.md) | Тест |
| 06 | [Лабораторная: организация проекта](10-project-practice/06-lab-project-organization/README.md) | Лабораторная |

## Модуль 11: содержание юнитов

| # | Юнит | Тип |
|---|------|-----|
| 01 | [Создание проекта с нуля: pyenv → venv → pip → jupyter → kernel](11-integration/01-trainer-project-from-scratch/README.md) | Тренажёр |
| 02 | [Тот же проект с JupyterLab вместо Notebook](11-integration/02-trainer-project-jupyterlab/README.md) | Тренажёр |
| 03 | [Переключение проекта на другую версию Python (миграция)](11-integration/03-lab-migrate-python-version/README.md) | Лабораторная |
| 04 | [Два проекта одновременно](11-integration/04-lab-two-projects/README.md) | Лабораторная |
| 05 | [Удаление проекта: деактивация, venv, ядро, очистка](11-integration/05-trainer-project-removal/README.md) | Урок + Тренажёр |
| 06 | [«Коллега прислал проект» — воспроизведение по requirements и .python-version](11-integration/06-lab-reproduce-colleague-project/README.md) | Лабораторная |
| 07 | [Диагностика: конфликт pyenv local vs venv от другой версии](11-integration/07-lab-debug-pyenv-venv-conflict/README.md) | Диагностика |
| 08 | [Финальная лабораторная — полный цикл](11-integration/08-lab-final-integration/README.md) | Лабораторная |

## Справочные материалы

- [Глоссарий](references/glossary.md)
- [Справочник команд терминала](references/terminal-commands.md)
- [Cheatsheet: pip](cheatsheets/pip-cheatsheet.md)
- [Cheatsheet: pyenv](cheatsheets/pyenv-cheatsheet.md)
- [Cheatsheet: venv](cheatsheets/venv-cheatsheet.md)
- [Cheatsheet: Jupyter](cheatsheets/jupyter-cheatsheet.md)

