← [Назад](../03-lab-magic-commands/README.md) | [Оглавление](../../README.md) | [Далее →](../05-lab-jupyter-final/README.md)

# Лабораторная: экспорт и воспроизведение ноутбука

> **Модуль 8 · Лабораторная 04** | Время: ~30 мин

## Задание

Создайте проект `~/lab-jupyter-export` и выполните полный цикл: ноутбук → экспорт → передача коллеге → воспроизведение окружения.

1. **Создайте проект:**
   - Директория `~/lab-jupyter-export`
   - venv, Jupyter, matplotlib
   - Ноутбук `report.ipynb` с кодом (например, простой график matplotlib) и одной Markdown-ячейкой

2. **Экспортируйте:**
   - В HTML: `jupyter nbconvert --to html report.ipynb`
   - В Python-скрипт: `jupyter nbconvert --to script report.ipynb`
   - Сформируйте `requirements.txt` через `pip freeze`

3. **Симуляция передачи:**
   - Удалите venv
   - Пересоздайте окружение из `requirements.txt`
   - Убедитесь, что `report.html` и `report.ipynb` по-прежнему доступны и Jupyter запускается

## Требования

- Директория `~/lab-jupyter-export`
- venv активируем и содержит Jupyter, matplotlib
- Файлы: `report.ipynb`, `report.html`, `report.py`, `requirements.txt`
- Ноутбук содержит хотя бы одну Code-ячейку с matplotlib и одну Markdown-ячейку

## Подсказка 1

<details><summary>Показать подсказку</summary>

Начните с `mkdir -p ~/lab-jupyter-export && cd ~/lab-jupyter-export`. Создайте venv, активируйте, установите `jupyter notebook matplotlib`. Запустите Jupyter и создайте ноутбук.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Для экспорта используйте `jupyter nbconvert --to html report.ipynb` и `jupyter nbconvert --to script report.ipynb`. Файл requirements.txt: `pip freeze > requirements.txt` (можно отфильтровать только нужные пакеты, но для лабораторной достаточно полного списка).

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

После удаления venv: `deactivate`, `rm -rf venv`. Пересоздание: `python -m venv venv`, `source venv/bin/activate`, `pip install -r requirements.txt`. HTML и .ipynb не зависят от venv — они просто файлы. Jupyter нужен только для открытия .ipynb в браузере.

</details>

## Самопроверка

```bash
cd ~/lab-jupyter-export
source venv/bin/activate
jupyter nbconvert --version
ls -la report.ipynb report.html report.py requirements.txt 2>/dev/null
```

**Ожидаемый результат:** все четыре файла существуют, nbconvert работает.

---
← [Назад](../03-lab-magic-commands/README.md) | [Оглавление](../../README.md) | [Далее →](../05-lab-jupyter-final/README.md)
