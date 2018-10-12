From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Fri, 12 Oct 2018 16:10:51 +1100
Message-ID: <20181012161051.34223689@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KHqK1_6L2xiani+aCG0g2.z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KHqK1_6L2xiani+aCG0g2.z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

./usr/include/scsi/scsi_bsg_ufs.h:45: found __[us]{8,16,32,64} type without=
 #include <linux/types.h>

Introduced by commits

  a851b2bd3632 ("scsi: uapi: ufs: Make utp_upiu_req visible to user space")
  e77044c5a842 ("scsi: ufs-bsg: Add support for uic commands in ufs_bsg_req=
uest()")

--=20
Cheers,
Stephen Rothwell

--Sig_/KHqK1_6L2xiani+aCG0g2.z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvALNsACgkQAVBC80lX
0GyV9Qf8CC42pjmBm+cWGHaPt+OS1yyHafI3aO6UrYXaueLBkNk186OZhGBf32Kd
FQQoVB7u22VNtlRlopYofiVdygR/s8QesHDm8ZWUsouPO2RIUoTRHvj7s/2qG/PI
QDpg0Xxmp1xY9QtrSXTAg31KqcFXwr86EjogWDHKm/8pmH/O/GcyFWwIsdhT6oWt
ViDpyXd1wFS6tj7xfqiIz4yidD6zNnIdMgpJkKIQOq/HnJsVzRy9o8eiZjzgIFIl
XC1bzLB0HhCZ9VukSmc2BgogbBQxUsR24JwxhVc0zotSFSvaGZrIW3K+M2cSW7M/
QhE9o8jwmwEgWk5+jCZ4L9QF6xkOtQ==
=F+6U
-----END PGP SIGNATURE-----

--Sig_/KHqK1_6L2xiani+aCG0g2.z--
