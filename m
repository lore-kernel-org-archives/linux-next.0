From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: linux-next: Tree for October 7 (libertas build failure)
Date: Thu, 08 Oct 2009 00:34:55 +0200
Message-ID: <1254954895.3713.8.camel@johannes.local>
References: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
	 <20091007105210.409a1991.randy.dunlap@oracle.com>
	 <1254939120.16001.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-JuxiytzgcjjyFdQt2Mmq"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1254939120.16001.45.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libertas-dev-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Holger Schurig <hs4233-x6+DxXLjN1AJvtFkdXX2Hg4jNU5vUVPG@public.gmane.org>
List-Id: linux-next.vger.kernel.org


--=-JuxiytzgcjjyFdQt2Mmq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-10-07 at 11:12 -0700, Dan Williams wrote:

> > drivers/built-in.o: In function `lbs_cfg_free':
> > (.text+0x3479e0): undefined reference to `wiphy_unregister'
> > drivers/built-in.o: In function `lbs_cfg_free':
> > (.text+0x3479e7): undefined reference to `wiphy_free'
> > drivers/built-in.o: In function `lbs_cfg_register':
> > (.text+0x347a52): undefined reference to `wiphy_register'
> > drivers/built-in.o: In function `lbs_cfg_alloc':
> > (.text+0x347acf): undefined reference to `wiphy_new'
>=20
> Holger, perhaps we need some Kconfig updates to select cfg80211?

Depend on, please -- cfg80211 has dependencies that would otherwise be
messed up.

johannes

--=-JuxiytzgcjjyFdQt2Mmq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJKzReIAAoJEODzc/N7+QmaCgAP/1y+IhIC2lLiqthiOSO23gNf
ecUTj1Gxs1AXltLj1azkul7WvhLcBuH0O2Y0NdgQrwBJO0tQqOiG4fySvvA71AzT
a7Hx/NN6cV3qKCj7Iyx6FFHIj/Sm5d8xRoySm4vAmrkemj0Pk5Dz5YVFZHIGvizp
uU/QRph4Do7R51XR22ePB8NxxfM3LDh9oNLjxkEQ9khJg4PpCRS5c99VLuwKaeOZ
MQ6fD0yTT+5iAbHonRIGiBdlVCF/5Mbs+cDwJwWU0nJsMy4RHKaHH7x/UvHuorjH
ygS8gHWaiYbIvJCyO+BdHwqHRRB8RTx5ys7NyjJEgb7SlfEg6wrU18q2pkIjmZ9Z
/R1LX/zqKjX/42GFOAw9SkW1njm7NfwjLfkzOGp4CB7UnMpMZQc/ZUYBlGl6udQ8
NULaMR5hBXOZhRF5iwTB8qmT50Xi2QaNjSc8bAcIysAy3I50cP/7K6ttBxzTRzJW
oMtAE9RkZR1x/i0wJCviABjWeU0tmAdYaFI7YQgduw3x3vG63nDiU511rg866YIL
DDdo4kt21AIqKsydTmeVUWUyOpl4JxY1uLuy+HTNi4oMaiZIBGeeExjf1Xxo9Kyg
z8aMKUBcQcChhcmth/yiBDeZhGsEl2IkSClXOhJHzJHCTAF2GRfMbCld2zBTaqtD
dJ+/KT3GwnWY0YxFFuZk
=CkZN
-----END PGP SIGNATURE-----

--=-JuxiytzgcjjyFdQt2Mmq--

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
