//
//  ResultLabelViewModel.swift
//  PriceComparator
//
//  Created by Paulo Henrique on 26/12/22.
//

struct ResultLabelViewModel {
    var updateResultLabel: ((_ resultText: String) -> Void)?
    
    func compareProducts(product1ViewModel: ProductViewModel, product2ViewModel: ProductViewModel) {
        guard let updateResultLabel = updateResultLabel else { return }
        
        guard
            let priceOfGram1 = product1ViewModel.priceOfGram,
            let priceOfGram2 = product2ViewModel.priceOfGram
        else {
            updateResultLabel("-")
            return
        }
        
        let chepeastProduct = ProductComparator.calculateTheChepeastProduct(
            priceOfGram1: priceOfGram1,
            priceOfGram2: priceOfGram2
        )

        updateResultLabel(chepeastProduct.rawValue.localized())
    }
}
