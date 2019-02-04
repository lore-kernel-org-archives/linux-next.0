From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Mon, 4 Feb 2019 15:32:54 +1100
Message-ID: <20190204153254.78c4be0e@canb.auug.org.au>
References: <20190204104427.0c0da12d@canb.auug.org.au>
        <20190203.202606.1052226767975507689.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m=qz5rF8O7JV5Nu.bpNzkcs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203.202606.1052226767975507689.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, deepa.kernel@gmail.com, gustavo@embeddedor.com, keescook@chromium.org
List-Id: linux-next.vger.kernel.org

--Sig_/m=qz5rF8O7JV5Nu.bpNzkcs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 03 Feb 2019 20:26:06 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Thanks, I just pushed the following:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [PATCH] net: Fix fall through warning in y2038 tstamp changes.
>=20
> net/core/sock.c: In function 'sock_setsockopt':
> net/core/sock.c:914:3: warning: this statement may fall through [-Wimplic=
it-fallthrough=3D]
>    sock_set_flag(sk, SOCK_TSTAMP_NEW);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> net/core/sock.c:915:2: note: here
>   case SO_TIMESTAMPING_OLD:
>   ^~~~
>=20
> Fixes: 9718475e6908 ("socket: Add SO_TIMESTAMPING_NEW")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> ---
>  net/core/sock.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/net/core/sock.c b/net/core/sock.c
> index a8904ae40713..71ded4d8025c 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -912,6 +912,7 @@ int sock_setsockopt(struct socket *sock, int level, i=
nt optname,
> =20
>  	case SO_TIMESTAMPING_NEW:
>  		sock_set_flag(sk, SOCK_TSTAMP_NEW);
> +		/* fall through */
>  	case SO_TIMESTAMPING_OLD:
>  		if (val & ~SOF_TIMESTAMPING_MASK) {
>  			ret =3D -EINVAL;

Looks good, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/m=qz5rF8O7JV5Nu.bpNzkcs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXwHYACgkQAVBC80lX
0GyUOQf/S+6wsCBMEa5p7LrVjgNrMtBCFvStxozA0593II7hsmGHAEw/kmgzB3mG
4+UeSW9wiCp+fhWNXtsI6YderQQ+lmCgv9wetMR00+0uyBndfvXh3slYBo4zKEdC
hRpb5RxF7+6zKcwBYgYXCO/RLVafq0jKvNr4sh4Rj2oE9bru9rolfGgWEcA1alLB
qsqklV008rsBVJHq8kh/LlRijLc59oMr59w88Kfv8w1YRWVdw9Fa5XVppfmQ2a9m
jRrzhAtlbawHmArZ4wMeSv5RgQ0qyb7PSsMmCXMYYBvTkjKweeIT+sElZ0MFzaco
ZQsKQaI8Os9hjKJnlH4+K6aum2P1VA==
=phMT
-----END PGP SIGNATURE-----

--Sig_/m=qz5rF8O7JV5Nu.bpNzkcs--
