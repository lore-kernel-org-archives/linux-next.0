From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the nvdimm tree
Date: Thu, 5 Apr 2018 16:30:07 +1000
Message-ID: <20180405163007.38ec8cc6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BH+ATAiL4v0b46msLvX5ols"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BH+ATAiL4v0b46msLvX5ols
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/dax.c

between commit:

  fab6964f22b9 ("mm, fs, dax: handle layout changes to pinned dax mappings")

which was removed from the nvdimm tree today and patch:

  "page cache: use xa_lock"

from the akpm tree.

I fixed it up (I removed the dax_layout_busy_page() function) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/BH+ATAiL4v0b46msLvX5ols
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrFwm8ACgkQAVBC80lX
0GwUmwf/bK0Sz92Vicl5Vk5hp8WbK2JfhuDNXMvyAaMx2PYJwtuKHAJJlzucQOCI
07uBAw71VzkcSVcpu2feFPjsL8CCphwvavHDZKbY6PZGITGlyn4BM2+snicplijU
Dh2GnJYpF1i6AtHBR5l4ORjWImx4hAPRcK4tsMU+rwpGF/A3MBtE/ens0kjfLum2
SeoSh2T4irit8mKngh2mh2KWo4h6X+odh0ThVbtbObsp0FEEsdrgOM71EqpYxIkZ
KIeTJ5+W+czNayAU/N3eMXJAwh7ExtuU0cg0Cn1aCwnCyPlGBCf5z/JDPiqxMBcj
xpgSRfieHvb8XNfJLZ0Z0HEdynjQTA==
=OJZa
-----END PGP SIGNATURE-----

--Sig_/BH+ATAiL4v0b46msLvX5ols--
