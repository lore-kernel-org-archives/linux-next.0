From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-misc tree with
 the drm tree
Date: Fri, 8 Feb 2019 09:53:33 +0100
Message-ID: <20190208085333.GH23159@phenom.ffwll.local>
References: <20190208122744.4a63bec0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190208122744.4a63bec0@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

T24gRnJpLCBGZWIgMDgsIDIwMTkgYXQgMTI6Mjc6NDRQTSArMTEwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSBk
cm0tbWlzYyB0cmVlIGdvdCBhIGNvbmZsaWN0IGluOgo+IAo+ICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfZGlzcGxheS5jCj4gCj4gYmV0d2VlbiBjb21taXQ6Cj4gCj4gICA5ZjU4ODkyZWE5
OTYgKCJkcm0vaTkxNTogUHVsbCBhbGwgdGhlIHJlc2V0IGZ1bmN0aW9uYWxpdHkgdG9nZXRoZXIg
aW50byBpOTE1X3Jlc2V0LmMiKQo+IAo+IGZyb20gdGhlIGRybSB0cmVlIGFuZCBjb21taXQ6Cj4g
Cj4gICBkMGU5MzU5OWQzOTYgKCJkcm0vaTkxNTogcHJlcGFyZSBmb3IgZHJtUC5oIHJlbW92YWwg
ZnJvbSBkcm1fbW9kZXNldF9oZWxwZXIuaCIpCj4gCj4gZnJvbSB0aGUgZHJtLW1pc2MgdHJlZS4K
PiAKPiBJIGZpeGVkIGl0IHVwIChJIHRoaW5rIEkgZ290IHRoZSByaWdodCBpbmNsdWRlIGZpbGVz
IGluIHRoZSByaWdodCBvcmRlciBpbgo+IHRoZSBlbmQgLSBzZWUgYmVsb3cgYW5kIHBsZWFzZSBj
aGVjayB0aGUgZmluYWwgcmVzdWx0KSBhbmQgY2FuIGNhcnJ5IHRoZQo+IGZpeCBhcyBuZWNlc3Nh
cnkuIFRoaXMgaXMgbm93IGZpeGVkIGFzIGZhciBhcyBsaW51eC1uZXh0IGlzIGNvbmNlcm5lZCwK
PiBidXQgYW55IG5vbiB0cml2aWFsIGNvbmZsaWN0cyBzaG91bGQgYmUgbWVudGlvbmVkIHRvIHlv
dXIgdXBzdHJlYW0KPiBtYWludGFpbmVyIHdoZW4geW91ciB0cmVlIGlzIHN1Ym1pdHRlZCBmb3Ig
bWVyZ2luZy4gIFlvdSBtYXkgYWxzbyB3YW50Cj4gdG8gY29uc2lkZXIgY29vcGVyYXRpbmcgd2l0
aCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgY29uZmxpY3RpbmcgdHJlZSB0bwo+IG1pbmltaXNlIGFu
eSBwYXJ0aWN1bGFybHkgY29tcGxleCBjb25mbGljdHMuCgpUaGVyZSBpc24ndCBhICJiZWxvdyIg
YWZhaWNzIC4uLi4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
