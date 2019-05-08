From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Wed, 8 May 2019 11:54:36 +1000
Message-ID: <20190508115436.43cd6bc0@canb.auug.org.au>
References: <20190426160658.4929d1ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y2.zRoqKy//H05ubAmjuWI6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426160658.4929d1ad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Cristiano Borges Cardoso <cristianoborgescardoso@gmail.com>, Nishka Dasgupta <nishka.dasgupta@yahoo.com>, Sanjana Sanikommu <sanjana99reddy99@gmail.com>, Vatsala Narang <vatsalanarang@gmail.com>, Bhanusree Pola <bhanusreemahesh@gmail.com>, Himadri Pandya <himadri18.07@gmail.com>, Jules Irenge <jbi.octave@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y2.zRoqKy//H05ubAmjuWI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 26 Apr 2019 16:06:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the staging tree got conflicts in:
>=20
>   drivers/staging/media/zoran/Kconfig
>   drivers/staging/media/zoran/videocodec.c
>   drivers/staging/media/zoran/videocodec.h
>   drivers/staging/media/zoran/zoran.h
>   drivers/staging/media/zoran/zoran_card.c
>   drivers/staging/media/zoran/zoran_card.h
>   drivers/staging/media/zoran/zoran_device.c
>   drivers/staging/media/zoran/zoran_device.h
>   drivers/staging/media/zoran/zoran_driver.c
>   drivers/staging/media/zoran/zoran_procfs.c
>   drivers/staging/media/zoran/zoran_procfs.h
>   drivers/staging/media/zoran/zr36016.c
>   drivers/staging/media/zoran/zr36016.h
>   drivers/staging/media/zoran/zr36050.c
>   drivers/staging/media/zoran/zr36050.h
>   drivers/staging/media/zoran/zr36057.h
>   drivers/staging/media/zoran/zr36060.c
>   drivers/staging/media/zoran/zr36060.h
>=20
> between commit:
>=20
>   8dce4b265a53 ("media: zoran: remove deprecated driver")
>=20
> from the v4l-dvb tree and various commits from the staging tree.
>=20
> I fixed it up (I just removed the files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the v4l-dvb tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/y2.zRoqKy//H05ubAmjuWI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzSNtwACgkQAVBC80lX
0Gw93AgAgXI+L7EKmqLwU/ffg+z9s8iyRFRYmx/S71Paap7Z9yoMxFDmQwgviuLU
hDT3h92tucDNb5eeFRg67dc+2pJ04VrcJMt9+X2euBqHKW6XXdxIIqx+CErWzqdi
zhcetUB1Y9S8ULEOaKX+WYhntTJBERFEBKWYA9dCVOGlZOZXLrzrt8Rc5yY8IflB
CCr2t3XL1BqF1S2ncuu457EydOKu1t/oJ+Qz9svxTTCowQKEjFqMIrJ6VQVZe16Y
1hQEbpmHbuIB6FlH+wzDfbex7qB5xGCTevesmk2YiFQ4tx8+aJ2GSFQpwfJRFVAI
teswJyi+AY3dB8oQhifiZmafApIqwQ==
=xf3A
-----END PGP SIGNATURE-----

--Sig_/y2.zRoqKy//H05ubAmjuWI6--
