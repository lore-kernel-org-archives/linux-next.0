From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the kbuild tree
Date: Tue, 22 Jan 2019 15:02:31 +1100
Message-ID: <20190122150231.0191e8d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=T7=_vbGc._DhqQDGdMkICB"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=T7=_vbGc._DhqQDGdMkICB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  Makefile

between commit:

  b57304bb03de ("kbuild: remove meaningless prepare2 target")

from the kbuild tree and patch:

  "locking/atomics: build atomic headers as required"

from the akpm tree.

I fixed it up (I hope - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index 004a190e3ece,bd0f79d8295e..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -1077,8 -1077,12 +1077,8 @@@ ifneq ($(KBUILD_SRC),
  	fi;
  endif
 =20
- prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h)=
 \
- 						include/generated/utsrelease.h
 -# prepare2 creates a makefile if using a separate output directory.
 -# From this point forward, .config has been reprocessed, so any rules
 -# that need to depend on updated CONFIG_* values can be checked here.
 -prepare2: prepare3 outputmakefile asm-generic genheader
 -
 -prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelea=
se.h
++prepare1: prepare3 outputmakefile asm-generic genheader $(version_h) \
++				$(autoksyms_h) include/generated/utsrelease.h
  	$(cmd_crmodverdir)
 =20
  archprepare: archheaders archscripts prepare1 scripts

--Sig_/=T7=_vbGc._DhqQDGdMkICB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxGldcACgkQAVBC80lX
0GwVcQf+NDr4pxKcxmfrU0pD0/cvlui8s6dvsEysDP5i1sSYs8o9CjJgud2UPUgv
ACEk5Soih3OJT/ZJWIfa0JZ4y7PELyeYR0+k9GTp/6FEso/20mp6p5lef70l6N6R
WD65XZSbhv9g7WdrJQ7anfS+2g69/UHj512QxlLe2ohvh1Dx6yzwUyaEvKsytqQu
CXK9Wv3aPUum7RaYoPbe+OEyR48+V9awBvla7FLQM4gHqpcFMG8H+qbqjzCGShlv
4Nmg9hASHc22HMX4LqWwciuFQV8fqpCz7YQcsxPbJuiW5DY1jFYe8JGANSeP9QnI
8hkkENLoCdFT08vXI6atizgIsA8qLg==
=Duuv
-----END PGP SIGNATURE-----

--Sig_/=T7=_vbGc._DhqQDGdMkICB--
