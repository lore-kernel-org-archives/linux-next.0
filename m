From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: fix build errors when ACPI is not
	enabled
Date: Tue, 28 Jun 2016 09:06:04 +0100
Message-ID: <20160628080604.GC25424@nuc-i3427.alporthouse.com>
References: <576EC660.3000806@infradead.org>
 <1467028399-9965-1-git-send-email-jani.nikula@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1467028399-9965-1-git-send-email-jani.nikula@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, drm-intel-fixes@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-next.vger.kernel.org

T24gTW9uLCBKdW4gMjcsIDIwMTYgYXQgMDI6NTM6MTlQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gRnJvbTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gCj4gRml4
IGJ1aWxkIGVycm9ycyB3aGVuIEFDUEkgaXMgbm90IGVuYWJsZWQgYnkgYWRkaW5nIGZ1bmN0aW9u
IHN0dWJzOgo+IAo+IC4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmM6IEluIGZ1bmN0
aW9uICdpOTE1X2RybV9zdXNwZW5kJzoKPiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
di5jOjYzNToyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2ludGVs
X29wcmVnaW9uX3VucmVnaXN0ZXInIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uXQo+ICAgaW50ZWxfb3ByZWdpb25fdW5yZWdpc3RlcihkZXZfcHJpdik7Cj4gLi4vZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYzogSW4gZnVuY3Rpb24gJ2k5MTVfZHJtX3Jlc3VtZSc6
Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYzo3OTg6MjogZXJyb3I6IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdpbnRlbF9vcHJlZ2lvbl9yZWdpc3RlcicgWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICBpbnRlbF9vcHJlZ2lvbl9y
ZWdpc3RlcihkZXZfcHJpdik7Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVu
bGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+
IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBGaXhlczogMDNkOTJlNDc3OWI4ICgiZHJtL2k5MTUvb3ByZWdp
b246IFJlbmFtZSBpbml0L2ZpbmkgZnVuY3Rpb25zIHRvIHJlZ2lzdGVyL3VucmVnaXN0ZXIiKQo+
IENjOiBkcm0taW50ZWwtZml4ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFtKYW5pOiBkcm9wcGVkIHRoZSBzdGFs
ZSBpbml0L2ZpbmkgZGVjbGFyYXRpb25zXQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KLUNocmlzCgotLSAKQ2hyaXMgV2lsc29uLCBJbnRlbCBPcGVuIFNv
dXJjZSBUZWNobm9sb2d5IENlbnRyZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngK
