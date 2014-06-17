From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfs tree
Date: Tue, 17 Jun 2014 11:26:44 +1000
Message-ID: <20140617112644.56c925f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8dmgjwwI7dQo39.RVT/QRZ9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Weston Andros Adamson <dros@primarydata.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8dmgjwwI7dQo39.RVT/QRZ9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Trond,

After merging the nfs tree, today's linux-next build (powerpc
ppc44x_defconfig and probably others) produced this warning:

fs/nfs/pagelist.c: In function 'nfs_initiate_pgio':
fs/nfs/pagelist.c:555:16: warning: unused variable 'inode' [-Wunused-variab=
le]
  struct inode *inode =3D hdr->inode;
                ^

Introduced by commit 30e4c73543b0 ("nfs: merge nfs_pgio_data into
_header").

"inode" is only used in a dprintk().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/8dmgjwwI7dQo39.RVT/QRZ9
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTn5lZAAoJEMDTa8Ir7ZwVHj8P/ixiNUnMBnKPxf/iAk0YTUHC
7Ix+rb31RkgnRJGIHvsfCFYlnzkVotjEQml0YOYO+Qj5E+6sODajbvwaNCoulPtB
h8qZE69cOdRhQd11vUN+ozatVzx9D3fqrYUqRalOC9i6PqVFeHq/8v73cEtPu97g
B6IFquEcRrOnTqs57hwybqGln62ucCf6chyTj76CxU4+0AbvrcejiDtcUNanzhaS
RILOhMpniPHVDLKTwg4jVHLlAMMN7JtV1zyoE5qDwelb+l5Rf2vTJqzYFz6p7E2l
6bX+M9xCZOSXpDOIqhZNvctyiVgDyUvxI8TerRwOFQb0kkIkXhxKGJN++6qK0/ZA
2AUYaND5n8G9KsDNfAY73e39WHkuuOLisNm4LI3gFqzSM0BxZ6dfLfuHJBSZ/AOt
lmVT3mI4Q2//TkTSHNotgOp/0m2lhKPr2o+pEzesjINCsFj+tX3e6LNovkUN4B5W
/ViVNwN5vVdvCv3MNi8NSsH6swhKj1jSRM0Ln+JWvYeXMMsCI3etsNpCd4ZyChl2
tSBbquFwoJb77JxAcBUAywT+NOXvgSg9xLm4NN/2yJQPq7YSLoz4VDFFMbHLy//r
UwwEmHxqQ3lgACVK+R3beZ0snjJRAExYpYM3zK7MYHaii4cL7cON1VFUG+E6N/IJ
ZBl2f5O4ER/IehiS7DTC
=+vqB
-----END PGP SIGNATURE-----

--Sig_/8dmgjwwI7dQo39.RVT/QRZ9--
