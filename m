From: Luotao Fu <l.fu@pengutronix.de>
Subject: Re: Problem with tty changes in linux-next
Date: Tue, 6 Jul 2010 17:48:12 +0200
Message-ID: <20100706154812.GA2813@pengutronix.de>
References: <20100706130403.GD3991@pengutronix.de> <201007061623.48363.arnd@arndb.de> <20100706151454.GB12444@suse.de> <201007061735.02881.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201007061735.02881.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <gregkh@suse.de>, Luotao Fu <l.fu@pengutronix.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>, Ilya Dryomov <idryomov@gmail.com>
List-Id: linux-next.vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 06, 2010 at 05:35:02PM +0200, Arnd Bergmann wrote:
> On Tuesday 06 July 2010 17:14:54 Greg KH wrote:
> > I should get to this today and push it into the next
> > linux-next release.
>=20
> Ok, thanks!
>=20
> On Tuesday 06 July 2010 16:40:52 Ilya Dryomov wrote:
> > I had the same issue. Here is the patch:
> >=20
> > https://patchwork.kernel.org/patch/108700/
>=20
> Yes, that's the one. It would be good to get another confirmation
> from Luotao Fu that this fixes all the problems with missing characters.
> As I mentioned, the boot-time warning will get taken care of by
> a different patch, but can be safely ignored.

I picked up the patch and did a quick test. The console message printing
works so far.

Thanks

Cheers
Luotao Fu
--=20
Pengutronix e.K.                           | Dipl.-Ing. Luotao Fu        |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkwzUDwACgkQkLuxfMCkDTaFjgCfcx9Rk6p6EnFeDJTWs7San2nn
C78AnRax1sF2ZJVL9sRQMKDeRPGZi9Ic
=VE+y
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
