From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfio tree with the vfs tree
Date: Wed, 26 Sep 2018 12:27:31 +1000
Message-ID: <20180926122621.6645ba87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j/ywt3.ERSA/8xN+VGNKMNg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Williamson <alex.williamson@redhat.com>, Al Viro <aviro@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

--Sig_/j/ywt3.ERSA/8xN+VGNKMNg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/vfio/Kconfig

between commit:

  f57d445eb317 ("Make anon_inodes unconditional")

from the vfs tree and commit:

  cf3f98c7f466 ("drivers/vfio: Allow type-1 IOMMU instantiation with all AR=
M/ARM64 IOMMUs")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/vfio/Kconfig
index 9aa91e736023,9de5ed38da83..000000000000
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@@ -21,7 -21,8 +21,7 @@@ config VFIO_VIRQF
  menuconfig VFIO
  	tristate "VFIO Non-Privileged userspace driver framework"
  	depends on IOMMU_API
- 	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3)
+ 	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM || ARM64)
 -	select ANON_INODES
  	help
  	  VFIO provides a framework for secure userspace device drivers.
  	  See Documentation/vfio.txt for more details.

--Sig_/j/ywt3.ERSA/8xN+VGNKMNg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluq7pMACgkQAVBC80lX
0GzHVQf9FCA7dM8faXLz7zOdEbwIawWqow2S5Lfc1GvGM3WBTxn5x/yVzOiyxN0m
azp02wt4w5K6FjXHlZwCxtipuiuo6QVFMcWi7RmQtSY7nKpfmipOxMKi0HP78aIj
7HI3Q9C40sL7Dn7wVgyf/uOTOwvWgodwcAsQKSUzJEappw6JzyRQ4F6sI1xtL3Rb
+XUwvXEFJanRvEhDdcGTCG0hHjtxagfZaC0K6VgkLxQDD/9pcKr2g9+i6WFtfJE8
SffO4ffc05LEN5ME9vIyyWT/vNe9KRceGW9/dyZAVey7LEKYjeNz8F5k/Ra2k37O
Nm71wgSymIV4CL/Mbzyr43k4i2tPBw==
=l2wW
-----END PGP SIGNATURE-----

--Sig_/j/ywt3.ERSA/8xN+VGNKMNg--
