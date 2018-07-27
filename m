From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 27 Jul 2018 11:49:40 +1000
Message-ID: <20180727114940.1d94a95c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VzdAs7brUoe4RCdj6ne4fm="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VzdAs7brUoe4RCdj6ne4fm=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/compat_ioctl.c: In function 'do_video_set_spu_palette':
fs/compat_ioctl.c:218:45: error: invalid application of 'sizeof' to incompl=
ete type 'struct video_spu_palette'
  up_native =3D compat_alloc_user_space(sizeof(struct video_spu_palette));
                                             ^~~~~~
In file included from include/linux/uaccess.h:14:0,
                 from include/linux/compat.h:19,
                 from fs/compat_ioctl.c:17:
fs/compat_ioctl.c:219:46: error: dereferencing pointer to incomplete type '=
struct video_spu_palette'
  err  =3D put_user(compat_ptr(palp), &up_native->palette);
                                              ^
At top level:
fs/compat_ioctl.c:206:12: warning: 'do_video_set_spu_palette' defined but n=
ot used [-Wunused-function]
 static int do_video_set_spu_palette(struct file *file,
            ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  f863ce990030 ("media: dvb: get rid of VIDEO_SET_SPU_PALETTE")

grep is your friend ...

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VzdAs7brUoe4RCdj6ne4fm=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltaejQACgkQAVBC80lX
0GzE4Af+LN+cxPfP4v6G6gk+Ck4WTB6Mso3ETOLxxZb6xX1Bvaw0OHEXTmj18dgm
9Mm+syh1Xu0xfeu/Ov9bZ9H43znJRfJA6pGlSpW7Eb+/cUR4D9aGz7pjCGTIX7Br
oL91OUjwjh7B+IXyXUTs2jNQyy5UfOx1KWwjD2KUffQmohI0SKUwaqXgLwA+PaUY
f+K/QTEzuzZDCUT9yHM/ZHt5pVG1f1Iz01S4Hhu86lM3Xrk//LStkQMQOZAhElwb
37Q0scrxOuFI7xc7n8WOMudjbZkD5EaQKYKuFZHTEJZcUU5DZAxg9gbVWFVpHPLa
nZEbqBR0qORigMPissxp1tzCY06Gdg==
=7JOE
-----END PGP SIGNATURE-----

--Sig_/VzdAs7brUoe4RCdj6ne4fm=--
