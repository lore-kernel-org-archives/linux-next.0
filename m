From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: nfs+tcp boot failures on linuxnext-20180924 from switch tcp_clock_ns
 to CLOCK_TAI
Date: Thu, 27 Sep 2018 01:15:37 +0000
Message-ID: <30e76d01dd08c2d9127072ad28c5a99afc5daabf.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <6DB2FAE00880BC40839F0F886B543003@eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

SGVsbG8sDQogDQpJdCBzZWVtcyB0aGF0IGFmdGVyIGNvbW1pdCA3MmIwMDk0ZjkxODIgKCJ0Y3A6
IHN3aXRjaCB0Y3BfY2xvY2tfbnMoKSB0bw0KQ0xPQ0tfVEFJIGJhc2UiKSBzb21lIHN5c3RlbXMg
dGhhdCB1c2UgbmZzIG92ZXIgdGNwIGZhaWwgdG8gYm9vdC4gVGhlDQpsYXN0IGxpbmUgcHJpbnRl
ZCBpbiB0aGUgbG9nIGlzIGZyb20gc3lzdGVtZDoNCiANClsgICAgNy4yMzI1NzldIHN5c3RlbWRb
MV06IFN5c3RlbSB0aW1lIGJlZm9yZSBidWlsZCB0aW1lLCBhZHZhbmNpbmcgY2xvY2suDQogDQpT
dXBlcmZpY2lhbGx5IGl0IGxvb2tzIGxpa2UgdmVyeSBsYXJnZSBjbG9jayBkaXNjb250aW51aXRp
ZXMgbm93IGJyZWFrDQpUQ1AuIE1heWJlIGJvb3R0aW1lIGNvdWxkIGF2b2lkIHN1Y2ggaXNzdWVz
Pw0KIA0KSSBkaWRuJ3QgZmluZCBzaW1pbGFyIHJlcG9ydHMgYW55d2hlcmUgZWxzZS4gVGhlIG1h
Y2hpbmVzIEnigJltIHNlZWluZw0KdGhpcyBhcmUgYWxsIDMyYml0IGFybSBpbXggKHRoaXMgc2hv
dWxkbuKAmXQgbWF0dGVyKSBhbmQgaXQgc2VlbXMgdGhlaXINClJUQyBpc27igJl0IHByb3Blcmx5
IHNldHVwIHNvIHRoZXkgYm9vdCB3aXRoIHJlYWx0aW1lIHNldCB0byB1bml4IHplcm8sDQp0aGVu
IGEgfjUwIHllYXJzIGp1bXAgaGFwcGVucyB3aGVuIHN5c3RlbWQgc3RhcnRzIHVwLiBUaGlzIGlz
IHRoZQ0KbGlrZWx5IHRyaWdnZXIgZm9yIHRoaXMgaXNzdWUuDQogDQotLQ0KUmVnYXJkcywNCkxl
b25hcmQNCg==
