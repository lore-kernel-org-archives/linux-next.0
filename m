From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 2 Feb 2015 16:05:56 +1100
Message-ID: <20150202160556.61e0054e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n+lezH=+Cr_3wzZyTUuv2_3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36595 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795AbbBBFGC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2015 00:06:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>

--Sig_/n+lezH=+Cr_3wzZyTUuv2_3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/arm64/kvm/sys_regs.c between commit 3c1e71650833 ("arm/arm64: KVM:
Use set/way op trapping to track the state of the caches") from Linus'
tree and commit 6d52f35af10c ("arm64: KVM: add SGI generation register
emulation") from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/kvm/sys_regs.c
index b96afdf6cee4,7ad7af51856f..000000000000
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@@ -605,7 -693,9 +638,9 @@@ static const struct sys_reg_desc cp14_6
   * register).
   */
  static const struct sys_reg_desc cp15_regs[] =3D {
+ 	{ Op1( 0), CRn( 0), CRm(12), Op2( 0), access_gic_sgi },
+=20
 -	{ Op1( 0), CRn( 1), CRm( 0), Op2( 0), access_sctlr, NULL, c1_SCTLR },
 +	{ Op1( 0), CRn( 1), CRm( 0), Op2( 0), access_vm_reg, NULL, c1_SCTLR },
  	{ Op1( 0), CRn( 2), CRm( 0), Op2( 0), access_vm_reg, NULL, c2_TTBR0 },
  	{ Op1( 0), CRn( 2), CRm( 0), Op2( 1), access_vm_reg, NULL, c2_TTBR1 },
  	{ Op1( 0), CRn( 2), CRm( 0), Op2( 2), access_vm_reg, NULL, c2_TTBCR },

--Sig_/n+lezH=+Cr_3wzZyTUuv2_3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUzwW4AAoJEMDTa8Ir7ZwVbo4QAIYgLuwXr2JMuD1ZqPosjFkY
/i4ual8vJX1gGBI5/aMxJCt/Xequ98zORWBJ0jHrNY07/q1PK+Z9Ab+hm7PhYm/R
EGJroJ9hRT/c4CiUS+kpAlQuEji9XTN5mzhyohCvmE0/fsVGa40jjHVoNrZp/mqx
h2hfs8Nhf0BQMkbccIPygUd+8+FS7etQv0SJ+0xsWiuD/DaHZxPtNeXkmgRSbQRz
3+fb4UQjC/erTxmpMrW5mM7veyuv/+UpmGJqTHatAWeFYD9Ws3IdRNf2Uun56O85
4NA5OMU/RcOtSquJmM5fJaKdWrxmPnDdsPejrKvfnkVsg4dNYRe9sHlfwZTiRz2y
iyDXS+gAzPSYXJUh7om0ObvSnVMAlvQwznI6idgWZY3QXRQpKwXpBSKd8ro/+iMV
nsXcermbrLiXZGjw6h1AkpDR3aj31hzjmzB0qY92bN55RcbfedCc/tQ7HAl3k81B
jE8RaqnQkf2tU3R5/bDUka7F8N7sNdWZjODoj9TPcvDEZaf0rOhze8d+pEH6Jxe8
cfGNoUS3klY7h+yQAqP7H+k4lITfcauG0UHePp2WL6mMSzuuQVFZywaKC+MlG6GI
NveJvK+f0HVBRykR8Uj6kO9OlQ0hvq+qJF7WMA7Cs5GPwKwlNPOcBzUez1HwXlAN
l/+SiBRB1dlOf9ERuJqj
=GI8L
-----END PGP SIGNATURE-----

--Sig_/n+lezH=+Cr_3wzZyTUuv2_3--
