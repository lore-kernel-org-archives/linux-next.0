From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Wed, 6 Jun 2018 19:12:05 +1000
Message-ID: <20180606191205.27b1290c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iFQ.1rWNs5=/+=W2qkGkVed"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/iFQ.1rWNs5=/+=W2qkGkVed
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/ipx/af_ipx.c
  drivers/staging/ipx/ipx_proc.c

between commits:

  fddda2b7b521 ("proc: introduce proc_create_seq{,_data}")
  db5051ead64a ("net: convert datagram_poll users tp ->poll_mask")

from Linus' tree and commit:

  7a2e838d28cf ("staging: ipx: delete it from the tree")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/iFQ.1rWNs5=/+=W2qkGkVed
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXpWYACgkQAVBC80lX
0GzvRgf/TO6TaePIKoELxpjLffGFUM4wXdZOq3SaAnMaDxRygg9bT4XP6hyVRhOh
664iQ/qsxi0/Q8ZFMSvLuEXaHtC4y9pwOuiiBuoZw5wwuDU5RtAh+wJkqtlqVQGW
P2HAg4QbEN/6DJ5EeiGAYbIuJ6A/QZ7TaNEWe1kbA5csmkXSO0/76UL3E/Mdp9rr
igu9NDfiFXxlXj8iH8zCuGxNMU/wdoPo4zninT7hizdCCMN292z2hpIvG4JEIsSu
l2YGJsbHIb9EAIBmwYHwgxMMrm7uQpR80wUoE92oktP2H46/8zZZeEag25e/XJrJ
000LvlulBbObEcuUJ+Cf2i6MaIvksw==
=oYXW
-----END PGP SIGNATURE-----

--Sig_/iFQ.1rWNs5=/+=W2qkGkVed--
