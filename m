From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Tue, 10 Jul 2018 17:31:26 +1000
Message-ID: <20180710173114.17ee69ad@canb.auug.org.au>
References: <20180620132911.5f6ab464@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kzjMS7hkaBT=6vyhyCFXfXm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620132911.5f6ab464@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, Felipe Balbi <felipe.balbi@linux.intel.com>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kzjMS7hkaBT=6vyhyCFXfXm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Jun 2018 13:29:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the scsi tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>=20
> In file included from include/target/target_core_base.h:7:0,
>                  from drivers/target/target_core_tmr.c:31:
> include/linux/sbitmap.h:331:46: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_show(struct sbitmap *sb, struct seq_file *m);
>                                               ^~~~~~~~
> include/linux/sbitmap.h:342:53: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_bitmap_show(struct sbitmap *sb, struct seq_file *m);
>                                                      ^~~~~~~~
> include/linux/sbitmap.h:530:59: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_queue_show(struct sbitmap_queue *sbq, struct seq_file *m);
>                                                            ^~~~~~~~
> In file included from include/target/target_core_base.h:7:0,
>                  from drivers/target/target_core_ua.c:30:
> include/linux/sbitmap.h:331:46: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_show(struct sbitmap *sb, struct seq_file *m);
>                                               ^~~~~~~~
> include/linux/sbitmap.h:342:53: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_bitmap_show(struct sbitmap *sb, struct seq_file *m);
>                                                      ^~~~~~~~
> include/linux/sbitmap.h:530:59: warning: 'struct seq_file' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>  void sbitmap_queue_show(struct sbitmap_queue *sbq, struct seq_file *m);
>                                                            ^~~~~~~~
>=20
> Introduced by commit
>=20
>   24af1ccfe12a ("sbitmap: add helpers for dumping to a seq_file")
>=20
> in v4.11.rc1, but exposed by commit
>=20
>   eca7ee1f33e8 ("scsi: target: Convert target drivers to use sbitmap")

I am still seeing these warnings ...

--=20
Cheers,
Stephen Rothwell

--Sig_/kzjMS7hkaBT=6vyhyCFXfXm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEYM4ACgkQAVBC80lX
0GyOOwf8C7idYXHXskyM+Q0xKibPieG/XF2sl5g6jfQ/hq4+HvIxhiK0UPvxufFq
OY3EL7qDmnpytxP3AU4Luo3LDOTgGssd/0RJ+VG2lTszjlb9RmYbn1YwukSPfE9x
KSUs/375mYOVvL8jMbQRXslYnsuLr09wj0XhGPNk0pEeTc7vTChJJUMhg55QPU2u
qww8Sl7r3rI4nVomSKedHhVc3gaeSBr37iTMTPN6Ts/UNHxWP5FIVsjGfSe/A/yc
H4KsnooLckfJyj8+K7pSLALLJTmZPAb9o1GWRVywpI0V7gG5bVEsh3Bvf12sZYFm
nEYwuyupgE6CORAIwTJ98TgyG/MGoA==
=PTOQ
-----END PGP SIGNATURE-----

--Sig_/kzjMS7hkaBT=6vyhyCFXfXm--
