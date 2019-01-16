From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 17 Jan 2019 10:40:43 +1100
Message-ID: <20190117104043.009ef499@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1=CnjxvyRx1E39Rg1rYP8ae"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Firoz Khan <firoz.khan@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1=CnjxvyRx1E39Rg1rYP8ae
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (any sh
config) failed like this:

make[2]: *** No rule to make target '/kisskb/src/scripts/syscalltbl.sh', ne=
eded by 'arch/sh/include/generated/asm/syscall_table.h'.  Stop.
make[1]: *** [arch/sh/Makefile:232: archheaders] Error 2

Probably caused by commit

  60a47bb1b736 ("sh: generate uapi header and syscall table header files")

I will revert that commit from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1=CnjxvyRx1E39Rg1rYP8ae
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw/wPsACgkQAVBC80lX
0GyBxwf/SACiLoC4LJHW79XoBe4TPZLSLzefS92PAsoAfoG7S4654/bvKHjZCfmI
ANH0oeALaW2QRLdkyIBV8kF5dZL5RgzS5Am8THuzDwpmIdu8HOurzO/s4HTpmfjc
pYKIZ8OJUc2nGuSfMFFf+JoLKkaoRSoTBAMOXsoUox55vq5+jiLP0RSuz6KsgFDx
FxScrV8OO673NReDMGE0+AUWdhaESuDTeiYb935+d1F53LZTUihDDYwOiq3oT3i/
nlOZhw2hjw6ryunC/nKGjHO21Zo5KC2h/3a0YftFExdsxEC6ihwUV6rq1Bql00sB
wnMd3jFJF3JVmsXbi/xAoD9LEaEpyA==
=AhOp
-----END PGP SIGNATURE-----

--Sig_/1=CnjxvyRx1E39Rg1rYP8ae--
