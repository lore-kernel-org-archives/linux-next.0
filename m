From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfs tree
Date: Tue, 5 Jun 2018 10:17:41 +1000
Message-ID: <20180605101741.658efe5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dRvnpcJT_E3eB/vTtZiW6ih"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trondmy@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fred Isaman <fred.isaman@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dRvnpcJT_E3eB/vTtZiW6ih
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Trond,

After merging the nfs tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/nfs/nfs4proc.c:910:13: warning: 'nfs4_layoutget_release' defined but not=
 used [-Wunused-function]
 static void nfs4_layoutget_release(void *calldata)
             ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  30ae2412e90f ("pnfs: Fix manipulation of NFS_LAYOUT_FIRST_LAYOUTGET")

in combination with

  2409a976a299 ("pnfs: Add LAYOUTGET to OPEN of a new file")

# CONFIG_NFS_V4_1 is not set

--=20
Cheers,
Stephen Rothwell

--Sig_/dRvnpcJT_E3eB/vTtZiW6ih
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsV1qUACgkQAVBC80lX
0Gym6wf/VCrXzrjESxb5fUTzfcbVAb/hFYug9kVBdzMhl2024Hl9DNemMDzkK/QD
Fj/MvPzsU8+fHF66XpTSLfgL9ElT81q9mm2pbcQqnSJHoyVzO+yWfzJwTpCxCpog
iNvinm+giTsdDkgoWA/pxR62HTF1nrz5QGtiKk9QFn2KOChAYFk7ke6gnOu5xL3i
4w37NcIJveBMohoYedtlPL/ypVjDINWuOqyIDE1MrCnpOXqWpBy6crQP37gsh2LF
rcMXMkBHWjHfieSPkkbH31UQnkwP94K1W1CkPoNMKNkTEEJVwnG1w4257C016sWE
VQVs2+7MKGNG0B9nU5Mcf3QpSDI09g==
=/wG2
-----END PGP SIGNATURE-----

--Sig_/dRvnpcJT_E3eB/vTtZiW6ih--
