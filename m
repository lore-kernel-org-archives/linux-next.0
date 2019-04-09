From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Date: Tue, 9 Apr 2019 16:27:49 +1000
Message-ID: <20190409162749.7eb6656f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5WkA0RPc=eCqBu6NtnDm+9m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5WkA0RPc=eCqBu6NtnDm+9m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/scsi/qla2xxx/tcm_qla2xxx.c: In function 'tcm_qla2xxx_init_lport':
drivers/scsi/qla2xxx/tcm_qla2xxx.c:1614:3: error: implicit declaration of f=
unction 'vzalloc'; did you mean 'kvzalloc'? [-Werror=3Dimplicit-function-de=
claration]
   vzalloc(array_size(65536,
   ^~~~~~~
   kvzalloc
drivers/scsi/qla2xxx/tcm_qla2xxx.c:1613:26: warning: assignment to 'struct =
tcm_qla2xxx_fc_loopid *' from 'int' makes pointer from integer without a ca=
st [-Wint-conversion]
  lport->lport_loopid_map =3D
                          ^
drivers/scsi/qla2xxx/tcm_qla2xxx.c: In function 'tcm_qla2xxx_make_lport':
drivers/scsi/qla2xxx/tcm_qla2xxx.c:1677:2: error: implicit declaration of f=
unction 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-declar=
ation]
  vfree(lport->lport_loopid_map);
  ^~~~~
  kvfree

Caused by commit

  523c106ad4b1 ("scsi: tcm_qla2xxx: Minimize #include directives")

I have reverted that commit for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/5WkA0RPc=eCqBu6NtnDm+9m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlysO2UACgkQAVBC80lX
0Gx/1gf/TEBSp2Cq8xWmXP+YpXRq3EQvYiXypdp7HK1j7orWOKF5up0A5pHcn7Z/
amjMa3JwvnZoziDeN8+XottURP3Rvipm5yMxxH1njExjZd6LSKwXrYSsk7gSImlV
HLu7/hbZqnfjP2wtKs4Ybe5MgLdYuvPhGbsQAssUXmVGYj/l8mWVCHIU4sxRR9c+
OJ9MMQgm4F7Gu2h/szG+kgFey0dMd6Hv0zIXiEpHBa69pQErPyoGnNQovtkxYKLL
D+uuGv7ICwvv+JtdvVqefvLdrik/Lq+iTOjCsn5/nP4Mdpj/9H+rq0DjXo1SNRAq
FnkIVs/g7OBiew6MUaLUq8aez6B9Cw==
=tLEG
-----END PGP SIGNATURE-----

--Sig_/5WkA0RPc=eCqBu6NtnDm+9m--
