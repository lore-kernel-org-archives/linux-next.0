From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the mips
 tree
Date: Fri, 3 May 2019 18:59:18 +1000
Message-ID: <20190503185918.7b28aa0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xsu/4eVFbq_pNGCen_CtTev"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, Serge Semin <fancer.lancer@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Xsu/4eVFbq_pNGCen_CtTev
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/mips/kernel/setup.c

between commit:

  b93ddc4f9156 ("mips: Reserve memory for the kernel image resources")

from the mips tree and commit:

  68c7c323926b ("mips: replace CONFIG_DEBUG_KERNEL with CONFIG_DEBUG_MISC")

from the akpm-current tree.

I fixed it up (the former removed the line changed by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xsu/4eVFbq_pNGCen_CtTev
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzMAuYACgkQAVBC80lX
0Gz9RAf/frEuDEVfvoFsjMuxfDLY1xADjq7yFXgSvPJFoIT+C4RaiTNYXBb6AP6x
Rp4b+Vvb/ETY+jfGx/bAeh4+rf4evOSp2B6I3ztqXscG/8NGs9bFuCd28DHXeJxs
dhLFU+quCaWL558ezW714Xl4wrQKSWlqds7RmORWIm8LhhTL1pudhQHg2p8br/RH
2G171sDg+qJVSv+L3ZOhGzdS773vbQYhuSOa4an1mYMt4TDfQDeVanVHFJt7CvQW
MzG8/NEkaJjRXynvw9WDn0FXoncJH6tDgpfBAofb1OxlDXavyN78FGGpG/+bEh8M
s7qrzf54SREuvcCtcMOsxk5RDRFHqQ==
=cQ4I
-----END PGP SIGNATURE-----

--Sig_/Xsu/4eVFbq_pNGCen_CtTev--
