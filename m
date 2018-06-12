From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 12 Jun 2018 10:46:07 +1000
Message-ID: <20180612104607.69f6f15b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xe_ZIm0.oPtMX4pwaSiGPFi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/Xe_ZIm0.oPtMX4pwaSiGPFi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  drivers/iommu/amd_iommu.c

between commit:

  94c793accacd ("iommu/amd: Hide unused iommu_table_lock")

from Linus' tree and commit:

  1df9bb146146 ("EXP iommu: Placeholder for fix in mainline")

from the rcu tree.

I fixed it up (they share some code change) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Xe_ZIm0.oPtMX4pwaSiGPFi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsfF88ACgkQAVBC80lX
0GyiGAf+Mac6oviilt+vgKrO4FeFtt3BiSCmcIZdK99igAz+xN2+4XCRRmTO+CGE
SazbMWIF8K2OojMX8azPN0IOJ0blCGZKRWhem8cMflfglDPb0LEwX4HfrpKB9vtS
vEZul54gpBnPvTguvkLoo15z8VWvMX2xfMOTl5XTgfVu+gT6u4MIYiUv2ADZfqNM
U/WD25J8yc2q79Javr1R0yDL2ulXX826C1vVBLNFTeh5S8JvdmboXLsw/5RRsD6w
4wP1WTNF0soTYsQh0av8OJ8d8oV38qJ9hliUedWF29sd7yJGBCMEZSDG1HiDKW+C
xEi4cDS6GBTn93m8QnpioLqpLiZbSQ==
=LL9W
-----END PGP SIGNATURE-----

--Sig_/Xe_ZIm0.oPtMX4pwaSiGPFi--
