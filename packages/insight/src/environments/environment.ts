// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.

import { environment as environmentProd } from './environment.prod';

export const environment = {
  ...environmentProd,
  /**
   * Everything before the root API route itself, without a trailing `/`.
   *
   * For absolute paths, include `http`/`https`. (E.g. `https://api.bitcore.io/api`)
   *
   * For relative paths, begin with a `/`. (E.g. `/api`)
   *
   * Usage example: `${apiPrefix}/XVG/mainnet/block/tip`
   */
  apiPrefix: '/api',
  production: false,
  debugRouting: false,
  pollingRateMilliseconds: 20 * 1000,
  ...{
    loggingSettings: {
      ...environmentProd.loggingSettings,
      serverLoggingUrl: undefined
    }
  }
};

/*
 * In development mode, to ignore zone related error stack frames such as
 * `zone.run`, `zoneDelegate.invokeTask` for easier debugging, you can
 * import the following file, but please comment it out in production mode
 * because it will have performance impact when throw error
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
