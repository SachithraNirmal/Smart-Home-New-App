import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase 


struct Signup: View {
    @State private var userName: String = ""
    @State private var number: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @State private var agreedToTerms: Bool = false
    @State private var errorMessage: String?
    @State private var showAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Sign up")
                .font(.title)
                .bold()

            Text("Welcome !")
                .font(.title2)
                .bold()

            Group {
                customTextField("User Name", text: $userName)
                customTextField("Phone Number", text: $number)
                customTextField("Email", text: $email)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                SecureField("Confirm Password", text: $confirmpassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 1)
            }

            HStack(alignment: .top) {
                Button(action: {
                    agreedToTerms.toggle()
                }) {
                    Image(systemName: agreedToTerms ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.black)
                }
                Text("By creating an account you agree to our **Terms and Conditions**")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {
                handleSignup()
            }) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan.opacity(0.6))
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sign Up"), message: Text(errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }

    @ViewBuilder
    func customTextField(_ placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1)
    }

    func handleSignup() {
        guard agreedToTerms else {
            errorMessage = "Please agree to the Terms and Conditions."
            showAlert = true
            return
        }

        guard !userName.isEmpty,
              !number.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password == confirmpassword else {
            errorMessage = "Please fill in all fields correctly."
            showAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Signup Error: \(error.localizedDescription)"
                print(error)
                print(result)
                self.showAlert = true
                return
            }
            
            guard let uid = result?.user.uid else {
                self.errorMessage = "Failed to retrieve user ID."
                self.showAlert = true
                return
            }
            
            let ref = Database.database().reference()
            let userRef = ref.child("users").child(uid)
            
            let userData: [String: Any] = [
                "userName": self.userName,
                "phoneNumber": self.number,
                "email": self.email
            ]
            
            userRef.setValue(userData) { error, _ in
                if let error = error {
                    self.errorMessage = "Database Error: \(error.localizedDescription)"
                } else {
                    self.errorMessage = "Account created successfully!"
                }
                self.showAlert = true
            }
        }
    }

}
#Preview {
    Signup()
}
