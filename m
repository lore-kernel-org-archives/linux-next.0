From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 24 Jul 2018 08:50:15 +1000
Message-ID: <20180724085015.029efd54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p7_ied2/1DM2Hs/LiWVGBwZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Paul Kocialkowski <contact@paulk.fr>, Laura Abbott <labbott@redhat.com>, Greg Hackmann <ghackmann@android.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

--Sig_/p7_ied2/1DM2Hs/LiWVGBwZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/Makefile

between commits:

  38fc42486775 ("arm64: Use aarch64elf and aarch64elfb emulation mode varia=
nts")
  2893af07e507 ("arm64: add endianness option to LDFLAGS instead of LD")
  96f95a17c1cf ("Revert "arm64: Use aarch64elf and aarch64elfb emulation mo=
de variants"")

from Linus' tree and commit:

  c931d34ea085 ("arm64: build with baremetal linker target instead of Linux=
 when available")

from the arm64 tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/p7_ied2/1DM2Hs/LiWVGBwZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltWW6cACgkQAVBC80lX
0GyAwwf/RD8Hr7QkeYFpIzBdmyqPiNUndF3umskSD0zcju51nXvuk5CizLtczUc1
sWv1Kumdyf6wm6J8knJu0pEPle0j16Yx61eOvY+Z8T9hVfpOk7gDhqINGa7UFI7v
Uupkdh8Z5p2ff9jwzvSCRsrzUMbQnUERtEwOXEf+94nW1//fiBGv1Vs59XB8qRSH
v2ECtsBHwwrxvVeSd0q7qcR3liAK3fTZp1h8q22NW8jiwumwhyB/sqfg8ESdDHxl
Biaw8I/uqyoU9BH8YIImUbBiv3uq9Z7IhtygPO8Fx4QnWL4rCwbKCNQj8ifmf9XS
PYmmaIfWYf9bZSTebyzmEIQs1kYOww==
=Onrj
-----END PGP SIGNATURE-----

--Sig_/p7_ied2/1DM2Hs/LiWVGBwZ--
