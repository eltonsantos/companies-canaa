document.addEventListener('DOMContentLoaded', () => {
  const zipcodeInput = document.getElementById('company_zipcode');
  const addressInput = document.getElementById('company_address_map');
  const neighborhoodInput = document.getElementById('company_neighborhood');
  const cityInput = document.getElementById('company_city');
  const stateInput = document.getElementById('company_state');

  zipcodeInput.addEventListener('blur', () => {
    const zipcode = zipcodeInput.value.replace(/\D/g, '');
    if (zipcode.length === 8) {
      fetch('/companies/get_address_by_zipcode', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ zipcode: zipcode })
      })
      .then(response => response.json())
      .then(data => {
        addressInput.value = data.address || '';
        neighborhoodInput.value = data.neighborhood || '';
        cityInput.value = data.city || '';
        stateInput.value = data.state || '';
      })
      .catch(error => console.error('Error:', error));
    }
  });
});
