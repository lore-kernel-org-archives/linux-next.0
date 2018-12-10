From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Mon, 10 Dec 2018 17:17:16 +1100
Message-ID: <20181210171716.77cbf9fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.QX.aC5b=vRQG9v3VMFWp5_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>, Bill Kuzeja <William.Kuzeja@stratus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.QX.aC5b=vRQG9v3VMFWp5_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/qla2xxx/qla_os.c

between commit:

  f2ffd4e5bc7b ("scsi: qla2xxx: Timeouts occur on surprise removal of QLogi=
c adapter")

from Linus' tree and commit:

  c4e521b654e1 ("scsi: qla2xxx: Split the __qla2x00_abort_all_cmds() functi=
on")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/.QX.aC5b=vRQG9v3VMFWp5_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwOBOwACgkQAVBC80lX
0GxCaggAiC9eDxDQr+82IFhFUHwEP2mzZMc5qErB/+z3ZBTmgzu2y596/BQUk9tg
sd1tTX+FWg4emXgaGXZOOyQajUl/TDqx+X3vbVkKU1/R0Pu9t7cfbqQKHH1r2xN3
1RRZqVARS71H5iikfBphzpQ8Ja8ONC4YzNDGVCcwFSYM4k8Kw9VU7K4B24ZDoPzc
K/D9LpANwS1pw4dJbOxSC62E+CIaumEcfckiW+xlrF7AYQ0SmJElrKH//kc1ugwP
FZpzOWi3Q0g61iQKB/SXYFf/7aOOmGinT9WbliMs7qanjngwgcuOzBscwQmHhNnv
qbIeWUeUo7OnHGO95w6Q9CPy5VaWMw==
=HLOB
-----END PGP SIGNATURE-----

--Sig_/.QX.aC5b=vRQG9v3VMFWp5_--
