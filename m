From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] sample/mdev/mbochs: add mbochs_kunmap_dmabuf
Date: Tue, 26 Jun 2018 09:32:33 +0200
Message-ID: <20180626073233.kievmdagzgtxs7j7@sirius.home.kraxel.org>
References: <20180625064453.19768-1-kraxel@redhat.com>
 <20180625064453.19768-2-kraxel@redhat.com>
 <20180626152012.530d9c16@t450s.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180626152012.530d9c16@t450s.home>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: "open list:VFIO MEDIATED DEVICE DRIVERS" <kvm@vger.kernel.org>, airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>, linux-next@vger.kernel.org, christian.koenig@amd.com
List-Id: linux-next.vger.kernel.org

PiA+ICAJLm1hcAkJICA9IG1ib2Noc19rbWFwX2RtYWJ1ZiwKPiA+ICsJLnVubWFwCQkgID0gbWJv
Y2hzX2t1bm1hcF9kbWFidWYsCj4gPiAgCS5tbWFwCQkgID0gbWJvY2hzX21tYXBfZG1hYnVmLAo+
ID4gIH07Cj4gPiAgCj4gCj4gSXMgdGhpcyBhIGZpeCBmb3IgdjQuMTg/CgpZZXMuCgo+IEFGQUlD
VCwgdGhlIGttYXBfYXRvbWljIHJlbW92YWwgaXMgb25seSBpbgo+IG5leHQsIG5vdCB5ZXQgdXBz
dHJlYW0gYW5kIGhvcGVmdWxseSBpbmNsdWRlcyB0aGlzIHNhbXBsZSBkcml2ZXIgYmVmb3JlCj4g
aGl0dGluZyBtYWlubGluZS4gIFNob3VsZCB3ZSB0aGVyZWZvcmUgaGF2ZSBhIHY0LjE4LXJjIGJh
c2VkIHBhdGNoIGZvcgo+IHRoaXMgdG8gaW5jbHVkZSBiZWZvcmUgdjQuMTggdG8gcmVzb2x2ZSB0
aGlzPwoKVGhlIGttYXBfYXRvbWljIGludGVyZmFjZSB3aWxsIGJlIHJlbW92ZWQgaW4gNC4xOSBi
ZWNhdXNlIG5vYm9keSB1c2VzCml0LCBzbyBkcm9wcGluZyB0aGUgbWJvY2hzIGltcGxlbWVudGF0
aW9uIGFscmVhZHkgaW4gNC4xOCBzaG91bGQgbm90CmNhdXNlIGFueSBpc3N1ZXMuCgpTbyBqdXN0
IHF1ZXVlIGJvdGggZm9yIDQuMTggd291bGQgYmUgdGhlIGVhc2llc3Qgd2F5IGRvIGRlYWwgd2l0
aCB0aGUKZGVwZW5kZW5jeSBJIHRoaW5rLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
