← [Назад](../04-version-priority/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-version-switching/README.md)

# Тест: переключение версий и приоритеты

> **Модуль 2 · Тест** | Охватывает уроки 01–04 + Модуль 1

---

## Вопрос 1

Какая команда устанавливает версию Python **по умолчанию для всех терминалов**?

- A) `pyenv shell 3.12.0`
- B) `pyenv local 3.12.0`
- C) `pyenv global 3.12.0`
- D) `pyenv install 3.12.0`

<details><summary>Ответ</summary>

**C)** — `pyenv global` задаёт глобальную версию, которая действует во всех терминалах (если не перекрыта local или shell).

</details>

---

## Вопрос 2

В какой файл `pyenv global` записывает выбранную версию?

- A) `~/.bashrc`
- B) `~/.pyenv/version`
- C) `.python-version` в домашней директории
- D) `/etc/pyenv.conf`

<details><summary>Ответ</summary>

**B)** — глобальная версия хранится в файле `~/.pyenv/version`.

</details>

---

## Вопрос 3

Вы находитесь в директории `/home/user/projects/app`. В этой директории выполнена команда `pyenv local 3.11.7`. Какая версия Python будет использоваться в директории `/home/user/projects/app/src/utils`?

- A) Системная версия
- B) Глобальная версия
- C) 3.11.7
- D) Зависит от содержимого `~/.pyenv/version`

<details><summary>Ответ</summary>

**C)** — pyenv ищет файл `.python-version` начиная с текущей директории и поднимается вверх по дереву. Файл найдётся в `/home/user/projects/app/`, поэтому будет использована версия 3.11.7.

</details>

---

## Вопрос 4

Что делает команда `pyenv shell --unset`?

- A) Удаляет текущую глобальную версию
- B) Удаляет файл `.python-version`
- C) Удаляет переменную `PYENV_VERSION` из текущей сессии
- D) Деинсталлирует текущую версию Python

<details><summary>Ответ</summary>

**C)** — `pyenv shell --unset` сбрасывает переменную `PYENV_VERSION`, после чего pyenv возвращается к следующему источнику приоритета (local → global → system).

</details>

---

## Вопрос 5

Каков правильный порядок приоритетов при выборе версии Python в pyenv?

- A) global → local → shell → system
- B) system → global → local → shell
- C) shell → local → global → system
- D) local → shell → global → system

<details><summary>Ответ</summary>

**C)** — pyenv проверяет источники в порядке: shell (`PYENV_VERSION`) → local (`.python-version`) → global (`~/.pyenv/version`) → system. Побеждает первый найденный.

</details>

---

## Вопрос 6

Вы выполнили `pyenv shell 3.13.0` в терминале. В текущей директории есть `.python-version` с содержимым `3.11.7`. Какую версию покажет `python --version`?

- A) 3.11.7
- B) 3.13.0
- C) Системную версию
- D) Ошибку

<details><summary>Ответ</summary>

**B)** — shell имеет наивысший приоритет. Переменная `PYENV_VERSION` перекрывает `.python-version`.

</details>

---

## Вопрос 7

*(Модуль 1)* Какая команда показывает **все установленные** через pyenv версии Python?

- A) `pyenv install --list`
- B) `pyenv version`
- C) `pyenv versions`
- D) `python --version`

<details><summary>Ответ</summary>

**C)** — `pyenv versions` показывает все установленные версии. `pyenv version` (без `s`) показывает только текущую активную. `pyenv install --list` показывает доступные для установки, а не установленные.

</details>

---

## Вопрос 8

Что означает `pyenv global system`?

- A) Устанавливает последнюю версию Python из pyenv
- B) Удаляет глобальную настройку pyenv
- C) Использовать системный Python как глобальную версию
- D) Переустанавливает pyenv

<details><summary>Ответ</summary>

**C)** — значение `system` говорит pyenv «не вмешиваться» и пропустить вызов к системному Python из `/usr/bin/`.

</details>

---

## Вопрос 9

Вы выполнили `pyenv local 3.10.0`, но версия 3.10.0 **не установлена** через pyenv. Что произойдёт при вызове `python`?

- A) Будет использована глобальная версия
- B) Будет использована системная версия
- C) pyenv выдаст ошибку: version '3.10.0' is not installed
- D) pyenv автоматически установит 3.10.0

<details><summary>Ответ</summary>

**C)** — pyenv найдёт `.python-version`, попытается использовать версию 3.10.0, но не обнаружит её среди установленных и выдаст ошибку с указанием файла-источника.

</details>

---

## Вопрос 10

*(Модуль 1)* Как установить конкретную версию Python через pyenv?

- A) `apt install python3.12.0`
- B) `pyenv install 3.12.0`
- C) `pyenv global 3.12.0`
- D) `pip install python==3.12.0`

<details><summary>Ответ</summary>

**B)** — `pyenv install 3.12.0` компилирует и устанавливает указанную версию. `pyenv global` только переключает уже установленную версию, но не устанавливает её.

</details>

---

## Результаты

| Баллов | Уровень |
|--------|---------|
| 9–10 | Отлично — переходите к лабораторной |
| 7–8 | Хорошо — перечитайте уроки по отмеченным темам |
| < 7 | Рекомендуется пройти уроки 01–04 заново |

---
← [Назад](../04-version-priority/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-version-switching/README.md)
