From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: linux-next: build failure after merge of the final tree (pwm
 tree related)
Date: Sun, 1 Jul 2012 08:56:39 +0200
Message-ID: <20120701065639.GA25470@avionic-0098.adnet.avionic-design.de>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au>
 <201206301920.21158.arnd.bergmann@linaro.org>
 <20120630194139.GA24300@avionic-0098.mockup.avionic-design.de>
 <201206302012.32476.arnd.bergmann@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:62011 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751588Ab2GAG4u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Jul 2012 02:56:50 -0400
Content-Disposition: inline
In-Reply-To: <201206302012.32476.arnd.bergmann@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd.bergmann@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 30, 2012 at 08:12:32PM +0000, Arnd Bergmann wrote:
> On Saturday 30 June 2012, Thierry Reding wrote:
> > > I think that all the drivers that are not converted to the common PWM
> > > layer yet should depend on not enabling the common code. Once they
> > > are all moved over, that dependency will go away.
> >=20
> > Right. That's exactly what I meant. If we add depends on !HAVE_PWM to
> > the PWM symbol that should result in both options conflicting, and
> > therefore not being built at the same time.
>=20
> But I would add it to all other ones then, not the generic one!

But if we make the new PWM symbol conflict with HAVE_PWM, then it'll do
the right thing for any of the legacy PWM implementations, without
having to track them down. Furthermore it'll also keep the legacy
version by default and not allow the generic one to be enabled in that
case. This is more likely to cause less side-effects than the other way
around.

> One question though: if the generic pwm implementation does not set
> HAVE_PWM, how can a driver check its presence?

The driver depends on PWM. HAVE_PWM is the symbol for the legacy
implementations, while PWM is the new PWM API symbol.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP7/SnAAoJEN0jrNd/PrOhUT0P/2izcyoeswldajPfSpUbGbvR
2yPKgbqmwxjwpUUk46GuPQZjAmLKA6bSXLrevNVroZSAI1d1SmZzH/55wIzDj7Ia
iFnlHKYQis4iYQVYe3JluoxIeZjWeIe8RH2plXrSoBmzM06VgrGQsDjyKhQhwfqb
tVV4pzKDKQ4GkwAcasPzg4kmLQDCsdYFiK4At3fG8EqzfIkDaJGPG3L5SmgKTyaR
U5ue4qyGzVJHHA0dwwhnZsQz4mIGdirEp1X8X0rxCv6gwaUuR1cbfoCDOGJXNnmE
bcoj2LvQgU7KHE84b5G/3oGYAoToz4Pb44RpnnOPGs1ttIWRof4ifa2sz6c8AT8s
1uFS9sN+B/+ejJ8YEln25bjEyZdY9N6PVTgtUTPutInt3y6zl/a8lYoGoijF62MH
bYgs/a8Zos1Jc5+eaUx5VNqLrYgL/v15PL/R2hTOlNJDHxMEpxHSgKtK8t1XYvgr
hL9/TUMRdPKvZzpzsaSCE6Kq1XS6H8jMrTr9Mjbslg0zoEC+U8/zP8eFnH+HI2ns
b5zSn8qRPwL92UUxy64WnWnl0PMCJAxOEsgMTlbPq7OC1ObFeCvEt1opDZfdZHqf
VFdpVc7L2zW7/CStKOzQbKLbfuWUqCOK8UEU8TUGjf6aPtW2VJ5zCM1MfkeSFz4x
XdQR8XYWWjJyFADkfkvA
=FNTr
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
