From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the v4l-dvb tree
Date: Wed, 20 Mar 2019 08:21:03 +1100
Message-ID: <20190320082103.33faecc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CvF6ijSEHOPcIWeUBaffbQU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CvF6ijSEHOPcIWeUBaffbQU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e6f8bd59c28f ("media: gspca: do not resubmit URBs when streaming has stop=
ped")

Fixes tag

  Fixes: 6992effe5344 ("gspca: Kill all URBs before releasing any of them")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

In commit

  904371f90b2c ("media: imx: csi: Allow unknown nearest upstream entities")

Fixes tag

  Fixes: bf3cfaa712e5c ("media: staging/imx: get CSI bus type from nearest

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not wrap Fixes tags onto more that one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/CvF6ijSEHOPcIWeUBaffbQU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyRXT8ACgkQAVBC80lX
0GxVOQf6AlwmkMC9S5hkHasfSbyvpZN5Xj9+m/NXEU1SL0eRK9yGBzv2EpxVsQ6o
faeg+LTxJaJ0wOhZsgPNbMwX+APSylZepn+jG1JrEYAGOSgrrR9oJFaNj0ln+hew
d/cqEnmjsMVI4F6xHV53vfrJgfFO6SS/KRjL4VGKHLEKRw3Xs5rVPSs8J8Z7h1h9
iYv1h40F16sAji9d3Ci+i1nhP+YcXhzYwHkcLQGZm1Nz/mWEvhJ72tcG3vmJujJs
r0URmYqe1D1jif89+PNlvgGoNfgbr1lfOiQ7hSZJc0fSUCFjUSTHtNLa7kXBOJ7v
pA5FSMHyEBD822pv03pjmBxyjCB2yQ==
=UTpX
-----END PGP SIGNATURE-----

--Sig_/CvF6ijSEHOPcIWeUBaffbQU--
