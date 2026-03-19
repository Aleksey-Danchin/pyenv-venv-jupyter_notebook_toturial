# Эталонное решение: ядра, регистрация, переключение

## Шаги решения

1. Создать директорию и venv.
2. Активировать venv.
3. Установить `jupyter`, `notebook`, `ipykernel`.
4. Зарегистрировать venv как ядро через `python -m ipykernel install`.
5. Запустить Jupyter, создать ноутбук, переключить ядро, проверить `sys.executable`.

## Команды

```bash
# 1. Подготовка
mkdir -p ~/kernels-lab
cd ~/kernels-lab
python3 -m venv venv
source venv/bin/activate

# 2. Установка пакетов
pip install jupyter notebook ipykernel

# 3. Регистрация ядра
python -m ipykernel install --user --name kernels-lab --display-name "Python (kernels-lab)"

# 4. Проверка
jupyter kernelspec list
```

## В Jupyter

1. Запустить `jupyter notebook`.
2. Создать New → Python 3 (или выбрать ваше ядро «Python (kernels-lab)»).
3. Если создан с другим ядром: Kernel → Change kernel → Python (kernels-lab).
4. В ячейке:
   ```python
   import sys
   print(sys.executable)
   ```
5. Путь должен содержать `kernels-lab/venv/bin/python` (или аналогичный).

## Ожидаемый результат

```
Available kernels:
  kernels-lab    /home/user/.local/share/jupyter/kernels/kernels-lab
  python3        /usr/share/jupyter/kernels/python3
```

В ноутбуке `sys.executable`:
```
/home/user/kernels-lab/venv/bin/python
```
