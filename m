From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Tue, 19 Feb 2019 10:52:45 +1100
Message-ID: <20190219105245.2e1f221b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bzrdqN7TmhUHDR9wN2hYggK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bzrdqN7TmhUHDR9wN2hYggK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/media/imx/imx7-media-csi.c: In function 'imx7_csi_set_fmt':
drivers/staging/media/imx/imx7-media-csi.c:1086:11: error: passing argument=
 2 of 'imx_media_mbus_fmt_to_pix_fmt' from incompatible pointer type [-Werr=
or=3Dincompatible-pointer-types]
           &csi->format_mbus[IMX7_CSI_PAD_SRC],
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
drivers/staging/media/imx/imx-media.h:183:25: note: expected 'struct v4l2_r=
ect *' but argument is of type 'struct v4l2_mbus_framefmt *'
       struct v4l2_rect *compose,
       ~~~~~~~~~~~~~~~~~~^~~~~~~
drivers/staging/media/imx/imx7-media-csi.c:1087:18: error: passing argument=
 3 of 'imx_media_mbus_fmt_to_pix_fmt' from incompatible pointer type [-Werr=
or=3Dincompatible-pointer-types]
           csi->cc[IMX7_CSI_PAD_SRC]);
           ~~~~~~~^~~~~~~~~~~~~~~~~~
In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
drivers/staging/media/imx/imx-media.h:184:40: note: expected 'const struct =
v4l2_mbus_framefmt *' but argument is of type 'const struct imx_media_pixfm=
t *'
       const struct v4l2_mbus_framefmt *mbus,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
drivers/staging/media/imx/imx7-media-csi.c:1085:2: error: too few arguments=
 to function 'imx_media_mbus_fmt_to_pix_fmt'
  imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
drivers/staging/media/imx/imx-media.h:182:5: note: declared here
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/imx/imx7-media-csi.c:1089:2: error: too few arguments=
 to function 'imx_media_capture_device_set_format'
  imx_media_capture_device_set_format(vdev, &vdev_fmt);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
drivers/staging/media/imx/imx-media.h:278:6: note: declared here
 void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  05f634040c0d ("media: staging/imx7: add imx7 CSI subdev driver")

interacting with the earlier commit

  5964cbd86922 ("media: imx: Set capture compose rectangle in capture_devic=
e_set_format")

I have used the v4l-dvb tree from next-20190218 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bzrdqN7TmhUHDR9wN2hYggK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrRU0ACgkQAVBC80lX
0GyHjAgAlIbD5TA/JqYW2IpKnPp2xdYYO/BR5stAhAIxBQ8vtGNDyckGlWhaRIE6
heuian4hEtHBhlr5mUCysoZ9j7GQ+uWBt4zRyghXlqhFjDJDSHHoN0QHbkebKJKM
OdwP3tVYPFAZpLtLJkYQVaKl0Bx+ssCQShEuUWExiwDygwHSuXEaKyjAaLcOTlCs
xkUVTTcGGBg5zWUx/AR9lnyddonbJs6R4Xdg32GXWUg2g14Ra9MFoU85bpcK8K1Q
1wIfB+H4I7eKZ/TggHqPqJ9t/OHzAfmPrglxafVMtw5oPG64S0v7lFIgz/LmPXIy
CCr6nTKrEBflCcCXXp2YjDK0inL0oQ==
=B7OL
-----END PGP SIGNATURE-----

--Sig_/bzrdqN7TmhUHDR9wN2hYggK--
