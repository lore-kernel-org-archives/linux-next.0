From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Tue, 21 Dec 2010 16:12:03 +0100
Message-ID: <AANLkTik3y9AH3_=8VeW2vLsbEB_P8tw-Qxc+AkCJp4ck@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001636aa2b8c240d510497ed0f57
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53751 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773Ab0LUPME (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2010 10:12:04 -0500
In-Reply-To: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@kernel.dk>
Cc: systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com

--001636aa2b8c240d510497ed0f57
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 9:44 AM, Sedat Dilek <sedat.dilek@googlemail.com> w=
rote:
> Against linux-next (next-20101210) it should look like:
>
> $ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.pat=
ch
> cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
> --- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> =C2=A02010-12-21 09:31:38.649601964 +0100
> +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
> =C2=A02010-12-21 09:40:21.151033232 +0100
> @@ -83,7 +83,7 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inode->i_size =3D =
0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inode->i_fop =3D &=
cgroup_file_operations;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -- =C2=A0 =C2=A0 =C2=A0dentry->d_op =3D &cgroup_dops;
> +- =C2=A0 =C2=A0 =C2=A0d_set_d_op(dentry, &cgroup_dops);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0d_instantiate(dentry, inode);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dget(dentry); =C2=A0 /* Extra count - pin the =
dentry in core */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> - Sedat -
>

YAY!!!

# dmesg | grep systemd
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-2.6.37-rc6-686
root=3DUUID=3D1ceb69a7-ecf4-47e9-a231-b74e0f0a9b62 ro ini
[    4.124563] systemd[1]: systemd 15 running in system mode. (+PAM
-LIBWRAP -AUDIT +SELINUX +SYSVINIT -LIBCRYPTSETUP; debian)
[    4.246090] systemd[1]: Set hostname to <tbox>.
[    6.942949] systemd-logger[290]: Got error on stream: No such
process
[    9.011378] systemd-fsck[524]: /dev/sda3: sauber, 128062/640848
Dateien, 1839774/2560359 Bl=C3=B6cke
[   15.186112] systemd[1]: ifupdown-clean.service: control process
exited, code=3Dexited status=3D209
[   15.186941] systemd[1]: Unit ifupdown-clean.service entered failed state=
.
[   15.187363] systemd[1]: mountoverflowtmp.service: control process
exited, code=3Dexited status=3D209
[   15.206223] systemd[1]: Unit mountoverflowtmp.service entered failed sta=
te.
[   15.215739] systemd[1]: resolvconf.service: control process exited,
code=3Dexited status=3D209
[   15.235257] systemd[1]: Unit resolvconf.service entered failed state.

Feel free to add:

       Reported-and-tested-by: Sedat Dilek <sedat.dilek@gmail.com>

(Tested with the above v2 patch against linux-next (next-20101221) -
see file attachment).

- Sedat -

--001636aa2b8c240d510497ed0f57
Content-Type: plain/text;
	name="cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch"
Content-Disposition: attachment;
	filename="cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ghyxlk930

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
eHQtMjAxMDEyMjApCgoga2VybmVsL2Nncm91cC5jIHwgICAyNyArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKSW5kZXg6IGxpbnV4LTIuNi9rZXJuZWwvY2dyb3VwLmMKPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gbGludXgt
Mi42Lm9yaWcva2VybmVsL2Nncm91cC5jCTIwMTAtMTItMjEgMTY6MDI6MzIuMDAwMDAwMDAwICsx
MTAwCisrKyBsaW51eC0yLjYva2VybmVsL2Nncm91cC5jCTIwMTAtMTItMjEgMTY6NTE6MzkuMDAw
MDAwMDAwICsxMTAwCkBAIC03NjMsNiArNzYzLDggQEAgRVhQT1JUX1NZTUJPTF9HUEwoY2dyb3Vw
X3VubG9jayk7CiAgKiAtPiBjZ3JvdXBfbWtkaXIuCiAgKi8KIAorc3RhdGljIHN0cnVjdCBkZW50
cnkgKmNncm91cF9sb29rdXAoc3RydWN0IGlub2RlICpkaXIsCisJCQlzdHJ1Y3QgZGVudHJ5ICpk
ZW50cnksIHN0cnVjdCBuYW1laWRhdGEgKm5kKTsKIHN0YXRpYyBpbnQgY2dyb3VwX21rZGlyKHN0
cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIGludCBtb2RlKTsKIHN0YXRp
YyBpbnQgY2dyb3VwX3JtZGlyKHN0cnVjdCBpbm9kZSAqdW51c2VkX2Rpciwgc3RydWN0IGRlbnRy
eSAqZGVudHJ5KTsKIHN0YXRpYyBpbnQgY2dyb3VwX3BvcHVsYXRlX2RpcihzdHJ1Y3QgY2dyb3Vw
ICpjZ3JwKTsKQEAgLTIxODAsNyArMjE4Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9v
cGVyYXRpb25zIGNncm8KIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW5vZGVfb3BlcmF0aW9u
cyBjZ3JvdXBfZGlyX2lub2RlX29wZXJhdGlvbnMgPSB7Ci0JLmxvb2t1cCA9IHNpbXBsZV9sb29r
dXAsCisJLmxvb2t1cCA9IGNncm91cF9sb29rdXAsCiAJLm1rZGlyID0gY2dyb3VwX21rZGlyLAog
CS5ybWRpciA9IGNncm91cF9ybWRpciwKIAkucmVuYW1lID0gY2dyb3VwX3JlbmFtZSwKQEAgLTIx
OTYsMTMgKzIxOTgsMjkgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY2Z0eXBlICpfX2ZpbGVfY2Z0
KAogCXJldHVybiBfX2RfY2Z0KGZpbGUtPmZfZGVudHJ5KTsKIH0KIAotc3RhdGljIGludCBjZ3Jv
dXBfY3JlYXRlX2ZpbGUoc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBtb2RlX3QgbW9kZSwKLQkJCQlz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQorc3RhdGljIGludCBjZ3JvdXBfZGVsZXRlX2RlbnRyeShz
dHJ1Y3QgZGVudHJ5ICpkZW50cnkpCit7CisJcmV0dXJuIDE7Cit9CisKK3N0YXRpYyBzdHJ1Y3Qg
ZGVudHJ5ICpjZ3JvdXBfbG9va3VwKHN0cnVjdCBpbm9kZSAqZGlyLAorCQkJc3RydWN0IGRlbnRy
eSAqZGVudHJ5LCBzdHJ1Y3QgbmFtZWlkYXRhICpuZCkKIHsKLQlzdGF0aWMgY29uc3Qgc3RydWN0
IGRlbnRyeV9vcGVyYXRpb25zIGNncm91cF9kb3BzID0geworCXN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGVudHJ5X29wZXJhdGlvbnMgY2dyb3VwX2RlbnRyeV9vcGVyYXRpb25zID0geworCQkuZF9kZWxl
dGUgPSBjZ3JvdXBfZGVsZXRlX2RlbnRyeSwKIAkJLmRfaXB1dCA9IGNncm91cF9kaXB1dCwKIAl9
OwogCisJaWYgKGRlbnRyeS0+ZF9uYW1lLmxlbiA+IE5BTUVfTUFYKQorCQlyZXR1cm4gRVJSX1BU
UigtRU5BTUVUT09MT05HKTsKKwlkZW50cnktPmRfb3AgPSAmY2dyb3VwX2RlbnRyeV9vcGVyYXRp
b25zOworCWRfYWRkKGRlbnRyeSwgTlVMTCk7CisJcmV0dXJuIE5VTEw7Cit9CisKK3N0YXRpYyBp
bnQgY2dyb3VwX2NyZWF0ZV9maWxlKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgbW9kZV90IG1vZGUs
CisJCQkJc3RydWN0IHN1cGVyX2Jsb2NrICpzYikKK3sKIAlzdHJ1Y3QgaW5vZGUgKmlub2RlOwog
CiAJaWYgKCFkZW50cnkpCkBAIC0yMjI4LDcgKzIyNDYsNiBAQCBzdGF0aWMgaW50IGNncm91cF9j
cmVhdGVfZmlsZShzdHJ1Y3QgZGVuCiAJCWlub2RlLT5pX3NpemUgPSAwOwogCQlpbm9kZS0+aV9m
b3AgPSAmY2dyb3VwX2ZpbGVfb3BlcmF0aW9uczsKIAl9Ci0JZF9zZXRfZF9vcChkZW50cnksICZj
Z3JvdXBfZG9wcyk7CiAJZF9pbnN0YW50aWF0ZShkZW50cnksIGlub2RlKTsKIAlkZ2V0KGRlbnRy
eSk7CS8qIEV4dHJhIGNvdW50IC0gcGluIHRoZSBkZW50cnkgaW4gY29yZSAqLwogCXJldHVybiAw
OwotLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJz
Y3JpYmUgbGludXgtZnNkZXZlbCIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9t
b0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2Vy
bmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
--001636aa2b8c240d510497ed0f57--
