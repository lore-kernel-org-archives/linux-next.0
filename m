From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the semaphore tree
Date: Wed, 16 Jul 2008 18:46:18 +1000
Message-ID: <20080716184618.1452a832.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_18_46_18_+1000_C8x8q=43OXKO9x0P"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33554 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754950AbYGPIqZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 04:46:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>

--Signature=_Wed__16_Jul_2008_18_46_18_+1000_C8x8q=43OXKO9x0P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

Today's linux-next merge of the semaphore tree got a conflict in
include/asm-sparc64/semaphore.h between commit
e0dad3e169bad8ac1f2f39439168bc70dd25b891 ("sparc: when header files are
equal use asm-sparc version") from the sparc tree and commit
069e88113c5cd04d2893d9d1134cd3eb46b40abb ("Warn if asm/semaphore.h
included") from the semaphore tree.

Obviously, I used the sparc version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_18_46_18_+1000_C8x8q=43OXKO9x0P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9tVoACgkQjjKRsyhoI8zVpgCfb2HmPaTkCbDrvwPbyxD450jx
mT0AnitV4Mk4FFZ13dqi77S/YwLwNqg9
=i5zV
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_18_46_18_+1000_C8x8q=43OXKO9x0P--
