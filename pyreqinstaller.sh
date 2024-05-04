#!/bin/bash

# Функция для проверки наличия библиотеки
check_library() {
    if python3 -c "import $1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Функция для установки библиотеки
install_library() {
    echo "Installing $1..."
    pip install $1
}

# Функция для создания виртуальной среды
create_venv() {
    if [ ! -d "venv" ]; then
        echo "Creating virtual environment..."
        python3 -m venv venv
    fi
    source venv/bin/activate
}

# Основная функция
main() {
    echo "Enter the path to the Python file:"
    read python_file

    # Получаем все импорты из файла Python
    imports=$(grep -E '^import|^from' $python_file | awk '{print $2}')

    # Проверяем наличие библиотек и собираем неустановленные
    missing_libs=()
    for lib in $imports; do
        if ! check_library $lib; then
            missing_libs+=("$lib")
        fi
    done

    # Если нет ни одной неустановленной библиотеки, выходим
    if [ ${#missing_libs[@]} -eq 0 ]; then
        echo "All required libraries are already installed."
        exit 0
    fi

    # Показываем список неустановленных библиотек
    echo "The following libraries are not installed:"
    for lib in "${missing_libs[@]}"; do
        echo "- $lib"
    done

    # Предлагаем пользователю действия
    echo "Select an option:"
    echo "1. Install missing libraries in current environment"
    echo "2. Create a new virtual environment and install missing libraries"
    echo "3. Cancel"
    read option

    case $option in
        1)
            for lib in "${missing_libs[@]}"; do
                install_library $lib
            done
            ;;
        2)
            create_venv
            for lib in "${missing_libs[@]}"; do
                install_library $lib
            done
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Invalid option. Exiting..."
            exit 1
            ;;
    esac

    echo "All missing libraries are installed."
}

# Вызываем основную функцию
main
