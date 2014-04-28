From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Mon, 28 Apr 2014 11:11:10 -0500
Message-ID: <20140428161110.GL30292@saruman.home>
References: <20140428152044.5b5dd87a9e3d885129bb2485@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2OzUYMsT4j3Kc+NU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140428152044.5b5dd87a9e3d885129bb2485@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>
List-Id: linux-next.vger.kernel.org

--2OzUYMsT4j3Kc+NU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 03:20:44PM +1000, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/phy/phy-mv-u3d-usb.c between commit 543cab640279 ("usb: phy:
> mv_u3d: Remove usb phy driver for mv_u3d") from the usb tree and commit
> 041832565e40 ("usb: phy: mv-u3d: switch over to writel/readl") from the
> usb-gadget tree.
>=20
> I fixed it up (the former removes the file, so I did that) and can carry
> the fix as necessary (no action is required).

I actually rejected that patch as you can see from the archives:

http://marc.info/?l=3Dlinux-usb&m=3D139758276329167&w=3D2

I said that it doesn't break anything and can even build in any
architecture if we switch over to writel/readl instead of _relaxed
versions which are only available on ARM (afaict).

Greg, looks like this commit went in your tree by mistake.

cheers

--=20
balbi

--2OzUYMsT4j3Kc+NU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTXn2eAAoJEIaOsuA1yqREHTcP/0RlnxVSdIG7aG8yLfvzk5h/
unw2ID5GYMF9kq/ctOFWOo1qtW/bwltlHyS1g4nI847Ck4+oE+WcWbU+n/y1KAoc
5TrWgXJlPEm7uyGnc4LRP4g3n9qDHa/AZ9dmF16enNJMqqTLAVk/itm+c7wP1TmQ
hqbybjinTzLgCe5LqTvMoEpjtQF6T7i5/XcUD7r8P2zQJoh7yRdm3tiE0zl0fyip
4FrtSlEAIhmCxI4228FKouuem62XoF59zWYNlWLcSwDrHzMmshOh3y+KQf34BmmQ
ZEWKzk2WzDdUBUiTALXmG4b7UoHLxx6AfzvNEgvbtw/g0K7vkuVY/xl5nIOcMacH
jC8VJdiradgu5/IxYRtzRNyi++nkjFDt87fufTm/oe3fll+4vM0dSWIeYwB5yurX
p10w4p/CbyjC1gR2sUq6OisbvDoK0fYNKhdLxr/r/2f4B1yDC9U/wtKY3I1M3E94
ZT9BpS1mdvVpV6fz3kz51eyY++l0Gznbr4+bXgwqGsQszSbBntfBzFEfvpCrzn6W
XUb8AHvirtbA9/lRLt+BLAGDGJP6FsPlferbGQUW4ArLwyAMMEYVV/aB1PqVamf5
q592+IITGlrtu6Y1MQtgb2eRl/NfAPBzlsXuJNsZesVlwXKTG7/ks5NxnjyP6yO1
mtJauCwUy01jYvmkG/H+
=vX5H
-----END PGP SIGNATURE-----

--2OzUYMsT4j3Kc+NU--
