From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the at91 tree
Date: Tue, 23 Apr 2019 08:40:42 +1000
Message-ID: <20190423084042.29fd9c03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/viFDtRPHsDztPYGKC4FRGVu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

--Sig_/viFDtRPHsDztPYGKC4FRGVu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the at91 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-at91/pm_suspend.S:17:10: fatal error: pm_data-offsets.h: No s=
uch file or directory
 #include "pm_data-offsets.h"
          ^~~~~~~~~~~~~~~~~~~

Caused by commit

  ab690fa1eb4b ("ARM: at91: move platform-specific asm-offset.h to arch/arm=
/mach-at91")

I used the version of the at91 tree from next-20190418 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/viFDtRPHsDztPYGKC4FRGVu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+QuoACgkQAVBC80lX
0GxptQf/eh89qqrmdmAN/MG1zs5M+JFtIoqW6ZJqnhPjnNWSObuz7rImFfprQTWQ
84CK2p3OKS6V6JubBQfuSE30aADj+bgfsEReaUxeCko53GbZ6Zu5mUQAq7SP7inK
p6VOvk05cM8csKVADQE/3Ri1v8pt/FI3c3+oBG07fABssx69Ghs5LuT/b88NJRyB
gCVy+2L+kgI4uHg0ArGGuwbvemYfJpIWasmzJhJXI/LyEbm7wdyl/BQYuM15hyNb
YMdNnCufYj7Z5Uq7Lll7IVkJWf320Y4oHXRs/aIxukubsHVtFdEYaLYlnUFcl1FR
8Loim0X1oxD8bd+tBWElxHOMA/ACJw==
=aW8/
-----END PGP SIGNATURE-----

--Sig_/viFDtRPHsDztPYGKC4FRGVu--
