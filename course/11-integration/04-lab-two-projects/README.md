← [Назад](../03-lab-migrate-python-version/README.md) | [Оглавление](../../README.md) | [Далее →](../05-trainer-project-removal/README.md)

# Лабораторная: Два проекта одновременно

> **Модуль 11 · Лабораторная 4** | Время: ~30 мин

## Задание

Создайте два независимых Python-проекта с разными версиями Python и разными наборами зависимостей. Убедитесь, что вы можете переключаться между ними: в одном терминале работать с проектом A, в Jupyter — с ядром проекта B, и наоборот.

## Требования

1. **Проект A** (`m11-proj-a`):
   - Python 3.11.x (или другая версия по вашему выбору)
   - venv, установленные: `jupyter`, `ipykernel`, `requests`
   - Ядро зарегистрировано с отображаемым именем «Python (m11-proj-a)»

2. **Проект B** (`m11-proj-b`):
   - Python 3.12.x (или другая версия, отличающаяся от проекта A)
   - venv, установлены: `jupyterlab`, `ipykernel`, `rich`
   - Ядро зарегистрировано с отображаемым именем «Python (m11-proj-b)»

3. Оба проекта в `~/m11-proj-a` и `~/m11-proj-b`

4. При переключении `cd` между директориями `pyenv` автоматически подхватывает нужную версию Python через `.python-version`

## Подсказка 1

<details><summary>Показать подсказку</summary>

Создайте две директории. В каждой выполните: `pyenv local <version>` (разные версии), `python -m venv .venv`, `source .venv/bin/activate`, установите пакеты и зарегистрируйте ядро с уникальным `--name` и `--display-name`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Для проекта A: `python -m ipykernel install --user --name=m11-proj-a --display-name="Python (m11-proj-a)"`. Для B — аналогично с `m11-proj-b`. При запуске Jupyter оба ядра появятся в Kernel → Change kernel.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Проверка переключения: `cd ~/m11-proj-a && pyenv version` — должно показать 3.11.x. `cd ~/m11-proj-b && pyenv version` — 3.12.x. В Jupyter создайте два ноутбука: один с ядром m11-proj-a (проверьте `import requests`), другой с m11-proj-b (проверьте `import rich`).

</details>

## Самопроверка

```bash
cd ~/m11-proj-a && python -c "import requests; print('A: requests OK')"
cd ~/m11-proj-b && python -c "import rich; print('B: rich OK')"
jupyter kernelspec list | grep -E "m11-proj-a|m11-proj-b"
```

**Ожидаемый результат:**

```
A: requests OK
B: rich OK
  m11-proj-a    ...
  m11-proj-b    ...
```

---
← [Назад](../03-lab-migrate-python-version/README.md) | [Оглавление](../../README.md) | [Далее →](../05-trainer-project-removal/README.md)
