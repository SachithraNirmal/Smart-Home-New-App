import SwiftUI
import FirebaseAuth
import LocalAuthentication

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
                return
            }
            print("User logged in: \(authResult?.user.email ?? "")")
        }
    }

    func authenticateWithBiometrics() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to log in"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        loginUser()
                    } else {
                        alertMessage = authenticationError?.localizedDescription ?? "Unknown error"
                        showAlert = true
                    }
                }
            }
        } else {
            alertMessage = error?.localizedDescription ?? "Biometric authentication not available"
            showAlert = true
        }
    }

    @ViewBuilder
    func socialButton(label: String, image: String) -> some View {
        Button(action: {
            
        }) {
            HStack {
                Image(systemName: image)
                Text(label)
                    .font(.system(size: 16, weight: .medium))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1)
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Login")
                .font(.title)
                .bold()

            Text("Welcome !")
                .font(.title2)
                .bold()

            TextField("Enter your email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)

            HStack {
                Group {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .padding(.leading)

                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1)

            HStack {
                Spacer()
                Button("Forgot Password ?") {
                    
                }
                .font(.footnote)
                .foregroundColor(.gray)
            }

            Button(action: loginUser) {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }

            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray)
                Text("Or").foregroundColor(.gray)
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.horizontal)

            VStack(spacing: 10) {
                socialButton(label: "Continue with Apple", image: "apple.logo")
                socialButton(label: "Continue with Google", image: "globe")
                socialButton(label: "Continue with Facebook", image: "facebook")
            }

            Button(action: authenticateWithBiometrics) {
                Image(systemName: "touchid")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
            }

            HStack {
                Text("Don't have an account?")
                Button("Sign up") {
                    
                }
                .foregroundColor(.blue)
                .bold()
            }

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    
}

#Preview {
    Login()
}
