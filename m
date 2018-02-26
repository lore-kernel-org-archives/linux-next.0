From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the nds32 tree
Date: Mon, 26 Feb 2018 13:34:45 +1100
Message-ID: <20180226133445.6544ad34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dfkQ7_wa2r4qO0oWWCcB842"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Greentime Hu <green.hu@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Farhan Ali <alifm@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dfkQ7_wa2r4qO0oWWCcB842
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  drivers/video/console/Kconfig

between commit:

  2312dbf7462b ("drivers/video/concole: add negative dependency for VGA_CON=
SOLE on nds32")

from the nds32 tree and commits:

  8da93aca3729 ("Kconfig : Remove HAS_IOMEM dependency for Graphics support=
")
  416b744f4494 ("s390/setup : enable display support for KVM guest")

from the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/console/Kconfig
index 27bb893cf6b2,b9c2c916247e..000000000000
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@@ -9,7 -9,7 +9,7 @@@ config VGA_CONSOL
  	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC && !FRV && \
  		!SUPERH && !BLACKFIN && !AVR32 && !MN10300 && !CRIS && \
  		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
- 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !NDS32
 -		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && HAS_IOMEM && !S390
++		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !NDS32 && HAS_IOMEM && !S=
390
  	default y
  	help
  	  Saying Y here will allow you to use Linux in text mode through a

--Sig_/dfkQ7_wa2r4qO0oWWCcB842
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqTckUACgkQAVBC80lX
0GwjqggAobhutCauWvf9iIdFOJEpunmcYkUVNg5IEPR7lJqX6gg/nMpPeosUIi+y
pDou5qgCDFRCCt+P6QFOW5ejom+tcD2OfuG0z8u5ry0LQbwhuxnh0ZdpQ6Soynin
YqGj7cag5In0R/aXZKY8gUyplqVkLb7/s/Z3u2zYGFb1I65F5Ro+HT/bxBx/DSfu
LXX3MPWJVLUflerPOOFez8t09bRw/N6i34MRh4fYbJf4CwRA8t+6VjRzqztpcFFc
g4pOYKebwKctb7UCL4AYqlB5fnrcBqNbiVitlU85LqVCS+8+hv6zLUZYsr9Z5gv8
PYHF1QWJRhYhsZCjM6CzwRnYyq/pNw==
=heql
-----END PGP SIGNATURE-----

--Sig_/dfkQ7_wa2r4qO0oWWCcB842--
