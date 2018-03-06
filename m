From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the devicetree tree
Date: Tue, 6 Mar 2018 12:03:34 +1100
Message-ID: <20180306120334.0411e8eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1J7UQABhlpEMDhgUFj0PhTz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1J7UQABhlpEMDhgUFj0PhTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

After merging the devicetree tree, today's linux-next build
(powerpc_ppc64_defconfig) produced this warning:

arch/powerpc/boot/fdt_ro.c: In function 'fdt_get_name':
arch/powerpc/boot/fdt_ro.c:253:10: warning: implicit declaration of functio=
n 'strrchr'; did you mean 'strchr'? [-Wimplicit-function-declaration]
   leaf =3D strrchr(nameptr, '/');
          ^~~~~~~
          strchr
arch/powerpc/boot/fdt_ro.c:253:8: warning: assignment makes pointer from in=
teger without a cast [-Wint-conversion]
   leaf =3D strrchr(nameptr, '/');
        ^

Introduced by commit

  c0e8e5234671 ("scripts/dtc: Update to upstream version v1.4.6-9-gaadd0b65=
c987")

I presume that commit

  d308701979aa ("powerpc: boot: add strrchr function")

was meant to address this, but it seems that it has no completely.

--=20
Cheers,
Stephen Rothwell

--Sig_/1J7UQABhlpEMDhgUFj0PhTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqd6OYACgkQAVBC80lX
0GxL9Af/WZfjYWqWTdFGyMilT7NAPEe0iZ1FH2HKRdj1VifdI66r0vWW3plPBMni
wtFsxrEGslf6G0g6xhLsz0i8eiyy9cip6iBri0TrOwaqun+uT5unRqxkceH5V+AL
OlieUXRm2SFsa5RU2zE22fxhv5Cm5dah6QPCeMlfcFs0kXr93C1YbgWhBIQZLt4C
Eke57PyPm17KRDgcl0Bo0g8LU02KXaey7X0hGdpXDLncjsruaVTqZadJa1umr6qk
fTmYXdsuzM9C8rhCwvUqI1tRsN2SqVBwBrNQKvqErlF10V50SgS4jby2iY/YaG8+
p3uAMnlArICqAJnX2vKxM4nEFawkjQ==
=2uOf
-----END PGP SIGNATURE-----

--Sig_/1J7UQABhlpEMDhgUFj0PhTz--
