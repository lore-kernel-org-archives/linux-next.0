From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Fri, 1 Feb 2019 10:22:33 +1100
Message-ID: <20190201102233.4643f528@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/26swWJgYn+uksKv0J51/Eiz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/26swWJgYn+uksKv0J51/Eiz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/vim2m.c

between commit:

  240809ef6630 ("media: vim2m: only cancel work if it is for right context")

from Linus' tree and commit:

  b3e64e5b0778 ("media: vim2m: use per-file handler work queue")

from the v4l-dvb tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/platform/vim2m.c
index 89d9c4c21037,e31c14c7d37f..000000000000
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@@ -806,10 -904,7 +904,9 @@@ static void vim2m_stop_streaming(struc
  	struct vb2_v4l2_buffer *vbuf;
  	unsigned long flags;
 =20
 -	cancel_delayed_work_sync(&ctx->work_run);
 +	if (v4l2_m2m_get_curr_priv(dev->m2m_dev) =3D=3D ctx)
- 		cancel_delayed_work_sync(&dev->work_run);
++		cancel_delayed_work_sync(&ctx->work_run);
 +
  	for (;;) {
  		if (V4L2_TYPE_IS_OUTPUT(q->type))
  			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);

--Sig_/26swWJgYn+uksKv0J51/Eiz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTgzkACgkQAVBC80lX
0GxrXgf/bYy+tP6gR1hfCseyvh/pQrv8gVEX+0hvoWzsq+YbnEpVXgVp/IIwNaBk
owtR78baI15GSGx5F0pccgiLXigjOVpiKcGckccHRkOrpP9yfM0v1bQ/28A33hPg
9auU0n5lX7mCDhjB7co1Bnzdsainxoko+auGxYPHM4iYiafvCczdBMPqDXkGa1mc
+w1azwmVXqcq5d7eS7+4GsO49kNvtKMHIFVPwT4H19AI8MSgb2QpaDeo0VppdTkr
Q2LHLxHBxkd1ihQjC/JwgvY+yDUncGs61rVLv2wR7NO0+FKpZQ7v29g/GbkdlnlO
ZizLndNJ6c1V5pwi2rpQW+jEP9Ky+g==
=8Ocf
-----END PGP SIGNATURE-----

--Sig_/26swWJgYn+uksKv0J51/Eiz--
