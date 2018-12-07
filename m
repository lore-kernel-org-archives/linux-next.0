From: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: linux-next: build failure after merge of the
 drm-misc tree
Date: Fri, 7 Dec 2018 12:37:19 +0000
Message-ID: <43146de0-7401-b174-b96a-c8362e0b65f1@amd.com>
References: <20181206133219.38831da4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20181206133219.38831da4@canb.auug.org.au>
Content-Language: en-US
Content-ID: <5A23EAAF7AF7DF48AF8F2000352C0EFB@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

SGkgU3RlcGhlbiwKCnllYWgsIHRoYXQgaXMgYSBrbm93biBwcm9ibGVtLiBJIG1pc3NlZCB0aGUg
Y2hhbmdlIGR1cmluZyByZWJhc2Ugb2YgdGhlIApyZXZlcnQuCgpQbGVhc2Ugc2VlIHBhdGNoICIy
MzEyZjk4NDI4NTQgZHJtL3YzZDogZml4IGJyb2tlbiBidWlsZCIgd2hpY2ggaXMgCmFscmVhZHkg
aW4gZHJtLW1pc2MtbmV4dCBhbmQgZml4ZXMgdGhlIGlzc3VlLgoKQ2hyaXN0aWFuLgoKQW0gMDYu
MTIuMTggdW0gMDM6MzIgc2NocmllYiBTdGVwaGVuIFJvdGh3ZWxsOgo+IEhpIGFsbCwKPgo+IEFm
dGVyIG1lcmdpbmcgdGhlIGRybS1taXNjIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAo
eDg2XzY0Cj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOgo+Cj4gZHJpdmVycy9ncHUv
ZHJtL3YzZC92M2RfZ2VtLmM6IEluIGZ1bmN0aW9uICd2M2Rfc3VibWl0X3RmdV9pb2N0bCc6Cj4g
ZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmM6NzE5OjM6IGVycm9yOiB0b28gbWFueSBhcmd1
bWVudHMgdG8gZnVuY3Rpb24gJ2RybV9zeW5jb2JqX3JlcGxhY2VfZmVuY2UnCj4gICAgIGRybV9z
eW5jb2JqX3JlcGxhY2VfZmVuY2Uoc3luY19vdXQsIDAsIHNjaGVkX2RvbmVfZmVuY2UpOwo+ICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jOjU6Cj4gaW5jbHVkZS9kcm0vZHJtX3N5bmNvYmouaDox
MzQ6Njogbm90ZTogZGVjbGFyZWQgaGVyZQo+ICAgdm9pZCBkcm1fc3luY29ial9yZXBsYWNlX2Zl
bmNlKHN0cnVjdCBkcm1fc3luY29iaiAqc3luY29iaiwKPiAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+Cj4gQ2F1c2VkIGJ5IGNvbW1pdAo+Cj4gICAgMGIyNThlZDFhMjE5ICgiZHJt
OiByZXZlcnQgImV4cGFuZCByZXBsYWNlX2ZlbmNlIHRvIHN1cHBvcnQgdGltZWxpbmUgcG9pbnQg
djIiIikKPgo+IGludGVyYWN0aW5nIHdpdGggY29tbWl0Cj4KPiAgICAxNTg0ZjE2Y2E5NmUgKCJk
cm0vdjNkOiBBZGQgc3VwcG9ydCBmb3Igc3VibWl0dGluZyBqb2JzIHRvIHRoZSBURlUiKQo+Cj4g
SSBoYXZlIHVzZWQgdGhlIGRybS1taXNjIHRyZWUgZnJvbSBuZXh0LTIwMTgxMjA1IGZvciB0b2Rh
eS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50
ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
