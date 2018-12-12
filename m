From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the
 char-misc.current tree
Date: Wed, 12 Dec 2018 12:02:52 +1100
Message-ID: <20181212120252.5260cb22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/va0C.Q=hZe4pk/E4Ct33LSf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Sasha Levin <sashal@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/va0C.Q=hZe4pk/E4Ct33LSf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  MAINTAINERS

between commit:

  cb4f131e1f2c ("MAINTAINERS: Patch monkey for the Hyper-V code")

from the char-misc.current tree and commit:

  b255e500c8dc ("net: documentation: build a directory structure for driver=
s")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 4a2a30380bed,a676b40ac1d6..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6930,11 -6902,9 +6931,11 @@@ Hyper-V CORE AND DRIVER
  M:	"K. Y. Srinivasan" <kys@microsoft.com>
  M:	Haiyang Zhang <haiyangz@microsoft.com>
  M:	Stephen Hemminger <sthemmin@microsoft.com>
 +M:	Sasha Levin <sashal@kernel.org>
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
  L:	devel@linuxdriverproject.org
 -S:	Maintained
 +S:	Supported
- F:	Documentation/networking/netvsc.txt
+ F:	Documentation/networking/device_drivers/microsoft/netvsc.txt
  F:	arch/x86/include/asm/mshyperv.h
  F:	arch/x86/include/asm/trace/hyperv.h
  F:	arch/x86/include/asm/hyperv-tlfs.h

--Sig_/va0C.Q=hZe4pk/E4Ct33LSf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwQXjwACgkQAVBC80lX
0GyyqAf/buHMJXRweis7vXd4hKdzKVzjOsKdtDodaZ6F5lpZ4KfRrhW/1BlkChDq
z7me3ZEvMw3ubOdgVhAEFHLbbs4e5J4E1c7PdkCNMr9fMiS+GeIbpcGgpC/IYs9b
SJdL7AAjtmu097IjRFUr+6yn+/aG/UcZb89UyUMiZm9i+aMGd+yEFhZLPePsf64c
5Q/cp2tK8HvDbFfqHZbQNODwjR/9GgIwnaHo1DVPq/rKzTfzQRDBS1g9NvBhfAYD
FSmuSUAN9zWjJGwdq+YvtpMkc+89I4Fqn9a0B4Bb5Bl+GwDzX8TjP1GGZ7WNR61k
Q5kjYO7quouRr7nzkgu4h+3FjhF5ag==
=8Sf8
-----END PGP SIGNATURE-----

--Sig_/va0C.Q=hZe4pk/E4Ct33LSf--
