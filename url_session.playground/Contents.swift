import UIKit

func request() {

    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/3/") else { return }

    let session = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else { return }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { return }
        
        let jsonRes = try? JSONSerialization.jsonObject(with: data)
        print(jsonRes)
    }.resume()
}

request()
