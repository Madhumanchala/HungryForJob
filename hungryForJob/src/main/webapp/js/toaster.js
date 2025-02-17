/* const toast = document.querySelector(".toast"),
          closeIcon = document.querySelector(".close"),
          progress = document.querySelector(".progress"),
          toastMessage = document.getElementById("toastMessage"),
          toastDetail = document.getElementById("toastDetail");

    let timer1, timer2;

    // Function to show toast with dynamic messages
    function showToast(type,message,details) {
        toastMessage.textContent = message;
        toastDetail.textContent = details;

        toast.classList.add("active");
        toast.classList.add(type);
        progress.classList.add("active");

        timer1 = setTimeout(() => {
            toast.classList.remove("active");
        }, 5000); // Toast disappears after 5 seconds

        timer2 = setTimeout(() => {
            progress.classList.remove("active");
        }, 5300); // Progress bar disappears just after the toast
    }

    // Show the toast automatically when the page loads with a sample message
    window.onload = () => {
        showToast("warning1", "message","Your changes have been saved.");
    };

    closeIcon.addEventListener("click", () => {
        toast.classList.remove("active");

        setTimeout(() => {
            progress.classList.remove("active");
        }, 300);

        clearTimeout(timer1);
        clearTimeout(timer2);
    });*/
/* const toastTrigger = document.getElementById('liveToastBtn')
const toastLiveExample = document.getElementById('liveToast')
$(document).ready(function() {
 const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
toastBootstrap.show()
});
if (toastTrigger) {
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
  toastTrigger.addEventListener('click', () => {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastBootstrap.show()
  })
}*/

/*$(document).ready(function () {

      $('.toast').toast({ animation: true, autohide: true, delay: 3000 });
      $("#loginBtn").on("click", function () {
        $(".toast").toast("show");
        $('#type').text("Success");
        $('#message').text("Message loading from right to left...");
        $('#progressBar').addClass("progress-succes");
        $('#toastIcon').addClass("bi-check-circle-fill");
        $('#bgToaster').addClass("bg-succes");
        var progressBar = $('#progressBar');
        var width = 100;
        progressBar.css('width', '100%');
        var interval = setInterval(function () {
          if (width <= 0) {
            clearInterval(interval);
          } else {
            width--;
            progressBar.css('width', width+'%');
          }
        }, 10);
      });

    });

    function isToast(type, message) {
      if (type == "sucess") {

      }

    }*/
/*  const button = document.querySelector(".btn1"),
toast1 = document.querySelector(".toast1");
closeIcon = document.querySelector(".close"),
progress = document.querySelector(".progress");

let timer1, timer2;

button.addEventListener("click", () => {
toast1.classList.add("active");
progress.classList.add("active");

timer1 = setTimeout(() => {
toast1.classList.remove("active");
}, 5000);

timer2 = setTimeout(() => {
progress.classList.remove("active");
}, 5300);
});

closeIcon.addEventListener("click", () => {
toast1.classList.remove("active");

setTimeout(() => {
progress.classList.remove("active");
}, 300);

clearTimeout(timer1);
clearTimeout(timer2);
});*/

function showToast(type,message)
{
	const toast1 = document.querySelector(".toast1");
    const closeIcon = document.querySelector(".close");
    const progress = document.querySelector(".progress");
    
    let timer1, timer2;
     toast1.classList.add("active");
      progress.style.width = "0%";
      setTimeout(() => {
        progress.style.width = "100%";
      }, 10);
      timer1 = setTimeout(() => {
        toast1.classList.remove("active");
      }, 6300);
      timer2 = setTimeout(() => {
        progress.style.width = "0%";
      }, 6300);
      
      closeIcon.addEventListener("click", () => {
      toast1.classList.remove("active");
      progress.style.width = "0%";
      clearTimeout(timer1);
      clearTimeout(timer2);
    });
     
	if(type === "success")
	{
		$('#toasterProgress').addClass('progress-succes').removeClass('progress-warning progress-error progress-info');
		$('#toasterIcon').addClass('bi-check-circle-fill').removeClass('bi-exclamation-circle-fill  bi-x-circle-fill bi-info-circle-fill');
		$('#toastType').text('Success');
		$('#message').text(message);
	}else if(type === "error")
	{
		$('#toasterProgress').addClass('progress-error').removeClass('progress-warning  progress-succes progress-info');
		$('#toasterIcon').addClass('bi-x-circle-fill').removeClass('bi-exclamation-circle-fill  bi-check-circle-fill bi-info-circle-fill');
		$('#toastType').text('Error');
		$('#message').text(message);
		
	}else if(type === "info")
	{
		$('#toasterProgress').addClass('progress-info').removeClass('progress-warning  progress-succes progress-error');
		$('#toasterIcon').addClass('bi-info-circle-fill').removeClass('bi-x-circle-fill  bi-check-circle-fill  bi-exclamation-circle-fill');
		$('#toastType').text('Info');
		$('#message').text(message);
			
	}else if(type === "warning")
	{
		$('#toasterProgress').addClass('progress-warning').removeClass('progress-info progress-succes progress-error');
		$('#toasterIcon').addClass('bi-exclamation-circle-fill').removeClass('bi-x-circle-fill  bi-check-circle-fill bi-info-circle-fill ');
		$('#toastType').text('Warning');
		$('#message').text(message);
		
	}else 
	{
		$('#toasterProgress').removeClass('progress-info progress-succes progress-error progress-warning');
		$('#toasterIcon').removeClass('bi-x-circle-fill  bi-check-circle-fill bi-info-circle-fill bi-exclamation-circle-fill');
		$('#toastType').text('');
		$('#message').text(message);
	}
	
	
     
}
/*const button = document.querySelector(".btn1");
    const toast1 = document.querySelector(".toast1");
    const closeIcon = document.querySelector(".close");
    const progress = document.querySelector(".progress");
    let timer1, timer2;
    button.addEventListener("click", () => {
      toast1.classList.add("active");
      progress.style.width = "0%";
      setTimeout(() => {
        progress.style.width = "100%";
      }, 10);
      timer1 = setTimeout(() => {
        toast1.classList.remove("active");
      }, 5000);
      timer2 = setTimeout(() => {
        progress.style.width = "0%";
      }, 5300);
    });
    closeIcon.addEventListener("click", () => {
      toast1.classList.remove("active");
      progress.style.width = "0%";
      clearTimeout(timer1);
      clearTimeout(timer2);
    });*/