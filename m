From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the pci-current
 tree
Date: Thu, 19 Jul 2018 07:49:27 +1000
Message-ID: <20180719074927.68da9f86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tSLlOVFVYn92hsN+RC/E2ss"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/tSLlOVFVYn92hsN+RC/E2ss
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Commits

  27a6c9ebf29b ("PCI: v3-semi: Fix I/O space page leak")
  db2aff16ea70 ("PCI: mediatek: Fix I/O space page leak")
  52022fc6f6ad ("PCI: faraday: Fix I/O space page leak")
  a9c0419ec92f ("PCI: aardvark: Fix I/O space page leak")
  45cb32b4e8ea ("PCI: designware: Fix I/O space page leak")
  89c0f3551827 ("PCI: versatile: Fix I/O space page leak")
  596c66bf9663 ("PCI: xgene: Fix I/O space page leak")
  ede26a1e8c35 ("PCI: OF: Fix I/O space page leak")

are missing a Signed-off-by from their committer.  Presumably they were
all rebased?

--=20
Cheers,
Stephen Rothwell

--Sig_/tSLlOVFVYn92hsN+RC/E2ss
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltPtecACgkQAVBC80lX
0GwBnwf+OfA4zira55AIYB4RC8QBQauc6YJ81nG3n4qMFBo6SjLi8hiLz/1RcKqv
g+GCu5a7EM8LI3QSyL8MMR1nHt7ukDqgO2svFIwG3R6+Vej9sDVf4A4RBFXIf8NN
rMJQl5CmiDsq28PmAIlaXPuH6S4G+1ol2bmnHy4b6qwTZZkHS61o5a83/TZvoJAU
4pzY4m1wigXWGz1MBVgagRGT4+NSPa9PRM03Fd+OOxw6H6hAUG9tlkPbDAjTUiHa
XJDji5QX4x5O0NSXpYvaC+wbQG6+JQuzvxiFhDGhUTJi5YH+u4rBLG8zgjCkcBmE
wHwaMv+rMW9gYQb47Joryt90jgr+aA==
=NYbC
-----END PGP SIGNATURE-----

--Sig_/tSLlOVFVYn92hsN+RC/E2ss--
