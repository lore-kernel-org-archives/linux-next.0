From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the risc-v tree with the dma-mapping
 tree
Date: Fri, 7 Dec 2018 10:02:46 +1100
Message-ID: <20181207100246.4b19e808@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q0pY_V.i1ErhzhB7hCMlyuf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/q0pY_V.i1ErhzhB7hCMlyuf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  Documentation/features/io/sg-chain/arch-support.txt

between commit:

  7c703e54cc71 ("arch: switch the default on ARCH_HAS_SG_CHAIN")

from the dma-mapping tree and commits:

  1df4d3866118 ("doc: features-refresh.sh for csky")
  1b9f89553571 ("doc: Indicate that xtensa supports sg-chain")

from the risc-v tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/q0pY_V.i1ErhzhB7hCMlyuf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJqpYACgkQAVBC80lX
0Gx9IQf/SDDCgiKzOXEGFK7YE/2iR6pKaoEsOO281re/W3W8O7rI7v8iwdW+VGiz
4uYlY18i/qAiGFytqimNtF5GZvy5ujQlzhskSK6gqufZllaX+ud5PqeqHgOD4sp+
UoKXykwOl1fSui+ZIb4d3mxh4YZh+tV2XoakSiSQ0eVIDvwwHgK+1FBL9u0zuCE7
9/YhNppLVvwm7C+Wwx4tD/eRYV1Fg+MZFIGkzLTKLo0aQpUhWcMGSdWA/etW3L6R
JDl07wDlhbHOL/D3ZZPu7/CepZkJdX5Y7cgSij1KC4o6Kz60DhnZ6EVt2LvWx/A9
540krDS3RqVxS9q26xIMBW0DX9nrCw==
=6hOn
-----END PGP SIGNATURE-----

--Sig_/q0pY_V.i1ErhzhB7hCMlyuf--
