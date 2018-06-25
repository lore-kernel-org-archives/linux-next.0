From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] sample/mdev/mbochs: add mbochs_kunmap_dmabuf
Date: Mon, 25 Jun 2018 08:44:52 +0200
Message-ID: <20180625064453.19768-2-kraxel@redhat.com>
References: <20180625064453.19768-1-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180625064453.19768-1-kraxel@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: alex.williamson@redhat.com
Cc: "open list:VFIO MEDIATED DEVICE DRIVERS" <kvm@vger.kernel.org>, airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>, linux-next@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>, christian.koenig@amd.com
List-Id: linux-next.vger.kernel.org

VGhlcmUgaXMgbm8gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBmb3IgZG1hX2J1Zl9vcHMtPnVubWFw
LgpTbyBhZGQgYSBmdW5jdGlvbiB1bm1hcHBpbmcgdGhlIHBhZ2UsIG90aGVyd2lzZSB3ZSdsbCBs
ZWFrIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21i
b2Nocy5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKaW5kZXggYWEyNWNkYTIxZC4uODVh
YzYwMzc2OSAxMDA2NDQKLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKKysrIGIvc2Ft
cGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKQEAgLTgxMSwxMSArODExLDE4IEBAIHN0YXRpYyB2b2lk
ICptYm9jaHNfa21hcF9kbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBw
YWdlX251bSkKIAlyZXR1cm4ga21hcChwYWdlKTsKIH0KIAorc3RhdGljIHZvaWQgbWJvY2hzX2t1
bm1hcF9kbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBwYWdlX251bSwK
KwkJCQkgdm9pZCAqdmFkZHIpCit7CisJa3VubWFwKHZhZGRyKTsKK30KKwogc3RhdGljIHN0cnVj
dCBkbWFfYnVmX29wcyBtYm9jaHNfZG1hYnVmX29wcyA9IHsKIAkubWFwX2RtYV9idWYJICA9IG1i
b2Noc19tYXBfZG1hYnVmLAogCS51bm1hcF9kbWFfYnVmCSAgPSBtYm9jaHNfdW5tYXBfZG1hYnVm
LAogCS5yZWxlYXNlCSAgPSBtYm9jaHNfcmVsZWFzZV9kbWFidWYsCiAJLm1hcAkJICA9IG1ib2No
c19rbWFwX2RtYWJ1ZiwKKwkudW5tYXAJCSAgPSBtYm9jaHNfa3VubWFwX2RtYWJ1ZiwKIAkubW1h
cAkJICA9IG1ib2Noc19tbWFwX2RtYWJ1ZiwKIH07CiAKLS0gCjIuOS4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
