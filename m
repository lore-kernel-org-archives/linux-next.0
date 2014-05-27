From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH linux-next] DRM: Armada: update dma_buf_export use
Date: Tue, 27 May 2014 15:52:46 +1000
Message-ID: <CAPM=9twkXSA2uyVPfdz=qbpM5H96tHHaD8HnTf7YGpB0QX1WZw@mail.gmail.com>
References: <1400965544-20092-1-git-send-email-vincent.stehle@laposte.net>
 <CANq1E4QdGeHeuCu9LvPkbGZX5C+ax4fWVqq4kJ5wMUBx5uWZrQ@mail.gmail.com>
 <20140525225435.GZ3693@n2100.arm.linux.org.uk>
 <20140526090623.77186cdf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140526090623.77186cdf@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
List-Id: linux-next.vger.kernel.org

T24gMjYgTWF5IDIwMTQgMDk6MDYsIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3Jn
LmF1PiB3cm90ZToKPiBIaSBhbGwsCj4KPiBPbiBTdW4sIDI1IE1heSAyMDE0IDIzOjU0OjM1ICsw
MTAwIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCA8bGludXhAYXJtLmxpbnV4Lm9yZy51az4gd3Jv
dGU6Cj4+Cj4+IE9uIFN1biwgTWF5IDI1LCAyMDE0IGF0IDAyOjA4OjQ4UE0gKzAyMDAsIERhdmlk
IEhlcnJtYW5uIHdyb3RlOgo+PiA+Cj4+ID4gT24gU2F0LCBNYXkgMjQsIDIwMTQgYXQgMTE6MDUg
UE0sIFZpbmNlbnQgU3RlaGzDqQo+PiA+IDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4gd3Jv
dGU6Cj4+ID4gPiBUaGUgZG1hX2J1Zl9leHBvcnQgZnVuY3Rpb24gd2FzIHVwZGF0ZWQgaW4gY29t
bWl0IDRiY2VjNDRmZmFmOSAnZG1hLWJ1ZjogdXNlCj4+ID4gPiByZXNlcnZhdGlvbiBvYmplY3Rz
JyB0byB0YWtlIGEgcmVzZXJ2YXRpb24gb2JqZWN0IHBhcmFtZXRlcjsgdXBkYXRlIEFybWFkYQo+
PiA+ID4gZXhwb3J0IG1ldGhvZCBhY2NvcmRpbmdseS4KPj4gPiA+Cj4+ID4gPiBUaGlzIGZpeGVz
IHRoZSBmb2xsb3dpbmcgY29tcGlsYXRpb24gZXJyb3I6Cj4+ID4gPgo+PiA+ID4gICBkcml2ZXJz
L2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYzogSW4gZnVuY3Rpb24g4oCYYXJtYWRhX2dlbV9w
cmltZV9leHBvcnTigJk6Cj4+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2dl
bS5jOjU0NDoxNjogZXJyb3I6IG1hY3JvICJkbWFfYnVmX2V4cG9ydCIgcmVxdWlyZXMgNSBhcmd1
bWVudHMsIGJ1dCBvbmx5IDQgZ2l2ZW4KPj4gPiA+Cj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgo+PiA+ID4gQ2M6IFJ1c3Nl
bGwgS2luZyA8cm1rK2tlcm5lbEBhcm0ubGludXgub3JnLnVrPgo+PiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPj4gPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAY2Fub25pY2FsLmNvbT4KPj4gPiA+IENjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+PiA+Cj4+ID4gUmV2aWV3ZWQtYnk6IERhdmlkIEhlcnJt
YW5uIDxkaC5oZXJybWFubkBnbWFpbC5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtLmxpbnV4Lm9yZy51az4KPj4KPj4gQWlybGllZCwgY2FuIHlvdSBtZXJn
ZSB0aGlzIHBsZWFzZT8gIFRoYW5rcy4KPgo+IEV4Y2VwdCB0aGF0IGNvbW1pdCA0YmNlYzQ0ZmZh
ZjkgJ2RtYS1idWY6IHVzZSByZXNlcnZhdGlvbiBvYmplY3RzJwo+IGNvbWVzIGZyb20gdGhlIGRt
YS1idWYgdHJlZSwgc28gU3VtaXQgbmVlZHMgdG8gYWRkIHRoaXMgY29tbWl0IHRvIGhpcwo+IHRy
ZWUuCj4KClRoZW4gd2Ugc2hvdWxkIGNjIGhpbS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
