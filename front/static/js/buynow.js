document.addEventListener('DOMContentLoaded', () => {
    const paymentMethods = document.querySelectorAll('input[name="payment_method"]');
    const detailAreas = document.querySelectorAll('.payment-details');

    function showSelectedDetails() {
        const selectedMethod = document.querySelector('input[name="payment_method"]:checked').value;

        detailAreas.forEach(area => {
            area.style.display = 'none';
        });

        const targetId = selectedMethod + '_details';
        const targetElement = document.getElementById(targetId);
        if (targetElement) {
            targetElement.style.display = 'block';
        }
    }

    paymentMethods.forEach(input => {
        input.addEventListener('change', showSelectedDetails);
    });

    // 初回ロード時にも実行
    showSelectedDetails();
});