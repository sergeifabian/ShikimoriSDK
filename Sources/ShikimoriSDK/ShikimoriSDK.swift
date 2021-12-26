//
//  ShikimoriSDK.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Swinject
import SwinjectAutoregistration
import KeychainAccess

public final class ShikimoriSDK {

    public static let shared = ShikimoriSDK()

    private var configuration: ShikimoriConfiguration?

    private lazy var container: Container = {
        guard let configuration = configuration else {
            fatalError("Can't use SDK container without configuration")
        }

        return Container(defaultObjectScope: .container) { container in

            // Configuration

            container.autoregister(ShikimoriConfiguration.self, initializer: { configuration })

            // Keychain

            container.autoregister(Keychain.self, initializer: Keychain.build)
            container.autoregister(KeychainStorageType.self, initializer: KeychainStorage.init)

            // Target Providers

            container.autoregister(AccessTokenTargetProvider.self, initializer: AccessTokenTargetProvider.build)

            // Controllers

            container.autoregister(AuthorizationControllerType.self, initializer: AuthorizationController.init)

            // Data Sources

            container.autoregister(AuthStateDataSourceType.self, initializer: AuthStateDataSource.init)
            container.autoregister(AccessTokenLocalDataSourceType.self, initializer: AccessTokenLocalDataSource.init)
            container.autoregister(AccessTokenRemoteDataSourceType.self, initializer: AccessTokenRemoteDataSource.init)
            container.autoregister(AuthorizationCodeDataSourceType.self, initializer: AuthorizationCodeDataSource.init)

            // Repositories

            container.autoregister(AuthStateRepositoryType.self, initializer: AuthStateRepository.init)
            container.autoregister(AccessTokenRepositoryType.self, initializer: AccessTokenRepository.init)
            container.autoregister(AuthorizationCodeRepositoryType.self, initializer: AuthorizationCodeRepository.init)

            // Use Cases

            container.autoregister(GetAuthStateUseCaseType.self, initializer: GetAuthStateUseCase.init)
            container.autoregister(ObserveAuthStateUseCaseType.self, initializer: ObserveAuthStateUseCase.init)
            container.autoregister(SignInUseCaseType.self, initializer: SignInUseCase.init)
            container.autoregister(SignOutUseCaseType.self, initializer: SignOutUseCase.init)

            // Services

            container.autoregister(AuthServiceType.self, initializer: AuthService.init)
        }
    }()

    public var authService: AuthServiceType {
        container ~> AuthServiceType.self
    }

    private init() { }

    public func configure(configuration: ShikimoriConfiguration) {
        self.configuration = configuration
    }
}
