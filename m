From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Tue, 4 Jun 2019 10:30:52 +1000
Message-ID: <20190604103052.056719cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AbInN0eAngnG=.GdErjR.Yy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/AbInN0eAngnG=.GdErjR.Yy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/isdn/hisax/hfc_usb.c

between commit:

  de6cc6515a44 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - =
rule 153")

from Linus' tree and commit:

  85993b8c9786 ("isdn: remove hisax driver")

from the net-next tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AbInN0eAngnG=.GdErjR.Yy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1u7wACgkQAVBC80lX
0GzE2ggAoX66HrO4SIyBxmtx83Aww/8eFqofGeUC1za6LOtj1hvZ99Aa2eKVrnyK
0SWwgd9dxVYDXO0Fte/BcZsOV6Tm8kBncHWcAQOMemJU/fkhQZAbKEkk5fenwWHV
0qA2nV368Q/kCmo/XnIhzQfM7wyHNUn3osz1w6HlqX3elZMrvtvMOoRfvozK3Nsz
oajuKzvQbaolKo4lb0blWMhoYURLkRJkUfHmAnFpRvE7PQ3BoUwK6ribbb1fpXZK
mepaAy5W2hYOBWtS0AqfKhuZFWU0oCiEP3UhxDPoZdU8RKePgzoCATmNBPeheOw3
AJo9fyguGNImmgXv4t5l7ulGmTJrPQ==
=1wTv
-----END PGP SIGNATURE-----

--Sig_/AbInN0eAngnG=.GdErjR.Yy--
