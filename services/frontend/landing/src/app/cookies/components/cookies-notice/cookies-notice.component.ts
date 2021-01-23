import { Component } from '@angular/core';
import { CookiesService } from '../../cookies.service';

@Component({
  selector: 'cookies-notice',
  templateUrl: './cookies-notice.component.html',
  styleUrls: ['./cookies-notice.component.scss'],
})
export class CookiesNoticeComponent {

  constructor(private _cookies: CookiesService) { }

  areAccepted(): boolean {
    return this._cookies.areAccepted();
  }

  acceptCookies(): void {
    this._cookies.acceptCookies();
  }


}
