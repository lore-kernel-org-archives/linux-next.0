From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the kbuild tree
Date: Fri, 3 Aug 2018 09:21:00 +1000
Message-ID: <20180803092100.7d0fda13@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PmmDsB5b_QxAFqt+v6nQgWg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/PmmDsB5b_QxAFqt+v6nQgWg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/Kconfig

between commit:

  1572497cb0e6 ("kconfig: include common Kconfig files from top-level Kconf=
ig")

from the kbuild tree and commit:

  6c359eb1dcdb ("MIPS: Allow auto-dection of ARCH_PFN_OFFSET & PHYS_OFFSET")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/PmmDsB5b_QxAFqt+v6nQgWg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltjkdwACgkQAVBC80lX
0Gw7mAf/bEpGIEqvEnMW6HacXt7rRsGKW3cvnV/Q9WlG4iHRx9rsWVpNzpO8DVMj
hPXzuolrjYi22F+xBO8qgydJIln5kRSVGEWYfcxrBBLqIB8h0F6Le02Rqkezeme+
V1ilhtLnrO2SH6le+4Hp6a617KTk6yFmqtW1TqCEI5A9MgiQBukht++01JU9Uj13
c7oFJhmT2QxZfkqA5JRu+pPvNQan4Lh4n94ePJOy25kL/cjBwO+kApOtR4X1Y/eF
sczQZyintbe9JxwXX6huwmiH9uBhowKdei+AiDWhKWYHXxuLMGbvGmhxYhyIU0uy
g1sS2BCSsEDUOLZZISEhcFhRTaeTfA==
=FGRC
-----END PGP SIGNATURE-----

--Sig_/PmmDsB5b_QxAFqt+v6nQgWg--
