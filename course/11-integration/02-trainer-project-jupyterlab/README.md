← [Назад](../01-trainer-project-from-scratch/README.md) | [Оглавление](../../README.md) | [Далее →](../03-lab-migrate-python-version/README.md)

# Тренажёр: Тот же проект с JupyterLab

> **Модуль 11 · Тренажёр 2** | Время: ~15 мин

## Цель

Добавить JupyterLab в проект, созданный в тренажёре 01, и запустить его. Убедиться, что то же ядро работает и в Notebook, и в JupyterLab.

## Подготовка

- Выполнен тренажёр 01: проект `~/m11-project-from-scratch` создан, venv активирован, Jupyter Notebook установлен, ядро зарегистрировано.
- JupyterLab рассмотрен в модуле 9.

## Шаг 1 — Перейти в проект и активировать venv

```bash
cd ~/m11-project-from-scratch
source venv/bin/activate
```

**Ожидаемый результат:** в приглашении терминала появляется префикс `(venv)`.

> **Что произошло:** вы находитесь в директории проекта и используете Python из venv.

---

## Шаг 2 — Установить JupyterLab

JupyterLab входит в отдельный пакет. Установите его в то же окружение:

```bash
pip install jupyterlab
```

**Ожидаемый результат:**

```
Successfully installed jupyterlab-...
```

> **Что произошло:** JupyterLab установлен рядом с Jupyter Notebook в одном venv. Оба используют одно и то же ядро.

---

## Шаг 3 — Запустить JupyterLab

```bash
jupyter lab
```

**Ожидаемый результат:** в браузере открывается интерфейс JupyterLab. В меню Kernel → Change kernel доступно ядро «Python (m11-from-scratch)» — то же самое, что вы зарегистрировали в тренажёре 01.

> **Что произошло:** JupyterLab и Jupyter Notebook — два разных интерфейса к одной системе: ядра общие, файлы .ipynb общие. Запуск `jupyter lab` вместо `jupyter notebook` меняет только интерфейс.

---

## Шаг 4 — Проверить ядро в JupyterLab

Создайте новый ноутбук (File → New → Notebook) или откройте существующий. Убедитесь, что активное ядро — «Python (m11-from-scratch)». Выполните в ячейке:

```python
import sys
print(sys.executable)
```

Путь должен содержать `m11-project-from-scratch/venv`.

> **Что произошло:** JupyterLab использует то же зарегистрированное ядро, что и Notebook — отдельная регистрация не нужна.

---

## Итог

Вы добавили JupyterLab в проект. Один venv, одно ядро — два интерфейса: Jupyter Notebook и JupyterLab. Для работы с ноутбуками можно выбирать тот, который удобнее.

## Проверка

Выполните скрипт проверки (из директории юнита или указав полный путь):

```bash
bash check.sh
```

**Ожидаемый результат:** все пункты проверки помечены как PASS.

---
← [Назад](../01-trainer-project-from-scratch/README.md) | [Оглавление](../../README.md) | [Далее →](../03-lab-migrate-python-version/README.md)
