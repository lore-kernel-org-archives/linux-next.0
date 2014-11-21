From: Oded Gabbay <oded.gabbay@amd.com>
Subject: [PATCH] amdkfd: explicitely include io.h in kfd_doorbell.c
Date: Fri, 21 Nov 2014 22:07:59 +0200
Message-ID: <1416600479-5767-1-git-send-email-oded.gabbay@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, jim.epost@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

VGhpcyBwYXRjaCBmaXhlcyBhIGNvbXBpbGF0aW9uIGVycm9yIHdoZW4gdXNpbmcgY2VydGFpbiBj
b25maWd1cmF0aW9uIGJ5CmluY2x1ZGluZyB0aGUgZmlsZSBpby5oIGluIGtmZF9kb29yYmVsbC5j
CgpTaWduZWQtb2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2RlZC5nYWJiYXlAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZG9vcmJlbGwuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2Rvb3JiZWxsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZG9v
cmJlbGwuYwppbmRleCAwZGNiNzg3Li5iNTc5MWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZG9vcmJlbGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZG9vcmJlbGwuYwpAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21t
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW1hbi5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNp
bmNsdWRlIDxsaW51eC9pby5oPgogCiAvKgogICogVGhpcyBleHRlbnNpb24gc3VwcG9ydHMgYSBr
ZXJuZWwgbGV2ZWwgZG9vcmJlbGxzIG1hbmFnZW1lbnQgZm9yCi0tIAoyLjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
