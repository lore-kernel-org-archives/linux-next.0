From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with Linus' tree
Date: Wed, 22 May 2019 10:11:38 +1000
Message-ID: <20190522101138.3797b3d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SWqY30olTy+T8neXG.DkgSr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hannes Reinece <hare@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SWqY30olTy+T8neXG.DkgSr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/osst.c

between commit:

  09c434b8a004 ("treewide: Add SPDX license identifier for more missed file=
s")

from Linus' tree and commit:

  70841904d909 ("scsi: osst: kill obsolete driver")

from the scsi tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SWqY30olTy+T8neXG.DkgSr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzkk7oACgkQAVBC80lX
0Gz8igf/eIWVE3LL64EJmtlG73TBlNTQgiqQn3T2eBRPnFpbtNbyqIyhtMG1Uxja
3TscbjJkuBYLZw2r/gMKtqJlZJQiRoS5M5/+sV7iHrXhkbkBpe1h5+tQX5PC3FX4
PG9VKacU0cudMnO+vCKYlm46XIP1RCPD/wNPY+oEqrXpiaer/24MU/PpVL2rkmZT
nfOn6k/7kqBNMnR7AiRZKF54gkeyCUPB0VnHhLrbrRUSlDqVs6S/31EUCBMWNNdO
fYMY27AVnZ5j23ONTjuesbNfOn4iur66Q9BWfuxZvt2/gQvzkr5pwpGv8lJXCL/m
+VsvQiBNEFM85+Rlaq7A17A7F3vI9Q==
=GMpd
-----END PGP SIGNATURE-----

--Sig_/SWqY30olTy+T8neXG.DkgSr--
