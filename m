From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the nnvdimm-fixes
 tree
Date: Fri, 12 Oct 2018 16:54:54 +1100
Message-ID: <20181012165454.06e718a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ucItC2GgZun5DunlZq4arx."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ucItC2GgZun5DunlZq4arx.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xarray tree got a conflict in:

  fs/dax.c

between commit:

  d7782145e1ad ("filesystem-dax: Fix dax_layout_busy_page() livelock")

from the nvdimm-fixes tree and commit:

  0995344c1493 ("dax: Convert dax_layout_busy_page to XArray")

from the xarray tree.

I fixed it up (I just used the latter - please let me know if more id
needed) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ucItC2GgZun5DunlZq4arx.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvANy4ACgkQAVBC80lX
0GwwoQgAn2jVpohp1PLdSxczHpJOFMr7hOCuRPkWcg/SqgKD6MTEJ+bulMUaF54y
iHdxfPUhlfrCJHwUhwdHphbUPyXdWvwJ3qGmU2esCvqPPlNUzDNujA/MfeLiUYz6
BwilCBytI/gk2Q9Jdv41/aTjyK5QWFpUJ8r/vjAvC5IWLVWH5RZ5GlA4X1scdTO3
hfKwVpMUWxVBut+MTRDSz4qXoBuh4ju5eeh8Xdhnab5xObMa7cnNlAxkd9T5nPoK
KZR+33pzK1C+WT/fZWNy6rWQSPRX/nbQIuqZOm7tQyBKHERIcw9I2hDlYGzn1g/d
B/hlTI77fFWWO3vnKu0jowdnRpBCFw==
=NeuP
-----END PGP SIGNATURE-----

--Sig_/ucItC2GgZun5DunlZq4arx.--
