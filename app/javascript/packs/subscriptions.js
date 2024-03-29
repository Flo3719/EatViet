document.addEventListener("turbolinks:load", function() {
  const publishableKey = document.querySelector("meta[name='stripe-key']").content;
  const stripe = Stripe(publishableKey);

  var checkoutButton = document.getElementById("checkout-button");

  checkoutButton.addEventListener("click", function () {
    fetch("/checkouts", {
      method: "POST",
    })
      .then(function (response) {
        return response.json();
      })
      .then(function (session) {
        console.log(session)
        return stripe.redirectToCheckout({ sessionId: session.id });
      })
      .then(function (result) {
        // If redirectToCheckout fails due to a browser or network
        // error, you should display the localized error message to your
        // customer using error.message.
        if (result.error) {
          alert(result.error.message);
        }
      })
      .catch(function (error) {
        console.error("Error:", error);
      });
  });
});