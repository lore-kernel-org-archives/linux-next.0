From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-intel tree
Date: Tue, 23 Aug 2016 11:56:14 +1000
Message-ID: <20160823115614.3182f7db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

SGkgYWxsLAoKQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLWludGVsIHRyZWUsIHRvZGF5J3MgbGludXgt
bmV4dCBidWlsZCAoYXJtCm11bHRpX3Y3X2RlZmNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoKCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jOjE5OjA6CmluY2x1
ZGUvbGludXgvaW8tbWFwcGluZy5oOjExNTozMTogZmF0YWwgZXJyb3I6IGFzbS9wZ3RhYmxlX3R5
cGVzLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZpZi9vcy5oOjE2OjAsCiAgICAgICAgICAg
ICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vY29yZS9vcy5o
OjMsCiAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRl
L252a20vY29yZS9vYmplY3QuaDozLCAgIAogICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL2NvcmUvY2xpZW50Lmg6MywgICAKICAgICAgICAg
ICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9jbGllbnQuYzoy
NDoKaW5jbHVkZS9saW51eC9pby1tYXBwaW5nLmg6MTE1OjMxOiBmYXRhbCBlcnJvcjogYXNtL3Bn
dGFibGVfdHlwZXMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQoKYW5kIG1hbnkgbW9yZS4K
CkNhdXNlZCBieSBjb21taXQKCiAgY2FmYWYxNGE1ZDhmICgiaW8tbWFwcGluZzogQWx3YXlzIGNy
ZWF0ZSBhIHN0cnVjdCB0byBob2xkIG1ldGFkYXRhIGFib3V0IHRoZSBpby1tYXBwaW5nIikKCkkg
aGF2ZSB1c2VkIHRoZSBkcm0taW50ZWwgdHJlZSBmcm9tIG5leHQtMjAxNjA4MjIgZm9yIHRvZGF5
LgoKLS0gCkNoZWVycywKU3RlcGhlbiBSb3Rod2VsbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
