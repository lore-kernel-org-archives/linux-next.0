From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Tue, 21 Dec 2010 16:28:30 +0100
Message-ID: <AANLkTi=52p7CwsChj5BL+smnXzPtYzf1qE5A7h7o0V6X@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016364ed868f8c1670497ed49c0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:41113 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776Ab0LUP2c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2010 10:28:32 -0500
In-Reply-To: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@kernel.dk>
Cc: systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com

--0016364ed868f8c1670497ed49c0
Content-Type: text/plain; charset=UTF-8

What about using d_set_d_op() ?

- Sedat -

$ diff -Naur orig/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch
--- orig/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
2010-12-21 09:31:38.649601964 +0100
+++ cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch
2010-12-21 16:23:29.147497577 +0100
@@ -21,6 +21,9 @@
 ---
 One of the patches in my vfs scaling series tripped over this, comments?

+v2: Refreshed to fit linux-next (next-20101220)
+v3: Use d_set_d_op()
+
  kernel/cgroup.c |   27 ++++++++++++++++++++++-----
  1 file changed, 22 insertions(+), 5 deletions(-)

@@ -68,7 +71,7 @@

 +      if (dentry->d_name.len > NAME_MAX)
 +              return ERR_PTR(-ENAMETOOLONG);
-+      dentry->d_op = &cgroup_dentry_operations;
++      d_set_d_op(dentry, &cgroup_dentry_operations);
 +      d_add(dentry, NULL);
 +      return NULL;
 +}
@@ -83,7 +86,7 @@
                inode->i_size = 0;
                inode->i_fop = &cgroup_file_operations;
        }
--      dentry->d_op = &cgroup_dops;
+-      d_set_d_op(dentry, &cgroup_dops);
        d_instantiate(dentry, inode);
        dget(dentry);   /* Extra count - pin the dentry in core */
        return 0;

--0016364ed868f8c1670497ed49c0
Content-Type: plain/text;
	name="cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch"
Content-Disposition: attachment;
	filename="cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ghyy8wiy0

