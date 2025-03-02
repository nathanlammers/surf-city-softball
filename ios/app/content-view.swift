import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Load image from Assets.xcassets
            Image("Sports Complex") // Replace with actual image name
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle()) // Makes it round (optional)
            
            // Sign in with Apple Button
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Authorization successful: \(authResults)")
                case .failure(let error):
                    print("Authorization failed: \(error.localizedDescription)")
                }
            }
            .frame(width: 200, height: 50)
            .signInWithAppleButtonStyle(.black)
        }
        .padding()
    }
}




#Preview {
    ContentView()
}

    
