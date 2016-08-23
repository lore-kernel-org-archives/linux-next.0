From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Date: Tue, 23 Aug 2016 18:33:29 +0200
Message-ID: <20160823163329.GQ10980@phenom.ffwll.local>
References: <20160823115614.3182f7db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160823115614.3182f7db@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

T24gVHVlLCBBdWcgMjMsIDIwMTYgYXQgMTE6NTY6MTRBTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLWludGVsIHRyZWUs
IHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoYXJtCj4gbXVsdGlfdjdfZGVmY29uZmlnKSBmYWls
ZWQgbGlrZSB0aGlzOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwaW8vZ3Bp
b2xpYi1vZi5jOjE5OjA6Cj4gaW5jbHVkZS9saW51eC9pby1tYXBwaW5nLmg6MTE1OjMxOiBmYXRh
bCBlcnJvcjogYXNtL3BndGFibGVfdHlwZXMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252
aWYvb3MuaDoxNjowLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vY29yZS9vcy5oOjMsCj4gICAgICAgICAgICAgICAgICBmcm9tIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL29iamVjdC5oOjMsICAgCj4g
ICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZr
bS9jb3JlL2NsaWVudC5oOjMsICAgCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vY29yZS9jbGllbnQuYzoyNDoKPiBpbmNsdWRlL2xpbnV4L2lvLW1h
cHBpbmcuaDoxMTU6MzE6IGZhdGFsIGVycm9yOiBhc20vcGd0YWJsZV90eXBlcy5oOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5Cj4gCj4gYW5kIG1hbnkgbW9yZS4KPiAKPiBDYXVzZWQgYnkgY29t
bWl0Cj4gCj4gICBjYWZhZjE0YTVkOGYgKCJpby1tYXBwaW5nOiBBbHdheXMgY3JlYXRlIGEgc3Ry
dWN0IHRvIGhvbGQgbWV0YWRhdGEgYWJvdXQgdGhlIGlvLW1hcHBpbmciKQo+IAo+IEkgaGF2ZSB1
c2VkIHRoZSBkcm0taW50ZWwgdHJlZSBmcm9tIG5leHQtMjAxNjA4MjIgZm9yIHRvZGF5LgoKU2hv
dWxkIGJlIGZpeGVkIG5vdywgdGhhbmtzIGZvciByZXBvcnRpbmcuCi1EYW5pZWwKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
