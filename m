From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Wed, 11 Jul 2018 14:17:37 +1000
Message-ID: <20180711141737.57c1e26f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e/xJEvIszopWtj+VmLt.WxF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>, Johannes Thumshirn <jth@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/e/xJEvIszopWtj+VmLt.WxF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/spinlock_types.h:18:0,
                 from include/linux/spinlock.h:82,
                 from drivers/scsi/libfc/fc_rport.c:61:
drivers/scsi/libfc/fc_rport.c: In function 'fc_rport_recv_req':
include/linux/lockdep.h:347:45: warning: 'rdata' may be used uninitialized =
in this function [-Wmaybe-uninitialized]
 #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
                                             ^
drivers/scsi/libfc/fc_rport.c:1832:24: note: 'rdata' was declared here
  struct fc_rport_priv *rdata;
                        ^~~~~

Introduced by commit

  ee35624e1e4e ("scsi: libfc: Add lockdep annotations")

It is actually complaining about function fc_rport_recv_plogi_req()
(presumably it is being inlined) and this looks like an actual bug :-(



--=20
Cheers,
Stephen Rothwell

--Sig_/e/xJEvIszopWtj+VmLt.WxF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltFhOEACgkQAVBC80lX
0Gw3VQf/bNqPyuTp71IwJs10OABVP4UC7BgpMgnR/RrIe903+Yz+YCcak8AXSAVZ
8klwOYkv3rpTYm8zboCEAeE9k8kqAxLP+QUi9PjAgcoAgozHuDU+Op1qbAzQW53t
Rye7vF+9QOhhA6uBbEFcoyeiK41wpFb5qWYqm04IUKJZOBeGZw3YKiPGdONW4FOa
FTz/LoOLtXvCRPxMogCy14iR9tb5hnNf9q1QhovxU8edw5TK2qEmz8i7SPRQ1Lo7
SIdU8gRwanHCd4LzMWZ8M6I5XTscjYc03F/fFL68gmSqb5laT2R0Wqd2S5WVD01Y
i4nlt7si/UgQj3WGF6MnGAeM4LnoVA==
=2iYZ
-----END PGP SIGNATURE-----

--Sig_/e/xJEvIszopWtj+VmLt.WxF--
