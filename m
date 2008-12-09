From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Tue, 9 Dec 2008 19:54:17 +1100
Message-ID: <20081209195417.1b671249.sfr@canb.auug.org.au>
References: <20081209172954.bab90ae4.sfr@canb.auug.org.au>
	<20081209.000423.18106461.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_19_54_17_+1100_KwbB_f7KwKJU2f79"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41219 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752060AbYLIIy2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 03:54:28 -0500
In-Reply-To: <20081209.000423.18106461.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, marcel@holtmann.org, rmk@arm.linux.org.uk

--Signature=_Tue__9_Dec_2008_19_54_17_+1100_KwbB_f7KwKJU2f79
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 09 Dec 2008 00:04:23 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> I just pushed the following fix for this, thanks Stephen:
>=20
> bluetooth: Fix rfcomm_sock_ioctl() build failure with debugging enabled.
>=20
> It's 'sock' not 'sk'.
>=20
> Signed-off-by: David S. Miller <davem@davemloft.net>
> ---
>  net/bluetooth/rfcomm/sock.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
> index ad00cbf..ffaa6b0 100644
> --- a/net/bluetooth/rfcomm/sock.c
> +++ b/net/bluetooth/rfcomm/sock.c
> @@ -792,7 +792,7 @@ static int rfcomm_sock_ioctl(struct socket *sock, uns=
igned int cmd, unsigned lon
>  #endif
>  	int err;
> =20
> -	BT_DBG("sk %p cmd %x arg %lx", sk, cmd, arg);
> +	BT_DBG("sk %p cmd %x arg %lx", sock, cmd, arg);

I am not sure this is correct as there is a "sk" defined just above here
but surrounded by

#if defined(CONFIG_BT_RFCOMM_TTY) || defined(CONFIG_BT_RFCOMM_DEBUG)

?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_19_54_17_+1100_KwbB_f7KwKJU2f79
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+MjkACgkQjjKRsyhoI8y+yQCfa8zAyAhVM1uVMdsNd6EK36xM
kGEAnRHQxJyXw/gaCe0K7NI6/ZvG3O5H
=zqpt
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_19_54_17_+1100_KwbB_f7KwKJU2f79--
