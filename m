From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the
 drm-misc-fixes tree
Date: Mon, 30 Jan 2017 13:22:39 +1100
Message-ID: <20170130132239.6cb67529@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

SGkgYWxsLAoKVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSB0aXAgdHJlZSBnb3QgYSBj
b25mbGljdCBpbjoKCiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwoKYmV0d2VlbiBjb21t
aXQ6CgogIDdjNmQ2MzlkNDY1ZSAoImRybS90dG06IE1ha2Ugc3VyZSBCT3MgYmVpbmcgc3dhcHBl
ZCBvdXQgYXJlIGNhY2hlYWJsZSIpCgpmcm9tIHRoZSBkcm0tbWlzYy1maXhlcyB0cmVlIGFuZCBj
b21taXQ6CgogIGJkZmFmYzRmZmRkMiAoImxvY2tpbmcvYXRvbWljLCBrcmVmOiBLaWxsIGtyZWZf
c3ViKCkiKQoKZnJvbSB0aGUgdGlwIHRyZWUuCgpJIGZpeGVkIGl0IHVwIChzZWUgYmVsb3cpIGFu
ZCBjYW4gY2FycnkgdGhlIGZpeCBhcyBuZWNlc3NhcnkuIFRoaXMKaXMgbm93IGZpeGVkIGFzIGZh
ciBhcyBsaW51eC1uZXh0IGlzIGNvbmNlcm5lZCwgYnV0IGFueSBub24gdHJpdmlhbApjb25mbGlj
dHMgc2hvdWxkIGJlIG1lbnRpb25lZCB0byB5b3VyIHVwc3RyZWFtIG1haW50YWluZXIgd2hlbiB5
b3VyIHRyZWUKaXMgc3VibWl0dGVkIGZvciBtZXJnaW5nLiAgWW91IG1heSBhbHNvIHdhbnQgdG8g
Y29uc2lkZXIgY29vcGVyYXRpbmcKd2l0aCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgY29uZmxpY3Rp
bmcgdHJlZSB0byBtaW5pbWlzZSBhbnkgcGFydGljdWxhcmx5CmNvbXBsZXggY29uZmxpY3RzLgoK
LS0gCkNoZWVycywKU3RlcGhlbiBSb3Rod2VsbAoKZGlmZiAtLWNjIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKaW5kZXggODZlM2IyMzNiNzIyLGZmYzZjYjU1Yzc4Yy4uMDAwMDAwMDAwMDAw
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwpAQEAgLTE2NjksNyAtMTY0NSw3ICsxNjQ1LDYgQEBAIHN0YXRpYyBpbnQg
dHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9tZQogIAkgICAgY29udGFpbmVyX29mKHNocmluaywg
c3RydWN0IHR0bV9ib19nbG9iYWwsIHNocmluayk7CiAgCXN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm87CiAgCWludCByZXQgPSAtRUJVU1k7Ci0gCWludCBwdXRfY291bnQ7CiAtCXVpbnQzMl90
IHN3YXBfcGxhY2VtZW50ID0gKFRUTV9QTF9GTEFHX0NBQ0hFRCB8IFRUTV9QTF9GTEFHX1NZU1RF
TSk7CiAgCiAgCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogIAlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KGJvLCAmZ2xvYi0+c3dhcF9scnUsIHN3YXApIHsKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
