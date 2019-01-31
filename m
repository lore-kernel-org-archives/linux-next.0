From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Fri, 1 Feb 2019 10:27:13 +1100
Message-ID: <20190201102713.4c490de4@canb.auug.org.au>
References: <20190201102233.4643f528@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hLAhYLqJ32CnJYmwQxFWBMT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201102233.4643f528@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/hLAhYLqJ32CnJYmwQxFWBMT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 1 Feb 2019 10:22:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>=20
>   drivers/media/platform/vim2m.c
>=20
> between commit:
>=20
>   240809ef6630 ("media: vim2m: only cancel work if it is for right contex=
t")
>=20
> from Linus' tree and commit:
>=20
>   b3e64e5b0778 ("media: vim2m: use per-file handler work queue")
>=20
> from the v4l-dvb tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> diff --cc drivers/media/platform/vim2m.c
> index 89d9c4c21037,e31c14c7d37f..000000000000
> --- a/drivers/media/platform/vim2m.c
> +++ b/drivers/media/platform/vim2m.c
> @@@ -806,10 -904,7 +904,9 @@@ static void vim2m_stop_streaming(struc
>   	struct vb2_v4l2_buffer *vbuf;
>   	unsigned long flags;
>  =20
>  -	cancel_delayed_work_sync(&ctx->work_run);
>  +	if (v4l2_m2m_get_curr_priv(dev->m2m_dev) =3D=3D ctx)
> - 		cancel_delayed_work_sync(&dev->work_run);
> ++		cancel_delayed_work_sync(&ctx->work_run);
>  +
>   	for (;;) {
>   		if (V4L2_TYPE_IS_OUTPUT(q->type))
>   			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);

Well, that wasn't right, so instead I just effectively reverted the
commit from Linus' tree ...

--=20
Cheers,
Stephen Rothwell

--Sig_/hLAhYLqJ32CnJYmwQxFWBMT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxThFEACgkQAVBC80lX
0GyJQAf/TBZGTgKm2pqNXLG7G5nEfgLYsN0RnIbQcGjgesJIbjjsqprPuNpAyTp2
8K1ePWvR4TkVna4xerbYBDCRo42vpJJxBTIJfyQShGmhliPnple+SMZNoWH/1jZE
kq/jRXjVepGVwr21Nt0Vtyz41XPCtGmSecfPDM8DRQHV7kZaAae8Izu/MqW2lnSC
tDYp92NZyTJKQj0kpcfYf7wMv1Ip4hTXahFbhHzPrb4FsuH6CvIK6wS2tA96J5Cg
YVpu+YYjBBKWezJFLVUnNwUjQMcoMSzfbpNL/sWGgTOj4ksXzOZ/B5YjNQNq1ZUm
Lt9SEHV53Xpy7SysLno/XtJMBDR+BA==
=CiFi
-----END PGP SIGNATURE-----

--Sig_/hLAhYLqJ32CnJYmwQxFWBMT--
