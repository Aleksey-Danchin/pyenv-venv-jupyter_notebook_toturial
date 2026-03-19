← [Назад](../04-basic-git/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-project-organization/README.md)

# Тест: организация проекта

> **Модуль 10 · Тест** | Охватывает уроки 01–04

---

## Вопрос 1

Где обычно хранят исходный код Python-приложения в структурированном проекте?

- A) В корне проекта рядом с README.md
- B) В папке `src/` или в папке с именем пакета
- C) Только в `__pycache__/`
- D) В директории venv

<details><summary>Ответ</summary>

**B)** — Исходный код приложения размещают в `src/` или в папке с именем проекта (например, `my_project/`). Это отделяет рабочий код от тестов, скриптов и конфигурации.

</details>

---

## Вопрос 2

Зачем нужен файл `.python-version` в корне проекта?

- A) pip читает его при установке пакетов
- B) pyenv использует его для выбора версии Python при входе в директорию
- C) Jupyter определяет по нему ядро для ноутбуков
- D) Он нужен только для GitHub Actions

<details><summary>Ответ</summary>

**B)** — `.python-version` читается pyenv при `cd` в директорию проекта. Это обеспечивает воспроизводимость: все участники и инструменты используют одну и ту же версию Python.

</details>

---

## Вопрос 3

Какие сущности обязательно должны быть перечислены в `.gitignore` для Python-проекта?

- A) Только `venv/`
- B) `venv/`, `__pycache__/`, `.ipynb_checkpoints/` и подобные артефакты
- C) Только `__pycache__/`
- D) `requirements.txt` — его не коммитят

<details><summary>Ответ</summary>

**B)** — venv, `__pycache__/`, `.ipynb_checkpoints/`, `*.pyc`, `.env` и т.п. — всё это генерируется или содержит локальные данные. В репозиторий попадать не должно. requirements.txt, наоборот, коммитят — он нужен для воспроизведения окружения.

</details>

---

## Вопрос 4

В чём разница между `requirements.txt` и `requirements-dev.txt`?

- A) Нет разницы — оба для pip
- B) requirements.txt — production-зависимости (приложение), requirements-dev.txt — инструменты разработки (pytest, jupyter, black)
- C) requirements-dev.txt — для разработчиков Windows
- D) requirements.txt создаётся pip, requirements-dev.txt — вручную

<details><summary>Ответ</summary>

**B)** — Разделение по назначению: production (библиотеки для работы приложения) и dev (тестирование, форматирование, ноутбуки). Устанавливают: `pip install -r requirements.txt` и отдельно `pip install -r requirements-dev.txt` при разработке.

</details>

---

## Вопрос 5

Какой порядок команд правильный при первом коммите нового проекта?

- A) `git add .` → `git init` → `git commit`
- B) Создать `.gitignore` → `git init` → `git add .` → `git status` (проверить) → `git commit -m "..."`
- C) `git init` → `git commit` → `git add .`
- D) `git add .` → `git commit` → создать `.gitignore`

<details><summary>Ответ</summary>

**B)** — Сначала `.gitignore`, чтобы venv и артефакты не попали в индекс. Затем `git init`, `git add .`, проверка через `git status`, и только потом `git commit`.

</details>

---

## Вопрос 6

Что делает команда `git remote add origin <URL>`?

- A) Добавляет файлы в репозиторий
- B) Связывает локальный репозиторий с удалённым (например, на GitHub)
- C) Клонирует репозиторий
- D) Создаёт новую ветку

<details><summary>Ответ</summary>

**B)** — `git remote add` задаёт имя (`origin`) и URL удалённого репозитория. После этого можно выполнять `git push origin main` для отправки коммитов на сервер.

</details>

---

## Вопрос 7

В активированном venv вы сделали `pip freeze > requirements.txt`. Куда попал файл?

- A) В site-packages
- B) В корень текущей директории (проекта)
- C) В ~/.cache/pip
- D) В venv/lib/

<details><summary>Ответ</summary>

**B)** — `pip freeze` выводит список в stdout; перенаправление `>` записывает в файл. Файл создаётся в текущей рабочей директории — обычно корень проекта, где вы выполняете команду.

</details>

---

## Вопрос 8

Коллега прислал проект без `.python-version`, но с `requirements.txt`. Что может пойти не так?

- A) Ничего — pip установит пакеты в любом Python
- B) Может возникнуть несовместимость, если коллега использует другую версию Python
- C) Jupyter не найдёт ядро
- D) venv не создастся

<details><summary>Ответ</summary>

**B)** — Без `.python-version` pyenv подхватит глобальную версию Python. Если она отличается от той, на которой разрабатывался проект, возможны несовместимости (синтаксис, поведение, зависимости). Полное воспроизведение = версия Python + requirements.txt.

</details>

---

## Вопрос 9

Что вы проверите перед `git add .`, чтобы venv не попал в коммит?

- A) `git status` — после add посмотреть, есть ли venv в списке
- B) Наличие `venv/` в `.gitignore` и `git status` до/после add
- C) Удалить venv перед коммитом
- D) `git diff` для venv

<details><summary>Ответ</summary>

**B)** — Убедитесь, что в `.gitignore` есть строка `venv/` (или `venv`). После `git add .` выполните `git status` — venv не должен появиться в «Changes to be committed». Если появился — сначала исправьте `.gitignore`, затем `git reset HEAD venv/`.

</details>

---

## Вопрос 10

Где размещают тесты в типовой структуре Python-проекта?

- A) В корне рядом с main.py
- B) В папке `tests/`, файлы с префиксом `test_`
- C) Внутри `src/` в подпапке tests
- D) Только в Jupyter-ноутбуках

<details><summary>Ответ</summary>

**B)** — Папка `tests/` в корне проекта; имена файлов типа `test_main.py`, `test_utils.py` — так их находит pytest и другие фреймворки автоматически.

</details>

---

## Результаты

| Баллов | Уровень |
|--------|---------|
| 9–10 | Отлично — переходите к лабораторной |
| 7–8 | Хорошо — перечитайте отмеченные темы |
| < 7 | Рекомендуется пройти уроки 01–04 заново |

---
← [Назад](../04-basic-git/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-project-organization/README.md)