TGlzdDogICAgICAgbGludXgtZnNkZXZlbApTdWJqZWN0OiAgICBbcGF0Y2hdIGNncm91cCBmczog
YXZvaWQgc3dpdGNoaW5nIC0+ZF9vcCBvbiBsaXZlIGRlbnRyeQpGcm9tOiAgICAgICBOaWNrIFBp
Z2dpbiA8bnBpZ2dpbiAoKSBrZXJuZWwgISBkaz4KRGF0ZTogICAgICAgMjAxMC0xMi0yMSA3OjEy
OjUzCk1lc3NhZ2UtSUQ6IDIwMTAxMjIxMDcxMjUzLkdBNDc5NCAoKSBhbWQKCmNncm91cCBmczog
YXZvaWQgc3dpdGNoaW5nIC0+ZF9vcCBvbiBsaXZlIGRlbnRyeQoKU3dpdGNoaW5nIGRfb3Agb24g
YSBsaXZlIGRlbnRyeSBpcyByYWN5IGluIGdlbmVyYWwsIHNvIGF2b2lkIGl0LiBJbiB0aGlzIGNh
c2UKaXQgaXMgYSBuZWdhdGl2ZSBkZW50cnksIHdoaWNoIGlzIHNhZmVyLCBidXQgdGhlcmUgYXJl
IHN0aWxsIGNvbmN1cnJlbnQgb3BzCndoaWNoIG1heSBiZSBjYWxsZWQgb24gZF9vcCBpbiB0aGF0
IGNhc2UgKGVnLiBkX3JldmFsaWRhdGUpLiBTbyBpbiBnZW5lcmFsCmEgZmlsZXN5c3RlbSBtYXkg
bm90IGRvIHRoaXMuIEZpeCBjZ3JvdXBmcyBzbyBhcyBub3QgdG8gZG8gdGhpcy4KClRoaXMgY2F1
c2VkIHByb2JsZW1hdGljIGludGVyYWN0aW9uIHdpdGggb3RoZXIgZGV2ZWxvcG1lbnQgd29yaywg
dGhhbmtzCnRvIFNlZGF0IERpbGVrIGFuZCBFcmljIFBhcmlzIGZvciByZXBvcnRpbmcgdGhlIGlz
c3VlIGhlcmU6CgogIGh0dHA6Ly9tYXJjLmluZm8vP2w9bGludXgtbmV4dCZtPTEyOTI4NzkyNDcy
NzQ3NSZ3PTIKClNpZ25lZC1vZmYtYnk6IE5pY2sgUGlnZ2luIDxucGlnZ2luQGtlcm5lbC5kaz4K
Ci0tLQpPbmUgb2YgdGhlIHBhdGNoZXMgaW4gbXkgdmZzIHNjYWxpbmcgc2VyaWVzIHRyaXBwZWQg
b3ZlciB0aGlzLCBjb21tZW50cz8KCnYyOiBSZWZyZXNoZWQgdG8gZml0IGxpbnV4LW5leHQgKG5l
eHQtMjAxMDEyMjApCnYzOiBVc2UgZF9zZXRfZF9vcCgpCgoga2VybmVsL2Nncm91cC5jIHwgICAy
NyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKSW5kZXg6IGxpbnV4LTIuNi9rZXJuZWwvY2dyb3VwLmMK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotLS0gbGludXgtMi42Lm9yaWcva2VybmVsL2Nncm91cC5jCTIwMTAtMTItMjEg
MTY6MDI6MzIuMDAwMDAwMDAwICsxMTAwCisrKyBsaW51eC0yLjYva2VybmVsL2Nncm91cC5jCTIw
MTAtMTItMjEgMTY6NTE6MzkuMDAwMDAwMDAwICsxMTAwCkBAIC03NjMsNiArNzYzLDggQEAgRVhQ
T1JUX1NZTUJPTF9HUEwoY2dyb3VwX3VubG9jayk7CiAgKiAtPiBjZ3JvdXBfbWtkaXIuCiAgKi8K
IAorc3RhdGljIHN0cnVjdCBkZW50cnkgKmNncm91cF9sb29rdXAoc3RydWN0IGlub2RlICpkaXIs
CisJCQlzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHN0cnVjdCBuYW1laWRhdGEgKm5kKTsKIHN0YXRp
YyBpbnQgY2dyb3VwX21rZGlyKHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50
cnksIGludCBtb2RlKTsKIHN0YXRpYyBpbnQgY2dyb3VwX3JtZGlyKHN0cnVjdCBpbm9kZSAqdW51
c2VkX2Rpciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KTsKIHN0YXRpYyBpbnQgY2dyb3VwX3BvcHVs
YXRlX2RpcihzdHJ1Y3QgY2dyb3VwICpjZ3JwKTsKQEAgLTIxODAsNyArMjE4Miw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGNncm8KIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaW5vZGVfb3BlcmF0aW9ucyBjZ3JvdXBfZGlyX2lub2RlX29wZXJhdGlvbnMgPSB7Ci0J
Lmxvb2t1cCA9IHNpbXBsZV9sb29rdXAsCisJLmxvb2t1cCA9IGNncm91cF9sb29rdXAsCiAJLm1r
ZGlyID0gY2dyb3VwX21rZGlyLAogCS5ybWRpciA9IGNncm91cF9ybWRpciwKIAkucmVuYW1lID0g
Y2dyb3VwX3JlbmFtZSwKQEAgLTIxOTYsMTMgKzIxOTgsMjkgQEAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgY2Z0eXBlICpfX2ZpbGVfY2Z0KAogCXJldHVybiBfX2RfY2Z0KGZpbGUtPmZfZGVudHJ5KTsK
IH0KIAotc3RhdGljIGludCBjZ3JvdXBfY3JlYXRlX2ZpbGUoc3RydWN0IGRlbnRyeSAqZGVudHJ5
LCBtb2RlX3QgbW9kZSwKLQkJCQlzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQorc3RhdGljIGludCBj
Z3JvdXBfZGVsZXRlX2RlbnRyeShzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCit7CisJcmV0dXJuIDE7
Cit9CisKK3N0YXRpYyBzdHJ1Y3QgZGVudHJ5ICpjZ3JvdXBfbG9va3VwKHN0cnVjdCBpbm9kZSAq
ZGlyLAorCQkJc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBzdHJ1Y3QgbmFtZWlkYXRhICpuZCkKIHsK
LQlzdGF0aWMgY29uc3Qgc3RydWN0IGRlbnRyeV9vcGVyYXRpb25zIGNncm91cF9kb3BzID0gewor
CXN0YXRpYyBjb25zdCBzdHJ1Y3QgZGVudHJ5X29wZXJhdGlvbnMgY2dyb3VwX2RlbnRyeV9vcGVy
YXRpb25zID0geworCQkuZF9kZWxldGUgPSBjZ3JvdXBfZGVsZXRlX2RlbnRyeSwKIAkJLmRfaXB1
dCA9IGNncm91cF9kaXB1dCwKIAl9OwogCisJaWYgKGRlbnRyeS0+ZF9uYW1lLmxlbiA+IE5BTUVf
TUFYKQorCQlyZXR1cm4gRVJSX1BUUigtRU5BTUVUT09MT05HKTsKKwlkX3NldF9kX29wKGRlbnRy
eSwgJmNncm91cF9kZW50cnlfb3BlcmF0aW9ucyk7CisJZF9hZGQoZGVudHJ5LCBOVUxMKTsKKwly
ZXR1cm4gTlVMTDsKK30KKworc3RhdGljIGludCBjZ3JvdXBfY3JlYXRlX2ZpbGUoc3RydWN0IGRl
bnRyeSAqZGVudHJ5LCBtb2RlX3QgbW9kZSwKKwkJCQlzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQor
ewogCXN0cnVjdCBpbm9kZSAqaW5vZGU7CiAKIAlpZiAoIWRlbnRyeSkKQEAgLTIyMjgsNyArMjI0
Niw2IEBAIHN0YXRpYyBpbnQgY2dyb3VwX2NyZWF0ZV9maWxlKHN0cnVjdCBkZW4KIAkJaW5vZGUt
Pmlfc2l6ZSA9IDA7CiAJCWlub2RlLT5pX2ZvcCA9ICZjZ3JvdXBfZmlsZV9vcGVyYXRpb25zOwog
CX0KLQlkX3NldF9kX29wKGRlbnRyeSwgJmNncm91cF9kb3BzKTsKIAlkX2luc3RhbnRpYXRlKGRl
bnRyeSwgaW5vZGUpOwogCWRnZXQoZGVudHJ5KTsJLyogRXh0cmEgY291bnQgLSBwaW4gdGhlIGRl
bnRyeSBpbiBjb3JlICovCiAJcmV0dXJuIDA7Ci0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1mc2RldmVsIiBpbgp0aGUgYm9k
eSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9t
byBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
--0016364ed868f8c1670497ed49c0--
