# Домашнее задание к занятию "`Практическое применение Docker`" - `Ефимов Вячеслав`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

![virt4-1-1](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-1-1.png)
![virt4-1-2*](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-1-2*.png)
![virt4-1-3*](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-1-3*.png)


---

### Задание 2

[vulnerabilities.csv](https://github.com/IthnHuitn/Virt4/blob/main/vulnerabilities.csv)

```markdown
# Отчет сканирования образа virt4-app

## Информация об образе
- **Реестр:** cr.yandex/crp4tqna6q9f5m1p3tkc
- **Репозиторий:** virt4-app
- **Тег:** latest
- **Digest:** sha256:e31e377100c9af7cf6b01db6e88b3af47fabb810e79356ad6b631f8fd12c19c4

## Сводка уязвимостей
| Уровень | Количество | Процент |
|---------|------------|---------|
| CRITICAL | 0 | 0% |
| HIGH | 2 | ~3% |
| MEDIUM | 9 | ~12% |
| LOW | ~60 | ~84% |
| UNDEFINED | 1 | ~1% |

## Критические уязвимости (HIGH)
1. **CVE-2026-0861** - HIGH
   - Пакеты: libc-bin, libc6
   - Фикс доступен: 2.41-12+deb13u2
   - Ссылка: https://avd.aquasec.com/nvd/cve-2026-0861

## Медиум уязвимости (MEDIUM)
- CVE-2025-15281 - libc-bin, libc6
- CVE-2026-0915 - libc-bin, libc6
- CVE-2025-7709 - libsqlite3-0
- CVE-2026-4105 - libsystemd0, libudev1 (без фикса)
- CVE-2026-27171 - zlib1g (без фикса)

## Заключение
Образ не содержит критических уязвимостей. 
Рекомендуется обновить libc для устранения HIGH-уязвимостей.
```


---

### Задание 3

![virt4-3-1](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-3-1.png)
![virt4-3-2](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-3-2.png)


### Задание 4

![virt4-4-1](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-4-1.png)
![virt4-4-2](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-4-2.png)
![virt4-4-3](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-4-3.png)
![virt4-4-4](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-4-4.png)


### Задание 5

![virt4-5-1](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-5-1.png)
![virt4-5-2](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-5-2.png)


### Задание 6

![virt4-6-1](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-6-1.png)
![virt4-6-2](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-6-2.png)
![virt4-6-3](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-6-3.png)
![virt4-6-4](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-6-4.png)
![virt4-6-5](https://github.com/IthnHuitn/Virt4/blob/main/screens/virt4-6-5.png)




