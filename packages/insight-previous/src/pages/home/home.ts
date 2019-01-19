import { Component, Injectable, ViewChild } from '@angular/core';
import { Events, IonicPage, NavParams } from 'ionic-angular';
import { LatestBlocksComponent } from '../../components/latest-blocks/latest-blocks';
import { ApiProvider, ChainNetwork } from '../../providers/api/api';
import { PriceProvider } from '../../providers/price/price';

@Injectable()
@IonicPage({
  name: 'home',
  segment: 'home/:chain/:network'
})
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  @ViewChild('latestBlocks')
  public latestBlocks: LatestBlocksComponent;
  constructor(
    public navParams: NavParams,
    private apiProvider: ApiProvider,
    private priceProvider: PriceProvider,
    public events: Events
  ) {
    const chainNetwork: ChainNetwork = {
      chain:
        navParams.get('chain') ||
        this.apiProvider.networkSettings.value.selectedNetwork.chain,
      network:
        navParams.get('network') ||
        this.apiProvider.networkSettings.value.selectedNetwork.network
    };
    this.apiProvider.changeNetwork(chainNetwork);
    this.loadView(chainNetwork, false);
  }

  public loadView(chainNetwork: ChainNetwork, currencyChanged: boolean) {
    this.priceProvider.setCurrency(chainNetwork.chain);
    if (currencyChanged) {
      this.latestBlocks.reloadData();
    }
  }
}
