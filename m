From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: manual merge of the wireless tree
Date: Wed, 17 Sep 2008 09:45:20 +0200
Message-ID: <1221637520.9262.37.camel@johannes.berg>
References: <20080917174317.a5335e6c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-y+IpQG8IKKru6Y+lmFG0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:33323 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397AbYIQHqM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Sep 2008 03:46:12 -0400
In-Reply-To: <20080917174317.a5335e6c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>


--=-y+IpQG8IKKru6Y+lmFG0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-09-17 at 17:43 +1000, Stephen Rothwell wrote:
> Hi John,
>=20
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/mac80211_hwsim.c between commit
> 121e2082a81c7988a1399c1a5f43795c95225de2 ("device create: net: convert
> device_create_drvdata to device_create") from the driver-core tree and
> commit init_mac80211_hwsim( ("mac80211 hwsim: make radio list dynamic")
> from the wireless tree.
>=20
> The former modified the context of the latter.  I fixed it up (see below)
> and can carry the fix.

Looks fine to me, thanks.

johannes

--=-y+IpQG8IKKru6Y+lmFG0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJI0LWMAAoJEKVg1VMiehFYXbYP/A83zFkE07ikwQuJ8JtmLrYb
fUBZWYIDaquKHY01oJe6gI1nCC9P8abocxM3QTGcJLR/ZAnUYKxjUSgsY0koE4mj
Uz7FrX7Gd5KBrQLmG1ZKYW4d1jyMbmTZkI8lz7ROKi71V1UZ957b20MUhq/d+w3k
7tMblJEgkFfBdCHimEs+2ZGDyRGAAHdnOjTj6Fayp8XbiCvC+3gD4PMEQi5H1IGx
1A/f2EhfVTyaC4Lf+CI+qGr3B8OSifUAZV0aAWr6KGUc/aAEe7yD2/bhtJHAS3Ga
II3uRnfItvYG/dPwXRg3xu+l+Tvp9MOQ40Tb5+BrdrHu8xeKU7EI4W13PoFbwoMp
3xTxp5Pvi1cWRuiTF+7g6bs6/C6wV1QouMXi1aUhdiBv+QFUWIrToGSQu4Zmdppx
dfejAELwArd0frpzWSw3aWBxzjcDJhOlGPgWhVCDYLUIEn2P2PMNLlHrNKC5X4gX
6mQAUzGl4Nl2lmp3+5mSzMxXoYbFBJB4XUu+GRQtUo+fnqwSlygvodj+oEm0Cw22
EQ2jiML2x8FbpUY698+baPNwDH78hjrftbWx3hTWwZ6zOWQwqUwzIxJJ7WIw1e4J
RqhaW2bbRkeeAJtnlxb8v/FeYgUiEOwldarKIGqpvNjLhqIrIDr3kqV628ZLB5s/
iRLR0RxF70FgwIhZ7CGC
=HIb6
-----END PGP SIGNATURE-----

--=-y+IpQG8IKKru6Y+lmFG0--
