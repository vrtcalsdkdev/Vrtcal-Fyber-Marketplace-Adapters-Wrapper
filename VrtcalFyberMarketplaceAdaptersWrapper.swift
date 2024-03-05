import Vrtcal_Adapters_Wrapper_Parent
import IASDKCore

class VrtcalFyberMarketplaceAdaptersWrapper: NSObject, AdapterWrapperProtocol {

    var appLogger: Logger
    var sdkEventsLogger: Logger
    var sdk = SDK.fyberMarketplace
    var delegate: AdapterWrapperDelegate
    
    required init(
        appLogger: Logger,
        sdkEventsLogger: Logger,
        delegate: AdapterWrapperDelegate
    ) {
        self.appLogger = appLogger
        self.sdkEventsLogger = sdkEventsLogger
        self.delegate = delegate
    }
    
    func initializeSdk() {

        IASDKCore.sharedInstance().globalAdDelegate = self
        IASDKCore.sharedInstance().initWithAppID(
            "102960",
            completionBlock: { bool, error in
                self.sdkEventsLogger.log("Fyber Marketplace initialized: \(bool) error: \(String(describing: error))")
            },
            completionQueue: nil
        )
    }
    
    func handle(adTechConfig: AdTechConfig) {
        
        switch adTechConfig.placementType {
                
            case .banner:
                appLogger.log()
                
            case .interstitial:
                appLogger.log()
                
            case .rewardedVideo:
                sdkEventsLogger.log()
                
            case .showDebugView:
                sdkEventsLogger.log()
        }
    }
    
    func showInterstitial() -> Bool {
        false
    }
    
    func destroyInterstitial() {
        
    }
}

extension VrtcalFyberMarketplaceAdaptersWrapper: IAGlobalAdDelegate {
    // At the time of this writing, this is the only function in IAGlobalAdDelegate
    func adDidShow(with impressionData: IAImpressionData, with adRequest: IAAdRequest) {
        sdkEventsLogger.log("adDidShow impressionData: \(impressionData), adRequest: \(adRequest)")
    }
}
