From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH-next] pcmcia: fix sparse integer as NULL pointer warning
Date: Thu, 24 Jul 2008 14:36:34 +1000
Message-ID: <20080724143634.74fe3b8d.sfr@canb.auug.org.au>
References: <1216863248.30386.61.camel@brick>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jul_2008_14_36_34_+1000_stNn7V15Qrhm4lP9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57285 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752527AbYGXEgl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 00:36:41 -0400
In-Reply-To: <1216863248.30386.61.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Dominik Brodowski <linux@brodo.de>, linux-next <linux-next@vger.kernel.org>

--Signature=_Thu__24_Jul_2008_14_36_34_+1000_stNn7V15Qrhm4lP9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jul 2008 18:34:08 -0700 Harvey Harrison <harvey.harrison@gmail.c=
om> wrote:
>
> +++ b/drivers/pcmcia/rsrc_nonstatic.c
> @@ -275,7 +275,7 @@ static int readable(struct pcmcia_socket *s, struct r=
esource *res,
>  		destroy_cis_cache(s);
>  	}
>  	s->cis_mem.res =3D NULL;
> -	if ((ret !=3D 0) || (count =3D=3D 0))
> +	if ((ret !=3D 0) || (count =3D=3D NULL))

I was wondering if it should be
			   (*count =3D=3D 0)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jul_2008_14_36_34_+1000_stNn7V15Qrhm4lP9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiIBtIACgkQjjKRsyhoI8z8pwCeM63XNBFhbro5FPkx//U3utdq
sO0AmwWdOWtjGVKtDC1oy2VuxdKHsw/n
=8rSD
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jul_2008_14_36_34_+1000_stNn7V15Qrhm4lP9--
