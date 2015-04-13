From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Mon, 13 Apr 2015 14:00:37 +1000
Message-ID: <20150413140037.36d6acd8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FpYzrmFF3eTtyX8z.6fdbuK"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34385 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750708AbbDMEAn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 00:00:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/FpYzrmFF3eTtyX8z.6fdbuK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/nfs/file.c:677:9: warning: unused variable 'pos' [-Wunused-variable]
  loff_t pos =3D iocb->ki_pos;
         ^

Introduced by commit f52cbe4c9838 ("nfs: generic_write_checks()
shouldn't be done on swapout...") which removed the last non debug use
of "pos".
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/FpYzrmFF3eTtyX8z.6fdbuK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKz9pAAoJEMDTa8Ir7ZwVYvcP/1C83eQ7uOyE2fnrVcgm72Z+
Dgy8FIdmGIBFYsoixM9COF+CIJlz3X3pkZzvlc3XUv3FtZZAqI9yibHBSc/rCUZL
dQHbB2lJjlrz50Xm8p5BzBQset7CGkNKFUaSrQlaNrAkY1iO6yYjiZ1Lp/Ijfi9C
nAFfNfQFe957l7SkynDHNX0JC0xdrCEd2KisDTEO1uMoTbqih9bUBjjpOQNiClsc
Dx4PqfJgXjYEtfpx2f0EFPH4fCi+uNmRyY73JatJJGSkb70Y4XpFf8qxqH4Dl8IW
Uzja82BuRcQx1vzeTqZGNlpbyhgpsfQxYh/EH1h6XIxdgTajlDqRrwOAKGD0V20L
D8+cv+rGG5DAXnAkkSGYLqJSm6F9J5cL7MxSgmsY2xz6xQZaCyjtOEolJnHTiqY3
mON84TniRL/M52rgJ5vbJ3067hpJ9UNf+0dpBxCN1wGEMhRW9Jgx+mZOpcdTUUAS
CG0umcOvrgbZHGhHq0g9IXuc4JLbmsx3pWqfarAVqqnNdGeeapyH/R5jNkQOwliY
tpX/II/BtsjozW+dQu34pDC/Ags/s+SAuy36mu+clQvLQ3umLP66Rg3fcUerO9FJ
BdtOLewLKrzZtiVAarPWgjQr538a10IzgFj1HoKZDnSK2fvGI1tpxDGtRfoAPJOw
kgFrCVeqACuPLpe1Gb22
=3eKe
-----END PGP SIGNATURE-----

--Sig_/FpYzrmFF3eTtyX8z.6fdbuK--
