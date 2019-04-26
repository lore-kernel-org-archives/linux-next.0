From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Fri, 26 Apr 2019 16:06:58 +1000
Message-ID: <20190426160658.4929d1ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R5yihW0B/19T1CiRiJ4Pyoy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Cristiano Borges Cardoso <cristianoborgescardoso@gmail.com>, Nishka Dasgupta <nishka.dasgupta@yahoo.com>, Sanjana Sanikommu <sanjana99reddy99@gmail.com>, Vatsala Narang <vatsalanarang@gmail.com>, Bhanusree Pola <bhanusreemahesh@gmail.com>, Himadri Pandya <himadri18.07@gmail.com>, Jules Irenge <jbi.octave@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/R5yihW0B/19T1CiRiJ4Pyoy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/media/zoran/Kconfig
  drivers/staging/media/zoran/videocodec.c
  drivers/staging/media/zoran/videocodec.h
  drivers/staging/media/zoran/zoran.h
  drivers/staging/media/zoran/zoran_card.c
  drivers/staging/media/zoran/zoran_card.h
  drivers/staging/media/zoran/zoran_device.c
  drivers/staging/media/zoran/zoran_device.h
  drivers/staging/media/zoran/zoran_driver.c
  drivers/staging/media/zoran/zoran_procfs.c
  drivers/staging/media/zoran/zoran_procfs.h
  drivers/staging/media/zoran/zr36016.c
  drivers/staging/media/zoran/zr36016.h
  drivers/staging/media/zoran/zr36050.c
  drivers/staging/media/zoran/zr36050.h
  drivers/staging/media/zoran/zr36057.h
  drivers/staging/media/zoran/zr36060.c
  drivers/staging/media/zoran/zr36060.h

between commit:

  8dce4b265a53 ("media: zoran: remove deprecated driver")

from the v4l-dvb tree and various commits from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/R5yihW0B/19T1CiRiJ4Pyoy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCoAIACgkQAVBC80lX
0Gx9Rwf7Bi9v27JI+CUkXu1c4zKuj7ZMQfnCtLRBZ//cn6MnKUnnb0unp9K7ceCA
fYM7Se3TOfDJSvy4XKv/jfPCxuS/hPAuTA2xpXKdRJWiVgFMaGDhqC12DshkfYJ7
L/SyKk+o9affZCx8SBIXWMmOg1Frwx8XfdmFMT3En6yAww6B9PepthvAYUyNH3Fl
aRGkdOTKbTveyEnIfVYiiym/mEc8jnFnz59mSO4iUzb60oe1bxCvJQ5fMQ5Zzdto
SQPF7TNhFRgK9XSQpIEJdGprhIjrlux2bsvoX6fS7HindLkZJE2qhEPmqVjwaJIo
vJoMjGcgZaS8rlxMLm5zUQ0TQnX3Ig==
=S+98
-----END PGP SIGNATURE-----

--Sig_/R5yihW0B/19T1CiRiJ4Pyoy--
