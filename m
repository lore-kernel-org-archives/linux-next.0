From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] amdkfd: explicitely include io.h in kfd_doorbell.c
Date: Fri, 21 Nov 2014 15:54:34 -0500
Message-ID: <CADnq5_OKSNfTH_kfwR4OgbTdp5twA5EVk6Ec+5SA2=2u=rNwgQ@mail.gmail.com>
References: <1416600479-5767-1-git-send-email-oded.gabbay@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1416600479-5767-1-git-send-email-oded.gabbay@amd.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Oded Gabbay <oded.gabbay@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, jim.epost@gmail.com, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

T24gRnJpLCBOb3YgMjEsIDIwMTQgYXQgMzowNyBQTSwgT2RlZCBHYWJiYXkgPG9kZWQuZ2FiYmF5
QGFtZC5jb20+IHdyb3RlOgo+IFRoaXMgcGF0Y2ggZml4ZXMgYSBjb21waWxhdGlvbiBlcnJvciB3
aGVuIHVzaW5nIGNlcnRhaW4gY29uZmlndXJhdGlvbiBieQo+IGluY2x1ZGluZyB0aGUgZmlsZSBp
by5oIGluIGtmZF9kb29yYmVsbC5jCj4KPiBTaWduZWQtb2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2Rl
ZC5nYWJiYXlAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZG9vcmJlbGwuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZG9vcmJlbGwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kb29yYmVsbC5jCj4gaW5kZXggMGRjYjc4Ny4u
YjU3OTFhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZG9v
cmJlbGwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kb29yYmVsbC5j
Cj4gQEAgLTIzLDYgKzIzLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tbWFuLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9pby5oPgo+Cj4gIC8qCj4gICAqIFRoaXMgZXh0ZW5zaW9uIHN1cHBvcnRzIGEga2VybmVs
IGxldmVsIGRvb3JiZWxscyBtYW5hZ2VtZW50IGZvcgo+IC0tCj4gMi4xLjAKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
