function validateRegisterForm() {
    let valid = true;

    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const role = document.getElementById('role').value;

    // Clear previous errors
    document.getElementById('usernameError').textContent = "";
    document.getElementById('emailError').textContent = "";
    document.getElementById('passwordError').textContent = "";
    document.getElementById('confirmPasswordError').textContent = "";
    document.getElementById('roleError').textContent = "";

    if (username === "") {
        document.getElementById('usernameError').textContent = "Username is required.";
        valid = false;
    }

    if (email === "") {
        document.getElementById('emailError').textContent = "Email is required.";
        valid = false;
    } else if (!/^\S+@\S+\.\S+$/.test(email)) {
        document.getElementById('emailError').textContent = "Enter a valid email.";
        valid = false;
    }

    if (password === "") {
        document.getElementById('passwordError').textContent = "Password is required.";
        valid = false;
    } else if (password.length < 6) {
        document.getElementById('passwordError').textContent = "Password must be at least 6 characters.";
        valid = false;
    }

    if (confirmPassword === "") {
        document.getElementById('confirmPasswordError').textContent = "Please confirm your password.";
        valid = false;
    } else if (password !== confirmPassword) {
        document.getElementById('confirmPasswordError').textContent = "Passwords do not match.";
        valid = false;
    }

    if (role === "") {
        document.getElementById('roleError').textContent = "Please select a role.";
        valid = false;
    }

    return valid;
}

function validateLoginForm() {
    let valid = true;

    const username = document.getElementById('loginUsername').value.trim();
    const password = document.getElementById('loginPassword').value;
    const role = document.getElementById('loginRole').value;

    document.getElementById('loginUsernameError').textContent = "";
    document.getElementById('loginPasswordError').textContent = "";
    document.getElementById('loginRoleError').textContent = "";

    if (username === "") {
        document.getElementById('loginUsernameError').textContent = "Username is required.";
        valid = false;
    }

    if (password === "") {
        document.getElementById('loginPasswordError').textContent = "Password is required.";
        valid = false;
    }

    if (role === "") {
        document.getElementById('loginRoleError').textContent = "Please select a role.";
        valid = false;
    }

    return valid;
}
