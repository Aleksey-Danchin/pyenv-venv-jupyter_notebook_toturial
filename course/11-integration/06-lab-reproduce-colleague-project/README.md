← [Назад](../05-trainer-project-removal/README.md) | [Оглавление](../../README.md) | [Далее →](../07-lab-debug-pyenv-venv-conflict/README.md)

# Лабораторная: «Коллега прислал проект» — воспроизведение окружения

> **Модуль 11 · Лабораторная 6** | Время: ~25 мин

## Задание

Коллега прислал проект: только `requirements.txt` и `.python-version`. Воспроизведите окружение на своей машине так, чтобы проект запускался, а Jupyter мог с ним работать.

**Дано:**
- `.python-version` содержит: `3.11.7`
- `requirements.txt` содержит:
  ```
  jupyter>=1.0.0
  ipykernel>=6.0.0
  requests>=2.28.0
  ```

Создайте проект в `~/m11-colleague-reproduce`, воспроизведите окружение и проверьте, что `import requests` выполняется и в терминале, и в Jupyter.

## Требования

- Проект в `~/m11-colleague-reproduce`
- Файлы `.python-version` и `requirements.txt` в корне проекта
- venv создан на базе Python из `.python-version`
- Все пакеты из requirements установлены
- venv зарегистрирован как ядро Jupyter (имя: `m11-colleague-env`)

## Подсказка 1

<details><summary>Показать подсказку</summary>

Порядок: pyenv install (если версии нет) → pyenv local → python -m venv → pip install -r requirements.txt → ipykernel install.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Содержимое `.python-version` — одна строка с версией. Используйте `pyenv install` если версия не установлена. `pyenv local 3.11.7` создаст `.python-version` в текущей директории.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

```bash
mkdir -p ~/m11-colleague-reproduce && cd ~/m11-colleague-reproduce
echo "3.11.7" > .python-version
# После pyenv install 3.11.7 (если нужно) и pyenv local 3.11.7:
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python -m ipykernel install --user --name=m11-colleague-env --display-name="Python (m11-colleague-env)"
```

</details>

## Самопроверка

```bash
cd ~/m11-colleague-reproduce
source venv/bin/activate
python -c "import requests; import jupyter; print('OK')"
```

**Ожидаемый результат:**

```
OK
```

Проверка ядра: `jupyter kernelspec list` должен показывать `m11-colleague-env`.

---
← [Назад](../05-trainer-project-removal/README.md) | [Оглавление](../../README.md) | [Далее →](../07-lab-debug-pyenv-venv-conflict/README.md)
