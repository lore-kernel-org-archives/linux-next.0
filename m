From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dma-mapping tree with Linus' tree
Date: Wed, 6 Mar 2019 08:36:51 +1100
Message-ID: <20190306083651.6670648b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v1vOyBJJA5R=Tdj5kr6T=qm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/v1vOyBJJA5R=Tdj5kr6T=qm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dma-mapping tree got a conflict in:

  arch/x86/Kconfig

between commit:

  eac616557050 ("x86: Deprecate a.out support")

from Linus' tree and commit:

  ff4c25f26a71 ("dma-mapping: improve selection of dma_declare_coherent ava=
ilability")

from the dma-mapping tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/Kconfig
index ade12ec4224b,0e33dede053e..000000000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -14,7 -14,7 +14,6 @@@ config X86_3
  	select ARCH_WANT_IPC_PARSE_VERSION
  	select CLKSRC_I8253
  	select CLONE_BACKWARDS
- 	select HAVE_GENERIC_DMA_COHERENT
 -	select HAVE_AOUT
  	select MODULES_USE_ELF_REL
  	select OLD_SIGACTION
 =20

--Sig_/v1vOyBJJA5R=Tdj5kr6T=qm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx+6/MACgkQAVBC80lX
0Gy0sQf/f1qIoI2QcYN8Ng9uTeCpY6cuhwm5vWZjfG4kFyW1Mwc5LCsWdBukj7PS
/3IRuIvhb4wm1RgEmLo/sL0P+LJIi2vDMFigiUpu+3wq9CGMPxTUjDMMtXWT6xuZ
6cSpZBZ2vo8p0bKug8l7QRppPg0jxUOKQ3XixTc91VdPINBhweDPtP8pfTOsiYxt
r6lBrJvZJaeX3nFdReiLG2ZF8ejrpMiktiLx17BAPvBlXrZUItynsvgHmdjZu5Ca
Lw6xyrwGfQp2GTJm7vDaPEERJyCRBY0kZ8t4npDozSpYG74BxSVSVMhJQu4FLF4f
6p8iITEM3zwD7t1dNluQ5XTX64ylsA==
=FeMr
-----END PGP SIGNATURE-----

--Sig_/v1vOyBJJA5R=Tdj5kr6T=qm--
