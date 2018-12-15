From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 7/9] arm64: defconfig: Enable FSL_MC_BUS and FSL_MC_DPIO
Date: Sat, 15 Dec 2018 22:44:25 +0100 (CET)
Message-ID: <1541367377.58314.1544910265605@email.ionos.de>
References: <49a5d199-4eeb-a7c2-b539-13356162547f@free.fr>
 <beb32683-fbd0-fc17-8e71-4f4f51163223@free.fr>
 <VI1PR0402MB3485824A9FB3BC878E7B83D498C60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20181213064803.kd7p7fzsegu6nhnl@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213064803.kd7p7fzsegu6nhnl@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Horia Geanta <horia.geanta@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arm-soc <arm@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

SGksCgo+IE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9tLm5ldD4gaGF0IGFtIDEzLiBEZXplbWJl
ciAyMDE4IHVtIDA3OjQ4IGdlc2NocmllYmVuOgo+IAo+IAo+IE9uIEZyaSwgTm92IDA5LCAyMDE4
IGF0IDA2OjA1OjI0QU0gKzAwMDAsIEhvcmlhIEdlYW50YSB3cm90ZToKPiA+IE9uIDExLzkvMjAx
OCAzOjExIEFNLCBNYXJjIEdvbnphbGV6IHdyb3RlOgo+ID4gPiBDb21taXQgZTgzNDJjYzc5NTRl
ICgiZW5hYmxlIENBQU0gY3J5cHRvIGVuZ2luZSBvbiBRb3JJUSBEUEFBMiBTb0NzIikKPiA+ID4g
ZW5hYmxlZCBDUllQVE9fREVWX0ZTTF9EUEFBMl9DQUFNLCB3aGljaCBkZXBlbmRzIG9uIEZTTF9N
Q19EUElPLAo+ID4gPiB3aGljaCBpcyBub3Qgc2V0LiBFbmFibGUgRlNMX01DX0JVUywgYW5kIGJ1
aWxkIEZTTF9NQ19EUElPIGFuZAo+ID4gPiBDUllQVE9fREVWX0ZTTF9EUEFBMl9DQUFNIGFzIG1v
ZHVsZXMuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjIEdvbnphbGV6IDxtYXJjLncu
Z29uemFsZXpAZnJlZS5mcj4KPiA+IFJldmlld2VkLWJ5OiBIb3JpYSBHZWFudMSDIDxob3JpYS5n
ZWFudGFAbnhwLmNvbT4KPiAKPiBJIGhhZCB0byByZWRvIHRoaXMgb25lLCBhbmQgd2hlbiBJIGRp
ZCBJIG5vdGljZWQgdGhhdCB0aGVyZSdzIGFsc28gYW4gZXRoZXJuZXQKPiBkcml2ZXIuIFNob3Vs
ZCB0aGF0IGJlIGVuYWJsZWQgYXMgd2VsbD8KPiAKCnRoaXMgcGF0Y2ggaW4gbmV4dC0yMDE4MTIx
NCBicmVha3MgIm1ha2UgbW9kdWxlc19pbnN0YWxsIiBmb3IgYXJtNjQvZGVmY29uZmlnIG9uIG15
IFVidW50dSBtYWNoaW5lOgoKREVQTU9EICA0LjIwLjAtcmM2LW5leHQtMjAxODEyMTQKZGVwbW9k
OiBFUlJPUjogRm91bmQgNiBtb2R1bGVzIGluIGRlcGVuZGVuY3kgY3ljbGVzIQpkZXBtb2Q6IEVS
Uk9SOiBDeWNsZSBkZXRlY3RlZDogY2FhbWFsZ19kZXNjIC0+IGRwYWEyX2NhYW0gLT4gYXV0aGVu
YwpkZXBtb2Q6IEVSUk9SOiBDeWNsZSBkZXRlY3RlZDogY2FhbWFsZ19kZXNjIC0+IGRwYWEyX2Nh
YW0gLT4gZnNsX21jX2RwaW8KZGVwbW9kOiBFUlJPUjogQ3ljbGUgZGV0ZWN0ZWQ6IGRwYWEyX2Nh
YW0gLT4gY2FhbWhhc2hfZGVzYyAtPiBkcGFhMl9jYWFtCmRlcG1vZDogRVJST1I6IEN5Y2xlIGRl
dGVjdGVkOiBjYWFtYWxnX2Rlc2MgLT4gZHBhYTJfY2FhbSAtPiBjYWFtaGFzaF9kZXNjIC0+IGVy
cm9yCmRlcG1vZDogRVJST1I6IEN5Y2xlIGRldGVjdGVkOiBjYWFtYWxnX2Rlc2MgLT4gZHBhYTJf
Y2FhbSAtPiBjYWFtaGFzaF9kZXNjIC0+IGNhYW1hbGdfZGVzYwoKQWZ0ZXIgcmV2ZXJ0aW5nIG9m
IHRoaXMgcGF0Y2ggdGhlIGlzc3VlIGRpc2FwcGVhcmVkLgoKU3RlZmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
