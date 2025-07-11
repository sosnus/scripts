# Bash intro
```bash
#!/bin/bash
```

# 📄 Bash – Przekierowywanie wyjścia do plików i konsoli

W Bashu możesz **przekierowywać wyjście** poleceń na wiele sposobów:
- do plików,
- do konsoli,
- jednocześnie do obu.

## 🔁 Przekierowania w Bashu

| Sposób                   | Opis                                                                 | Przykład                                            |
|--------------------------|----------------------------------------------------------------------|-----------------------------------------------------|
| `>`                      | Nadpisuje plik wyjściem stdout (standardowe wyjście)                  | `ls > plik.txt`                                     |
| `>>`                     | Dopisuje wyjście stdout do istniejącego pliku                        | `ls >> plik.txt`                                    |
| `2>`                     | Przekierowanie stderr (błędów)                                       | `ls nieistnieje 2> blad.txt`                        |
| `2>>`                    | Dopisanie stderr do istniejącego pliku                               | `ls nieistnieje 2>> blad.txt`                       |
| `&>`                     | Przekierowanie stdout i stderr do jednego pliku                      | `ls * &> wszystko.txt`                              |
| `command | tee plik.txt` | Wyświetla na ekranie i zapisuje do pliku (nadpisuje)                 | `ls | tee plik.txt`                                 |
| `command | tee -a plik`  | Wyświetla na ekranie i dopisuje do pliku                             | `ls | tee -a plik.txt`                              |
| `command > /dev/null`    | Wyłącza stdout                                                       | `ls > /dev/null`                                    |
| `command 2> /dev/null`   | Ukrywa błędy                                                         | `ls nieistnieje 2> /dev/null`                       |
| `command &> /dev/null`   | Ukrywa wszystko (stdout + stderr)                                    | `ls nieistnieje &> /dev/null`                       |

---

## ✅ Przykłady praktyczne

### 1. Zapis stdout do pliku
```bash
echo "Hello world!" > log.txt
```

### 2. Dopisanie stderr do pliku
```bash
ls nieistnieje 2>> errors.log
```

### 3. Zapis stdout i stderr razem
```bash
some_command &> full_output.log
```

### 4. Wyświetlanie na konsolę i zapisywanie do pliku
```bash
python3 skrypt.py | tee wynik.txt
```

### 5. Tylko stderr, bez stdout
```bash
command 1> /dev/null 2> error_only.log
```

---

## 💡 Dodatki

- `tee` jest bardzo przydatne, gdy chcesz **widzieć wynik na żywo** i jednocześnie **zapisywać go**.
- `&>` to skrót do `1> file 2>&1` — przekierowanie stdout oraz stderr razem.





# OLD

          || visible in terminal ||   visible in file   || existing
  Syntax  ||  StdOut  |  StdErr  ||  StdOut  |  StdErr  ||   file   
==========++==========+==========++==========+==========++===========
    >     ||    no    |   yes    ||   yes    |    no    || overwrite
    >>    ||    no    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
   2>     ||   yes    |    no    ||    no    |   yes    || overwrite
   2>>    ||   yes    |    no    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
   &>     ||    no    |    no    ||   yes    |   yes    || overwrite
   &>>    ||    no    |    no    ||   yes    |   yes    ||  append
          ||          |          ||          |          ||
 | tee    ||   yes    |   yes    ||   yes    |    no    || overwrite
 | tee -a ||   yes    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    || overwrite
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
|& tee    ||   yes    |   yes    ||   yes    |   yes    || overwrite
|& tee -a ||   yes    |   yes    ||   yes    |   yes    ||  append
List:
command > output.txt

The standard output stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, it gets overwritten.

command >> output.txt

The standard output stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

command 2> output.txt

The standard error stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, it gets overwritten.

command 2>> output.txt

The standard error stream will be redirected to the file only, it will not be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

command &> output.txt

Both the standard output and standard error stream will be redirected to the file only, nothing will be visible in the terminal. If the file already exists, it gets overwritten.

command &>> output.txt

Both the standard output and standard error stream will be redirected to the file only, nothing will be visible in the terminal. If the file already exists, the new data will get appended to the end of the file..

command | tee output.txt

The standard output stream will be copied to the file, it will still be visible in the terminal. If the file already exists, it gets overwritten.

command | tee -a output.txt

The standard output stream will be copied to the file, it will still be visible in the terminal. If the file already exists, the new data will get appended to the end of the file.

(*)

Bash has no shorthand syntax that allows piping only StdErr to a second command, which would be needed here in combination with tee again to complete the table. If you really need something like that, please look at "How to pipe stderr, and not stdout?" on Stack Overflow for some ways how this can be done e.g. by swapping streams or using process substitution.

command |& tee output.txt

Both the standard output and standard error streams will be copied to the file while still being visible in the terminal. If the file already exists, it gets overwritten.

command |& tee -a output.txt

Both the standard output and standard error streams will be copied to the file while still being visible in the terminal. If the file already exists, the new data will get appended to the end of the file.