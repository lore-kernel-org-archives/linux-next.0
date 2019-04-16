From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the kvm-fixes tree
Date: Tue, 16 Apr 2019 19:57:51 +1000
Message-ID: <20190416195751.67ec14cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MFcnYW5PhciN51kBiLnbt_m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/MFcnYW5PhciN51kBiLnbt_m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  27d2a2e9e5c1 ("selftests: kvm/evmcs_test: complete I/O before migrating g=
uest state")
  94b8fc757b02 ("KVM: nVMX: always use early vmcs check when EPT is disable=
d")

are missing a Signed-off-by from their author and commiter.

--=20
Cheers,
Stephen Rothwell

--Sig_/MFcnYW5PhciN51kBiLnbt_m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1px8ACgkQAVBC80lX
0GzpQQf40Rsx5hx9IK2fqAP/68R2/PifMmbv9f9Q7orVul60grl8vvRKHsPOU6OX
brBXl8ONw9xain3Z7E890R5ttAoccQ/mbG/qy0XUOfHEfxWhy4YaIzg7OZtGZVZg
jjAUDxA8dxjJGTmcxDScUvaA3AZKVCTDF+BHWrPuCkFpVx8u1r/DQ49BsehJL4ui
Y3BXvVrT8ZIQOCVNkPHr5NftcwlEOs/XEymIrgPjADMYsN6a7d5Ch+Tkitywn5FP
bUoMo5P9TBgCOPBavHVznlMHgKSn4WFIJFImAx0etWjF1kKVFlPz/4Zip87d39Q5
6BI8C4FVAMosuwg+LcY/KNIDl0V8
=QK5n
-----END PGP SIGNATURE-----

--Sig_/MFcnYW5PhciN51kBiLnbt_m--
