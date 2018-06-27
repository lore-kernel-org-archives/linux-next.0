From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 2/2] sample/mdev/mbochs: add mbochs_kunmap_dmabuf
Date: Wed, 27 Jun 2018 09:55:48 +0800
Message-ID: <20180627095548.7c8735f2@t450s.home>
References: <20180625064453.19768-1-kraxel@redhat.com>
 <20180625064453.19768-2-kraxel@redhat.com>
 <20180626152012.530d9c16@t450s.home>
 <20180626073233.kievmdagzgtxs7j7@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180626073233.kievmdagzgtxs7j7@sirius.home.kraxel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "open list:VFIO MEDIATED DEVICE DRIVERS" <kvm@vger.kernel.org>, airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>, linux-next@vger.kernel.org, christian.koenig@amd.com
List-Id: linux-next.vger.kernel.org

T24gVHVlLCAyNiBKdW4gMjAxOCAwOTozMjozMyArMDIwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+ID4gPiAgCS5tYXAJCSAgPSBtYm9jaHNfa21hcF9kbWFidWYs
Cj4gPiA+ICsJLnVubWFwCQkgID0gbWJvY2hzX2t1bm1hcF9kbWFidWYsCj4gPiA+ICAJLm1tYXAJ
CSAgPSBtYm9jaHNfbW1hcF9kbWFidWYsCj4gPiA+ICB9Owo+ID4gPiAgICAKPiA+IAo+ID4gSXMg
dGhpcyBhIGZpeCBmb3IgdjQuMTg/ICAKPiAKPiBZZXMuCj4gCj4gPiBBRkFJQ1QsIHRoZSBrbWFw
X2F0b21pYyByZW1vdmFsIGlzIG9ubHkgaW4KPiA+IG5leHQsIG5vdCB5ZXQgdXBzdHJlYW0gYW5k
IGhvcGVmdWxseSBpbmNsdWRlcyB0aGlzIHNhbXBsZSBkcml2ZXIgYmVmb3JlCj4gPiBoaXR0aW5n
IG1haW5saW5lLiAgU2hvdWxkIHdlIHRoZXJlZm9yZSBoYXZlIGEgdjQuMTgtcmMgYmFzZWQgcGF0
Y2ggZm9yCj4gPiB0aGlzIHRvIGluY2x1ZGUgYmVmb3JlIHY0LjE4IHRvIHJlc29sdmUgdGhpcz8g
IAo+IAo+IFRoZSBrbWFwX2F0b21pYyBpbnRlcmZhY2Ugd2lsbCBiZSByZW1vdmVkIGluIDQuMTkg
YmVjYXVzZSBub2JvZHkgdXNlcwo+IGl0LCBzbyBkcm9wcGluZyB0aGUgbWJvY2hzIGltcGxlbWVu
dGF0aW9uIGFscmVhZHkgaW4gNC4xOCBzaG91bGQgbm90Cj4gY2F1c2UgYW55IGlzc3Vlcy4KPiAK
PiBTbyBqdXN0IHF1ZXVlIGJvdGggZm9yIDQuMTggd291bGQgYmUgdGhlIGVhc2llc3Qgd2F5IGRv
IGRlYWwgd2l0aCB0aGUKPiBkZXBlbmRlbmN5IEkgdGhpbmsuCgpPaywgc28gSSdsbCBkcm9wIHRo
ZSBmaXhlcyB0YWcgYW5kIGFwcGx5IGJvdGggdG8gbXkgZm9yLWxpbnVzIGJyYW5jaApmb3IgdjQu
MTggYW5kIHRoZW4gQ2hyaXN0aWFuIHdvbid0IG5lZWQgdG8gaW5jbHVkZSBpdCBmb3IgdGhlIHY0
LjE5CnBhdGNoLiAgVGhhbmtzLAoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
