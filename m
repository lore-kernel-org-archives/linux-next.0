From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Mon, 29 Dec 2008 16:11:05 +1100
Message-ID: <20081229161105.2a5125e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_16_11_05_+1100_Yr2Bm8h3.uBl0dNK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37452 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbYL2FLR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 00:11:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Hollis Blanchard <hollisb@us.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

--Signature=_Mon__29_Dec_2008_16_11_05_+1100_Yr2Bm8h3.uBl0dNK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
arch/powerpc/kvm/powerpc.c between commits
2a4aca1144394653269720ffbb5a325a77abd5fa ("powerpc/mm: Split low level
tlb invalidate for nohash processors") and
fad7b9b51e21a97e9e2662f1b51869ed2d209097 ("powerpc: Fix KVM build on
ppc440") from the powerpc tree (already merged into Linus' tree) and
commits 48e5562f7278782ae5d1772b7baa1ff76f035285 ("KVM: ppc: Refactor
powerpc.c to relocate 440-specific code") and
408e29020273079445b5a9161a80d6ce07ab6b1c ("KVM: ppc: Implement in-kernel
exit timing statistics") from the kvm tree.

I just used the kvm tree version of the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_16_11_05_+1100_Yr2Bm8h3.uBl0dNK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYW+kACgkQjjKRsyhoI8yVpgCgl72irUoID+Nxl8tUbPUAwIJG
Oq4Ani7H3PXDo3zMnjAwrttowAoVRTzs
=aNSG
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_16_11_05_+1100_Yr2Bm8h3.uBl0dNK--
