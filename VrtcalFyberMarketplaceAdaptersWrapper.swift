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
        IASDKCore.sharedInstance().initWithAppID("102960")
        sdkEventsLogger.log("Fyber Marketplace does not provide an sdk init callback")
    }
    
    func handle(vrtcalAsSecondaryConfig: VrtcalAsSecondaryConfig) {
        
        switch vrtcalAsSecondaryConfig.placementType {
                
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
