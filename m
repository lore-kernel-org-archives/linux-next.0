From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Date: Tue, 27 Nov 2018 09:40:29 +1100
Message-ID: <20181127094029.68ce2322@canb.auug.org.au>
References: <20181126111933.1b0fb324@canb.auug.org.au>
        <20181126215924.GA55960@jaegeuk-macbookpro.roam.corp.google.com>
        <20181127091747.4830d123@canb.auug.org.au>
        <20181126222257.GB55960@jaegeuk-macbookpro.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bmqd=dgIjI9Oi56n3LVdm1f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126222257.GB55960@jaegeuk-macbookpro.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Kees Cook <keescook@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Bmqd=dgIjI9Oi56n3LVdm1f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

On Mon, 26 Nov 2018 14:22:57 -0800 Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> Is this okay?

That looks great, thanks.

> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Mon, 26 Nov 2018 14:20:32 -0800
> Subject: [PATCH] f2fs: avoid build warn of fall_through
>=20
> After merging the f2fs tree, today's linux-next build
>  (x86_64_allmodconfig) produced this warning:
>=20
>  In file included from fs/f2fs/dir.c:11:
>  fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
>  fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimpli=
cit-fallthrough=3D]
>     if (set)
>        ^
>  fs/f2fs/f2fs.h:2390:2: note: here
>    case FI_DATA_EXIST:
>    ^~~~
>=20
>  Exposed by my use of -Wimplicit-fallthrough
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 26ad1de8641c..b3fe6803d4c6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2387,6 +2387,7 @@ static inline void __mark_inode_dirty_flag(struct i=
node *inode,
>  	case FI_NEW_INODE:
>  		if (set)
>  			return;
> +		/* fall through */
>  	case FI_DATA_EXIST:
>  	case FI_INLINE_DOTS:
>  	case FI_PIN_FILE:
> --=20

--=20
Cheers,
Stephen Rothwell

--Sig_/Bmqd=dgIjI9Oi56n3LVdm1f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv8dl0ACgkQAVBC80lX
0GwTQAf+Pss4gmOFL+eTIo+EH0mGhzGP6Doi4L2gl7kKtG3jBfP1NGpsIXXMBDsj
igno02FBmI1zgX6MzUp78mEzGeq4dzOjNhpTTGlo9MNoLKjCHgTBZRVvhJ0HE9m6
hU2Ff19mTVpv88y0AH1KyfaD/OFVs/rDiM+I0JV5aP+sOuorG2FfdKiY936x9hZO
pOUrylAjwE2yjCVzdlsOeTotVlmV3IfIKcduW2rD/mVhF4krgMOsODXHvGPEW7tM
5ZLGsoNQQIkthru8hg1NhBa+akJvb9HzTMQarqNVFLbOkMyWskUVWV+e/phCXeZM
AZxxIzJPkIN64a+jHoFS7ypEbUwH8g==
=V9lz
-----END PGP SIGNATURE-----

--Sig_/Bmqd=dgIjI9Oi56n3LVdm1f--
