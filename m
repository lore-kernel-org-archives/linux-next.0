From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-fixes tree
Date: Thu, 14 Jun 2018 08:13:50 +1000
Message-ID: <20180614081350.690b3c62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mPL_Q6YQA9s9c+g=evzb9_+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mikhail Malygin <m.malygin@yadro.com>
List-Id: linux-next.vger.kernel.org

--Sig_/mPL_Q6YQA9s9c+g=evzb9_+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

After merging the scsi-fixes tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/qla2xxx/qla_target.c: In function 'qlt_schedule_sess_for_delet=
ion':
drivers/scsi/qla2xxx/qla_target.c:1227:22: warning: unused variable 'ha' [-=
Wunused-variable]
  struct qla_hw_data *ha =3D sess->vha->hw;
                      ^~

Introduced by commit

  5b10177e2dd8 ("scsi: qla2xxx: Spinlock recursion in qla_target")

--=20
Cheers,
Stephen Rothwell

--Sig_/mPL_Q6YQA9s9c+g=evzb9_+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlshlx4ACgkQAVBC80lX
0GwNQwgAjJB3CubIlBjpeRWq+LWn6W34wa0ZC6FzuOHxWUD1YNmB6PyrAP/3d9Ps
sX9hoPGSYvjzYJ1tDRNCgj+VAfLFQMaWH8ZCg0+1KKSPIJSDLOPHgCUf9BXJZT+A
ar7BXvkL5ZCekhZmKnZd5cGydt6JfHlJZnvVk+ToyqPFK5MrZB/XaDSdELBxoVIs
Ganvy4hGWs5FamR8BHUmXiPS/DSnGrNc9dycADX1Nz8tYNUrEsLCp7TVsn3CrdoU
i9YvflHTJ9Ok+IjoliAjpa0qvw2ZHLhdX4Oco+NZzg42Y09Yv7ASgUi0D7ui34aq
jzxhoncAd//MztQoNDhRYhLSpvpWew==
=e0Ax
-----END PGP SIGNATURE-----

--Sig_/mPL_Q6YQA9s9c+g=evzb9_+--
