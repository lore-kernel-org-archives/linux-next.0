From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
Date: Thu, 12 Jul 2018 14:30:57 +1000
Message-ID: <20180712143057.49bfcab5@canb.auug.org.au>
References: <20180711141737.57c1e26f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QpsxAeG3Hm0fA0SqnzCuzmo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711141737.57c1e26f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>, Johannes Thumshirn <jth@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/QpsxAeG3Hm0fA0SqnzCuzmo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jul 2018 14:17:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> In file included from include/linux/spinlock_types.h:18:0,
>                  from include/linux/spinlock.h:82,
>                  from drivers/scsi/libfc/fc_rport.c:61:
> drivers/scsi/libfc/fc_rport.c: In function 'fc_rport_recv_req':
> include/linux/lockdep.h:347:45: warning: 'rdata' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
>  #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
>                                              ^
> drivers/scsi/libfc/fc_rport.c:1832:24: note: 'rdata' was declared here
>   struct fc_rport_priv *rdata;
>                         ^~~~~
>=20
> Introduced by commit
>=20
>   ee35624e1e4e ("scsi: libfc: Add lockdep annotations")
>=20
> It is actually complaining about function fc_rport_recv_plogi_req()
> (presumably it is being inlined) and this looks like an actual bug :-(

This warning now appears after the merge of the scsi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QpsxAeG3Hm0fA0SqnzCuzmo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltG2YEACgkQAVBC80lX
0GzzMwf/RUfZU0nUt9kl6fQB6BP2pu9MFDudXIqjRdYcd3S+GcbuIpjitzD40gnc
5qMFknUXC6W7xJMhJdBSfKGCEZ8OS4yYS0p7RbRt4RJO/bAZkMx786rK7oP492EC
fQqQFTWm/5bk5Yob4LtuNA/mdD5fR+tewsOAjc2R128ZfvFak6AqDhEEISZS9S7f
vyUEx9JCkf2y37hQCOPBOQURrzM9VhHbQ/7jLSYTbcxW9/etLiJUsggdjjAKv/Lf
yba63YcyW6+WjeQO2PFboroddtpbwLWeEl4bm/8/s8Mj4zY5jSlPJl67CZ5BCHwK
R4OIaWYC1bzy2qLwygkTSdWJwc0HzQ==
=6XiN
-----END PGP SIGNATURE-----

--Sig_/QpsxAeG3Hm0fA0SqnzCuzmo--
