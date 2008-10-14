From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree
Date: Tue, 14 Oct 2008 12:02:59 +1100
Message-ID: <20081014120259.e902e407.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_12_02_59_+1100_L4Silmvga6v/2dGd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40574 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755508AbYJNC1H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 22:27:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Victor Gallardo <vgallardo@amcc.com>, "David S. Miller" <davem@davemloft.net>, Josh Boyer <jwboyer@linux.vnet.ibm.com>

--Signature=_Tue__14_Oct_2008_12_02_59_+1100_L4Silmvga6v/2dGd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul, Ben,

Today's linux-next merge of the powerpc tree got a conflict in
arch/powerpc/include/asm/dcr-regs.h between commit
6fbc779c03591ee536fef9efb7d7e20f281d0b5c ("ibm_newemac: Fix EMAC soft
reset on 460EX/GT") from Linus' tree and commit
fbcc4bacee30cad4e4a13d05492a9ed0c9c3e8c7 ("ibm_newemac: MAL support for
PowerPC 405EZ") from the powerpc tree.

Just overlapping additions.  I fixed it up by taking both additions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Tue__14_Oct_2008_12_02_59_+1100_L4Silmvga6v/2dGd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjz78MACgkQjjKRsyhoI8xJGwCeOYreBrHis+n0v4PrEGLFKU+B
0FgAoL6zAVkhvU37q5n7KYIDVcLgR1lN
=fnm2
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_12_02_59_+1100_L4Silmvga6v/2dGd--
