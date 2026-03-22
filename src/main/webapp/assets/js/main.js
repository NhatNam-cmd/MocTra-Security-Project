

document.querySelectorAll('.subnav a[href^="#"]').forEach(a => {
    a.addEventListener('click', e => {
        e.preventDefault();
        const id = a.getAttribute('href');
        const el = document.querySelector(id);
        if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
});


document.addEventListener('DOMContentLoaded', function () {
    const inputs = document.querySelectorAll('.otp-input');
    const hiddenInput = document.getElementById('otpHiddenInput');

    function updateHiddenInput() {
        let code = '';
        inputs.forEach(i => code += (i.value || ''));
        hiddenInput.value = code;
    }

    inputs.forEach((input, index) => {

        input.addEventListener('input', (e) => {

            input.value = input.value.replace(/[^0-9]/g, '');


            if (e.inputType === 'insertFromPaste' && input.value.length > 1) {
                const chars = input.value.split('');
                input.value = chars[0];
                let nextIndex = index + 1;
                for (let i = 1; i < chars.length && nextIndex < inputs.length; i++, nextIndex++) {
                    inputs[nextIndex].value = chars[i].replace(/[^0-9]/g, '');
                }
            }


            if (input.value && index < inputs.length - 1) {
                inputs[index + 1].focus();
                inputs[index + 1].select();
            }

            updateHiddenInput();
        });


        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace') {
                if (input.value === '' && index > 0) {
                    inputs[index - 1].focus();
                    inputs[index - 1].value = '';
                    e.preventDefault();
                    updateHiddenInput();
                }
            }


            if (e.key === 'ArrowLeft' && index > 0) {
                inputs[index - 1].focus();
            }
            if (e.key === 'ArrowRight' && index < inputs.length - 1) {
                inputs[index + 1].focus();
            }
        });
    });
});

document.getElementById('otpForm').addEventListener('submit', function (e) {
    const inputs = document.querySelectorAll('.otp-input');
    let code = '';

    inputs.forEach(i => code += (i.value || ''));

    if (code.length !== 6) {
        alert('Vui lòng nhập đủ 6 số OTP');
        e.preventDefault();
        return;
    }

    document.getElementById('otpHiddenInput').value = code;
});

