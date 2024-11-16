document.addEventListener('DOMContentLoaded', () => {
    const curpInput = document.getElementById('txtCurp');

    // Función para validar el CURP
    const validateCurp = (curp) => {
        // Expresión regular que solo permite letras y números, con exactamente 18 caracteres
        const curpPattern = /^[A-Z0-9]{18}$/;
        return curpPattern.test(curp);
    };

    // Evento que se activa al escribir en el input
    curpInput.addEventListener('input', () => {
        // Convertir a mayúsculas automáticamente
        curpInput.value = curpInput.value.toUpperCase();

        // Eliminar caracteres especiales no deseados
        curpInput.value = curpInput.value.replace(/[^A-Z0-9]/g, '');

        // Limitar el número de caracteres a 18
        if (curpInput.value.length > 18) {
            curpInput.value = curpInput.value.slice(0, 18);
        }
    });

    // Validar al enviar el formulario
    const form = curpInput.closest('form');
    form.addEventListener('submit', (event) => {
        if (!validateCurp(curpInput.value)) {
            event.preventDefault(); // Evitar que se envíe el formulario si no es válido
            alert('El CURP debe tener exactamente 18 caracteres alfanuméricos.');
        }
    });
});
