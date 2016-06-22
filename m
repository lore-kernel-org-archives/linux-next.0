From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-misc tree with
	the arm tree
Date: Wed, 22 Jun 2016 10:23:36 +0200
Message-ID: <20160622082336.GN23520@phenom.ffwll.local>
References: <20160622114704.5b0c97eb@canb.auug.org.au>
 <CAKMK7uFDQPdUinsDQaFxCW31k5T9qXoiNkzQ-CuqYQPPbz99pA@mail.gmail.com>
 <20160622082110.GM22276@flint.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160622082110.GM22276@flint.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
List-Id: linux-next.vger.kernel.org

T24gV2VkLCBKdW4gMjIsIDIwMTYgYXQgMDk6MjE6MTFBTSArMDEwMCwgUnVzc2VsbCBLaW5nIHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDIyLCAyMDE2IGF0IDA5OjMxOjE4QU0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAyMiwgMjAxNiBhdCAzOjQ3IEFNLCBTdGVwaGVu
IFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4gPiA+IEhpIGFsbCwKPiA+
ID4KPiA+ID4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSBkcm0tbWlzYyB0cmVlIGdv
dCBhIGNvbmZsaWN0IGluOgo+ID4gPgo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Ry
di5jCj4gPiA+Cj4gPiA+IGJldHdlZW4gY29tbWl0Ogo+ID4gPgo+ID4gPiAgIDA2Mjk5M2IxNWU4
ZSAoImRybTogY29udmVydCBEVCBjb21wb25lbnQgbWF0Y2hpbmcgdG8gY29tcG9uZW50X21hdGNo
X2FkZF9yZWxlYXNlKCkiKQo+ID4gCj4gPiBXaHkgZGlkIHRoYXQgb25lIGVuZCB1cCBpbiB0aGUg
YXJtIHRyZWU/IFNob3VsZCBpdCBnbyBpbiB0aHJvdWdoCj4gPiBkcm0tbWlzYyBpbnN0ZWFkPwo+
IAo+IE1pbmUgaXMgcGFydCBvZiBhIHRocmVlIHBhcnQgcGF0Y2ggc2VyaWVzIHdoaWNoIGlzIHBh
cnQgb2YgdGhlIGNvbXBvbmVudAo+IGhlbHBlciB1cGRhdGVzICh3aGljaCBJJ20gdGhlIGF1dGhv
ciBhbmQgbWFpbnRhaW5lciBvZikuCj4gCj4gVGhlbiBzb21lb25lIGNhbWUgdXAgd2l0aCBhbiBh
bHRlcm5hdGl2ZSB3YXkgb2Ygc29tZSBvZiBwYXJ0IG9mIGl0Lgo+IAo+IFlvdSBjYW4ndCBtZXJn
ZSB0aGUgYWJvdmUgRFJNIHBhcnQsIGJlY2F1c2UgdGhhdCBtZWFucyB5b3UgYWxzbyBuZWVkIHRv
Cj4gbWVyZ2UgcGF0Y2ggMSwgd2hpY2ggaXMgY29yZSBjb21wb25lbnQgc3R1ZmYuCgpNYWtlcyBz
ZW5zZSwgYnV0IGdlbmVyYWxseSBpbiB0aGF0IGNhc2UgSSBhc2sgRGF2ZSBmb3IgYW4gZXhwbGlj
aXQgYWNrIGZvcgptZXJnaW5nIHRocm91Z2ggYW5vdGhlciB0cmVlIHRvIGF2b2lkIGNvbmZ1c2lv
bi4gTGFjayBvZiB0aGF0IGlzIHdoeSBJCmFza2VkLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
