From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 14 Jul 2015 09:36:19 +0200
Message-ID: <20150714073619.GB3736@phenom.ffwll.local>
References: <20150714125232.5059feb5@canb.auug.org.au>
 <55A49788.9070301@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <55A49788.9070301@codeaurora.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

T24gVHVlLCBKdWwgMTQsIDIwMTUgYXQgMTA6MzA6NTZBTSArMDUzMCwgQXJjaGl0IFRhbmVqYSB3
cm90ZToKPiAKPiBIaSwKPiAKPiBPbiAwNy8xNC8yMDE1IDA4OjIyIEFNLCBTdGVwaGVuIFJvdGh3
ZWxsIHdyb3RlOgo+ID5IaSBhbGwsCj4gPgo+ID5BZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0
cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NAo+ID5hbGxtb2Rjb25maWcpIGZh
aWxlZCBsaWtlIHRoaXM6Cj4gPgo+ID5kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJt
X2J1cy5jOiBJbiBmdW5jdGlvbiAndmlydGlvX3BjaV9raWNrX291dF9maXJtd2FyZV9mYic6Cj4g
PmRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcm1fYnVzLmM6NTU6MjogZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25m
bGljdGluZ19mcmFtZWJ1ZmZlcnMnIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0
aW9uXQo+ID4gICBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMo
YXAsICJ2aXJ0aW9kcm1mYiIsCj4gPiAgIF4KPiA+Cj4gPkNhdXNlZCBieSBjb21taXQKPiA+Cj4g
PiAgIDdiZDg3MGU3YjFjOCAoImRybS92aXJ0aW86IFVzZSBuZXcgZHJtX2ZiX2hlbHBlciBmdW5j
dGlvbnMiKQo+ID4KPiA+SSBoYXZlIHVzZWQgdGhlIGRybS1taXNjIHRyZWUgZnJvbSBuZXh0LTIw
MTUwNzEzIGZvciB0b2RheS4KPiA+Cj4gPihUaGF0IGNvbW1pdCBzYWlkICJDT01QSUxFIFRFU1RF
RCBPTkxZIiAgOi0oKQo+IAo+IE15IGJhZC4gVGhlIGNvbW1pdCBtZXNzYWdlcyB3ZXJlIGZvciBh
IHNsaWdodGx5IG9sZGVyIHZlcnNpb24uCj4gSSdsbCBmaXggdGhpcywgYW5kIHRoZSB3YXJuaW5n
cyBpbiB0aGUgb3RoZXIgbWFpbC4KClllYWggaXQncyBhIGJpZyBwYXRjaCBzZXJpZXMgd2l0aCBh
IHRlc3RpbmcgY2hpY2tlbi1lZ2cgcHJvYmxlbSwgc28gSQpmaWd1cmVkIEknbGwgZ2l2ZSBpdCBh
IHNwaW4gaW4gLW5leHQuIERyb3BwZWQgYWdhaW4gdW50aWwgaXQgd29ya3MgYmV0dGVyLgotRGFu
aWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
