From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the mali-dp tree
Date: Tue, 15 Jan 2019 13:08:36 +0100
Message-ID: <20190115120836.GN10517@phenom.ffwll.local>
References: <20190115104619.516be4b9@canb.auug.org.au>
 <20190115101219.GP20661@e110455-lin.cambridge.arm.com>
 <20190115214725.360798cf@canb.auug.org.au>
 <20190115105102.GQ20661@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190115105102.GQ20661@e110455-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
List-Id: linux-next.vger.kernel.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTA6NTE6MDJBTSArMDAwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDk6NDc6MjVQTSArMTEwMCwgU3RlcGhlbiBS
b3Rod2VsbCB3cm90ZToKPiA+IEhpIExpdml1LAo+ID4gCj4gPiBPbiBUdWUsIDE1IEphbiAyMDE5
IDEwOjEyOjE5ICswMDAwIExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gVGhhdCBsb29rcyBsaWtlIHRoZSByaWdodCBmaXgsIHRoYW5rIHlvdSBmb3Ig
dGhhdCEKPiA+IAo+ID4gVGhhbmtzIGZvciB5b3VyIHZlcmlmaWNhdGlvbi4KPiA+IAo+ID4gPiBJ
IHdpbGwgcm9sbCB5b3VyIHBhdGNoIGludG8gbXkgdHJlZS4KPiA+IAo+ID4gWW91IGNhbiBvbmx5
IGRvIHRoYXQgd2hlbiB5b3VyIHRyZWUgaXMgbWVyZ2VkIHdpdGggdGhlIGRybSB0cmVlIChhbmQK
PiA+IGl0IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBtZXJnZSByZXNvbHV0aW9uKS4KPiAKPiBJIGNh
biBhbHNvIHJlYmFzZSBvbiB0b3Agb2YgdGhlIGxhdGVzdCBkcm0tbmV4dCB0cmVlLCB0aGF0IHNo
b3VsZCBub3QgYmUKPiBhIHByb2JsZW0uCgpJZiB5b3UgaGF2ZSBhIGxvdCBvZiBwYXRjaGVzIGFs
cmVhZHkgcmViYXNpbmcgaXMga2luZGEgZGlzY291cmFnZWQuIFRoZXJlCm1pZ2h0IGJlIG90aGVy
IHN0dWZmIHRoYXQncyBjb25mbGljdGluZyBhbmQgdGhlbiBtYWtpbmcgeW91ciBlbnRpcmUgdHJl
ZQpub24tYmlzZWN0YWJsZSAobWF5YmUganVzdCBvbiBvbmUgcGxhdGZvcm0gdGhhdCB5b3UgbWlz
c2VkIGluIHRlc3RpbmcpLgoKSW4gdGhhdCBjYXNlIGp1c3Qgc2VuZCBvdXQgYSBwdWxsIGZvciBk
cm0tbmV4dCBhbmQgaW5jbHVkZSB0aGUgbWVyZ2UKcmVzb2x1dGlvbiBpbiB0aGUgcHVsbCByZXF1
ZXN0IHNvIERhdmUvSSBjYW4gZG91YmxlLWNoZWNrIHdlIGRpZCBpdCByaWdodC4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
