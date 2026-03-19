← [Назад](../03-manage-kernels/README.md) | [Оглавление](../../README.md) | [Далее →](../05-lab-kernels-register/README.md)

# Тест: ядра, регистрация, переключение

> **Модуль 7 · Тест** | Охватывает уроки 01–03, модули 4–6

---

## Вопрос 1

Код в ячейке Jupyter выполняется в окружении:

- A) Активированного venv в терминале, откуда запущен Jupyter
- B) Ядра, выбранного для ноутбука
- C) Системного Python
- D) Того же Python, что и `which jupyter` в терминале

<details><summary>Ответ</summary>

**B)** — Код в ячейках выполняет ядро (kernel). Ядро — отдельный процесс Python, который может указывать на любое окружение (venv, системный Python и т.д.), не обязательно совпадающее с терминалом.

</details>

---

## Вопрос 2

Как проверить, какой Python использует текущее ядро ноутбука?

- A) Выполнить `which python` в Jupyter Terminal
- B) Выполнить `import sys; print(sys.executable)` в ячейке Code
- C) Посмотреть Kernel → Change kernel
- D) Выполнить `pip list` в ячейке

<details><summary>Ответ</summary>

**B)** — `sys.executable` возвращает путь к интерпретатору, в окружении которого выполняется код ячейки.

</details>

---

## Вопрос 3

Пакет `ipykernel` нужно установить:

- A) В системный Python
- B) В то venv-окружение, которое вы хотите зарегистрировать как ядро
- C) В активированный venv, из которого запускаете Jupyter
- D) Глобально через `pip install --user ipykernel`

<details><summary>Ответ</summary>

**B)** — ipykernel устанавливается в то окружение, которое станет ядром. Команда `python -m ipykernel install` запускается из этого же окружения.

</details>

---

## Вопрос 4

Команда `jupyter kernelspec list` показывает:

- A) Список запущенных ядер
- B) Список зарегистрированных ядер (kernelspec)
- C) Список установленных пакетов Jupyter
- D) Список открытых ноутбуков

<details><summary>Ответ</summary>

**B)** — Зарегистрированные ядра — это kernelspec: описания с путём к интерпретатору и метаданными.

</details>

---

## Вопрос 5

Вы установили пакет `numpy` через `pip install numpy` в активированном venv. В ячейке Jupyter `import numpy` падает с `ModuleNotFoundError`. Наиболее вероятная причина:

- A) numpy установлен неправильно
- B) Ядро ноутбука указывает на другое окружение (не ваш venv)
- C) Jupyter не перезапущен после установки пакета
- D) Нужно выполнить `!pip install numpy` в ячейке

<details><summary>Ответ</summary>

**B)** — Ядро использует свой интерпретатор. Если ядро указывает на системный Python или другой venv, пакеты из вашего venv недоступны. Зарегистрируйте venv как ядро и переключитесь на него.

</details>

---

## Вопрос 6

Параметр `--display-name` в `ipykernel install` задаёт:

- A) Имя директории kernelspec
- B) Название, отображаемое в Kernel → Change kernel
- C) Версию Python
- D) Путь к интерпретатору

<details><summary>Ответ</summary>

**B)** — `--display-name` — человекочитаемое имя в UI. `--name` — внутренний идентификатор kernelspec.

</details>

---

## Вопрос 7

Где обычно хранятся kernelspec пользователя?

- A) В `~/.jupyter/kernels/`
- B) В `~/.local/share/jupyter/kernels/`
- C) В `site-packages` каждого venv
- D) В `/usr/share/jupyter/kernels/`

<details><summary>Ответ</summary>

**B)** — При `--user` ядра устанавливаются в `~/.local/share/jupyter/kernels/`. Системные — в `/usr/share/jupyter/kernels/`.

</details>

---

## Вопрос 8

Jupyter Notebook был запущен из venv `proj`. Ноутбук использует ядро «Python 3 (system)». Где выполняется код ячеек?

- A) В venv proj
- B) В системном Python
- C) В том же окружении, что и `jupyter notebook`
- D) В глобальном pyenv

<details><summary>Ответ</summary>

**B)** — Ядро «Python 3 (system)» указывает на системный интерпретатор. Окружение запуска Jupyter (proj) не влияет на выполнение кода в ячейках.

</details>

---

## Вопрос 9

Чтобы удалить зарегистрированное ядро `myenv`, нужно выполнить:

- A) `jupyter kernelspec uninstall myenv`
- B) `jupyter kernelspec remove myenv`
- C) `pip uninstall ipykernel` в соответствующем venv
- D) Удалить директорию `~/.local/share/jupyter/kernels/myenv`

<details><summary>Ответ</summary>

**B)** и **D)** — `jupyter kernelspec remove myenv` — правильный способ. Удаление директории вручную тоже работает, но лучше использовать команду.

</details>

---

## Вопрос 10

В чём разница между «активированный venv в терминале» и «ядро Jupyter»?

- A) Никакой, это одно и то же
- B) Активация venv влияет на команды в терминале; ядро — отдельный процесс для выполнения кода в ячейках
- C) Ядро — это всегда системный Python
- D) Активация venv автоматически регистрирует venv как ядро

<details><summary>Ответ</summary>

**B)** — Активация venv меняет PATH и `python`/`pip` в этом терминале. Ядро — отдельный процесс, который Jupyter запускает по kernelspec; venv нужно явно регистрировать как ядро.

</details>

---

## Результаты

| Баллов | Уровень |
|--------|---------|
| 9–10 | Отлично — переходите к лабораторной |
| 7–8 | Хорошо — перечитайте отмеченные темы |
| < 7 | Рекомендуется пройти уроки 01–03 заново |

---
← [Назад](../03-manage-kernels/README.md) | [Оглавление](../../README.md) | [Далее →](../05-lab-kernels-register/README.md)
