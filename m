From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Mon, 14 May 2018 14:34:04 +1000
Message-ID: <20180514143404.28f0f4da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u+B+R8AE0DV4_D81VVehBkG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abdun Nihaal <abdun.nihaal@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/u+B+R8AE0DV4_D81VVehBkG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/staging/most/video/video.c: In function 'vidioc_enum_fmt_vid_cap':
drivers/staging/most/video/video.c:265:25: warning: unused variable 'mdev' =
[-Wunused-variable]
  struct most_video_dev *mdev =3D fh->mdev;
                         ^~~~
drivers/staging/most/video/video.c: In function 'vidioc_g_fmt_vid_cap':
drivers/staging/most/video/video.c:282:25: warning: unused variable 'mdev' =
[-Wunused-variable]
  struct most_video_dev *mdev =3D fh->mdev;
                         ^~~~
drivers/staging/most/video/video.c: In function 'vidioc_g_std':
drivers/staging/most/video/video.c:309:25: warning: unused variable 'mdev' =
[-Wunused-variable]
  struct most_video_dev *mdev =3D fh->mdev;
                         ^~~~

Introduced by commit

  7d7cdb4fa552 ("staging: most: video: remove debugging code")

--=20
Cheers,
Stephen Rothwell

--Sig_/u+B+R8AE0DV4_D81VVehBkG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr5EbwACgkQAVBC80lX
0GyGNwgAjA0LzxPi3bmlhD0W5wUpPD+XphUWqm2W41rF+ZxFzCudRh5naX04Ymrh
IoAd5qT7qv/76mo9fWsOA+jnWCfZtl9Y3gTQVq1ucnAiihJ9wiB41OGYN1RXMkPO
AS9UVNa7vpDmPPZw4Lgf8e/JVKKDjuy6lt6e56ki5RK13DExyoowMiAISpDboaWa
3AjC+Q+F6Cloue9PizpfIsCKKiIdu1hdSmME0cgHkJ5xeoGZzOGPhxDxFWaUCmXs
fv5flIaOqnQG5WLY6N+5zR9uWtzLUspjfuwjR+PPRoAdLnDoKeDHpBZirbkA+fmM
P+/rzJXMsW4CeEB8ow5PFFZWOg32kQ==
=406w
-----END PGP SIGNATURE-----

--Sig_/u+B+R8AE0DV4_D81VVehBkG--
