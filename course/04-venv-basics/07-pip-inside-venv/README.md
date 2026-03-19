← [Назад](../06-lab-venv-create-activate/README.md) | [Оглавление](../../README.md) | [Далее →](../08-venv-internals/README.md)

# Установка пакетов внутри окружения (pip install)

> **Модуль 4 · Урок 7** | Время: ~10 мин

## pip до и после активации venv

В модуле 3 вы научились работать с pip: устанавливать, удалять, обновлять пакеты. Ключевой момент: pip привязан к конкретному интерпретатору Python.

При **неактивированном** venv команда `pip` (или `pip3`) указывает на тот Python, который pyenv или система подставляет в `PATH`. Пакеты установятся в его site-packages — глобально для этой версии.

При **активированном** venv shell первым находит `venv/bin` в PATH. Команды `python` и `pip` переопределяются на бинарники внутри venv. Все вызовы `pip install` идут **только** в site-packages этого окружения.

```
До активации:    pip → ~/.pyenv/versions/3.12.0/bin/pip  (глобальный site-packages)
После активации: pip → ./venv/bin/pip  (site-packages внутри venv)
```

## Куда идут пакеты

Пакеты, установленные в активированном venv, попадают в:

```
<проект>/venv/lib/python3.x/site-packages/
```

Там же лежат все зависимости. Системный Python и другие venv-окружения их не видят — полная изоляция.

## Проверка перед установкой

Перед `pip install` всегда убеждайтесь:

1. **Окружение активировано** — в prompt виден префикс `(venv)` или имя окружения.
2. **`which pip`** указывает внутрь venv:

```bash
source venv/bin/activate
which pip
```

```
/home/user/project/venv/bin/pip
```

3. **`pip --version`** покажет путь к Python venv:

```bash
pip --version
```

```
pip 24.0 from /home/user/project/venv/lib/python3.12/site-packages/pip (python 3.12)
```

## Рекомендуемый способ

Явный вызов через интерпретатор venv гарантирует, что пакет попадёт именно туда:

```bash
source venv/bin/activate
python -m pip install requests
```

Или без активации (если знаете путь к venv):

```bash
./venv/bin/python -m pip install requests
```

## Частые ошибки

### Ошибка 1 — Установка до активации venv

Если выполнить `pip install requests` **до** `source venv/bin/activate`, пакет установится в глобальное окружение (pyenv или системное). Проверяйте `which pip` перед установкой.

### Ошибка 2 — Путать, в какое окружение идёт install

В одном терминале может быть активен один venv, в другом — другой. `pip install` всегда использует pip **текущей** оболочки. Убедитесь, что вы в нужном venv.

### Ошибка 3 — Ожидать, что venv «подхватит» глобальные пакеты

Виртуальное окружение по умолчанию **не видит** системные пакеты. Всё, что нужно проекту, устанавливается отдельно в venv. (Исключение — флаг `--system-site-packages` при создании venv, о нём в модуле 5.)

---

← [Назад](../06-lab-venv-create-activate/README.md) | [Оглавление](../../README.md) | [Далее →](../08-venv-internals/README.md)
