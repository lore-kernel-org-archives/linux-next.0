From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 15:33:11 +0200
Message-ID: <1240407191.21978.17.camel@johannes.local>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
	 <1240390746.17388.64.camel@johannes.local>
	 <20090422230333.e1f7d3db.sfr@canb.auug.org.au>
	 <20090422130612.GB3288@tuxdriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-XvaBafj8MpfgH4fQu9xB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:42424 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443AbZDVNdr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 09:33:47 -0400
In-Reply-To: <20090422130612.GB3288@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>


--=-XvaBafj8MpfgH4fQu9xB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-04-22 at 09:06 -0400, John W. Linville wrote:
> On Wed, Apr 22, 2009 at 11:03:33PM +1000, Stephen Rothwell wrote:

> > On Wed, 22 Apr 2009 10:59:06 +0200 Johannes Berg <johannes@sipsolutions=
.net> wrote:
> > >
> > > Fun. Another rfkill problem. It'll get worse -- I have a complete rfk=
ill
> > > rewrite in the pipeline. For this part it's easy, just remove
> > > user_claim_unsupported use from the driver.
> > >=20
> > > Any suggestions on how to handle the other merge problems?
> >=20
> > Well, the best way (and I know this is simplistic and maybe difficult) =
is
> > to introduce the new rewrite alongside the old code and then slowly mov=
e
> > the clients of the API over.
>=20
> Maybe we should put user_claim_unsupported back into struct rfkill
> (and deprecate it) for now?

Sure, we can add the member in the struct back, and just never look at
it since we've removed user claiming anyway.

But that's not the interesting part -- the thing is the rfkill rewrite.
I don't know how to handle that w/o breaking all users. I had hoped to
finish this very soon to be ready early in .31, but I'm still waiting
for Thinkpad and Toshiba conversions (and I forgot who wanted to look at
Toshiba), but if new users are being added in other trees then that's a
problem.

johannes

--=-XvaBafj8MpfgH4fQu9xB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ7xyVAAoJEKVg1VMiehFY6WcP/jU8Bu2xN1P8j3XbyAIIXowF
dzHK7Q2mZqwW7ulCMqDBkUQ2C4ikv0PJU2xGOyStjOvQvSUehdugDbXz96G3lDg6
U1gOrd2hCQlKOBGsYmegs8j6jk4ROrYB47Tz5xfCwfMrNMU6l5GkMVreRzapuORH
XlncRmQPy1A56jewlz2YaELRr7o/PjyvA1OtT6PZ5OJ5Ql8n9vt+kq5egn3ecYM1
hc19UW/yeg/voe7D9gPjfXpzxH7/Wf1YECyODn6Fk5Z9OhIV2LBu01CyjrcioqAX
J6WHga4mnqAIFpCbV4yAL+7VfeI/KMDiF9r7ax+Lt21ADrKjPxn68KJDqSIUl+qy
ux7oWKo+xy/uiyx6mEUwtaBLOjfgF4vsJY2ewZkZFyEjkKKcL75Gh7T7KKh5L3Io
GjYVsbozp/jo/BkSYY4V0JD2+Y1QvvVLdrYYFLek/dD4/reZWO2fsz4NAeVgtYG1
JP9YlF4Z2XKP3NLy8fXKYoHVyhvivWxbZBLFp+jtq9djEzw0onNgrGvWkGUSLDuw
Jleuxmni/a/TeFZgM8Wqm3sC9W0L8cjGq/w9DhRAtUauinCk8BAe+c0SjQDaRIcQ
yjuFlg1PlOS90lQFkjhIOnkahFmC1YF+DLSVs+CM4rxM0MaIqwkF3houw0jRkwfx
veesXczOeWuT0m5OzdPq
=Wibn
-----END PGP SIGNATURE-----

--=-XvaBafj8MpfgH4fQu9xB--
