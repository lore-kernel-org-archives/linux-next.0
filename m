From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the scsi
 tree
Date: Fri, 29 Jun 2018 15:16:18 +1000
Message-ID: <20180629151618.1da8d00c@canb.auug.org.au>
References: <20180620135458.7cc22318@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qSqQw0u5Cwk6TUGhAVC_Fo9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620135458.7cc22318@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qSqQw0u5Cwk6TUGhAVC_Fo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Jun 2018 13:54:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   lib/percpu_ida.c
>=20
> between commit:
>=20
>   acf3ff616ee2 ("scsi: Remove percpu_ida")
>=20
> from the scsi tree and commit:
>=20
>   0c4d6e08c775 ("lib/percpu_ida.c: don't do alloc from per-CPU list if th=
ere is none")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (I just removed the file, but clearly the akpm-current
> tree commit could be removed) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between Linus' tree and the scsi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qSqQw0u5Cwk6TUGhAVC_Fo9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1wKIACgkQAVBC80lX
0GxdgAf+Ljt2myxII87Rjb/ArZuduEzC/MOkJL/D1USx+2/90u8ToX8HPeHpBwt+
7V7PYYblLAqts601kwSH4xjpF7mIcu3+veOPsoCb5mmNyKwfLWXikw8lmWTPBBuo
Dq0hXgfZmeq/JKcQrqhAf1gCttxI77VycR5oHSV6Ipfaz+2dKaXHD61rjUMNl8Bp
LqOxbr3Loyz+SxFc6wmWobEowYKxv//W3phWy9bCbmYodA5vSyPl39+8NjN0qTk7
kqbPFntiqdzO5ZGxtaFGY3HRgoNIxW5lNl7ff2GIAQngmEL91sJ63AraDKf6bYh5
9vv621u22qQPI5MGW7oJK2z4ClcIug==
=34mt
-----END PGP SIGNATURE-----

--Sig_/qSqQw0u5Cwk6TUGhAVC_Fo9--
