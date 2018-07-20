From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Fri, 20 Jul 2018 11:49:25 +1000
Message-ID: <20180720114925.3ae30654@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//79q4MkxEoDJ1QAHe4ctpbp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Sverdlin <alexander.sverdlin@nokia.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_//79q4MkxEoDJ1QAHe4ctpbp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/cavium/Kconfig

between commit:

  e40562abdf81 ("net: cavium: Add fine-granular dependencies on PCI")

from Linus' tree and commit:

  74525cc5f5f7 ("net: cavium: add missing PCI dependencies")

from the net-next tree.

I fixed it up (I used the latter version, but they were logically
identical) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_//79q4MkxEoDJ1QAHe4ctpbp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRP6UACgkQAVBC80lX
0GyMTgf/YV1hxo0WBuRGtOO3nrP2m7x7c6yh/jonTBIrX+aviHTxw1wwv6KL0QYG
NgoH1sdwcntHqVDUM8gOFyJKbbdUD5CSLZvHJOnEs+ufyRRmcFE4etBj8WjhmzQo
2XnnTD86xGywgK4eRrxqaMgGcJ9+n+OI9kCjW/m+KuF6DCrn38X7WBChBh621KU8
hpAulMSXb7Ft4pDwMNnrgvTHQhbNKhUFWgfBblvDe75b7djjEwRsEun171r3NaH7
bYEtMNT/+TgsM14yHUwuDaJpYHKeM/o5tEl31pt3c6QvTC3mqdlEDIfPcL0l10Yi
tbIdYXFBaUFy6QUVkWqhHUCxjPOfOg==
=roZu
-----END PGP SIGNATURE-----

--Sig_//79q4MkxEoDJ1QAHe4ctpbp--
