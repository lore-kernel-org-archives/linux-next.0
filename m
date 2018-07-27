From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Fri, 27 Jul 2018 20:55:32 +1000
Message-ID: <20180727205532.28de3353@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I6jsFjSkCEl6JqXAley0Bo6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/I6jsFjSkCEl6JqXAley0Bo6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/firmware/efi/libstub/Makefile

between commit:

  0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")

from the arm64 tree and commit:

  08cc64a7109b ("module: allow symbol exports to be disabled")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/efi/libstub/Makefile
index 25dd2a14560d,0d0d3483241c..000000000000
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@@ -21,7 -21,7 +21,8 @@@ KBUILD_CFLAGS			:=3D $(cflags-y) -DDISABL
  				   -D__NO_FORTIFY \
  				   $(call cc-option,-ffreestanding) \
  				   $(call cc-option,-fno-stack-protector) \
- 				   $(DISABLE_STACKLEAK_PLUGIN)
++				   $(DISABLE_STACKLEAK_PLUGIN) \
+ 				   -D__DISABLE_EXPORTS
 =20
  GCOV_PROFILE			:=3D n
  KASAN_SANITIZE			:=3D n

--Sig_/I6jsFjSkCEl6JqXAley0Bo6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlta+iQACgkQAVBC80lX
0GyBBQgAkjx9lFZiVVmRQG0IHn6JyjQYAuHrN/pDk1XEG+IsupYq0zEfKVC8wLrL
mWkCYbQRw3tpFOTMzCoIfde45u7bTjYgAwPUzcqMRCXrSm/U3u3bRLLdax8h0hrN
7lBnbHX6mJ0jFM81AwwqNRxyNE9SwVHgUke4XtboVKbnaIz8kLTwfx6rK3t6A793
Za09IQe8V5KBAUqJThchsULA1nfEhYXTsomMMQFxZ88NV+4Q8yVHx38/3EPoG90a
XBhc/x4/CF2vwm6lzXJyXh3TE35iIVrizSb4UjUr9u1K+UHo1iRtaiZiD3lChmiF
q1AzuTw/WtLnkfh4UbRH5BPTRbUN5Q==
=Amwj
-----END PGP SIGNATURE-----

--Sig_/I6jsFjSkCEl6JqXAley0Bo6--
