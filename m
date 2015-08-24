From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 24 Aug 2015 11:21:48 +0200
Message-ID: <20150824092148.GI2413@lukather>
References: <20150806122203.64e25587@canb.auug.org.au>
 <20150806030027.GS11789@localhost>
 <20150824065358.GC2413@lukather>
 <20150824081143.GG13546@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fKov5AqTsvseSZ0Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150824081143.GG13546@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: linux-next.vger.kernel.org


--fKov5AqTsvseSZ0Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 01:41:43PM +0530, Vinod Koul wrote:
> On Mon, Aug 24, 2015 at 08:53:59AM +0200, Maxime Ripard wrote:
> > > I am dropping this commit now, it need to be fixed to take into accou=
nt
> > > Cyrille work on remove tx_width and this patch should be updated to r=
eflect
> > > that
> >=20
> > I'll send an updated version today, is there some time left for this
> > to be part of 4.3?
>=20
> Fortunately for you, Linus released rc8, so yes if you are quick we can s=
till
> merge this

I just fixed the issue, tested it, and sent a new version.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--fKov5AqTsvseSZ0Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV2uIsAAoJEBx+YmzsjxAgzLEQAInsWm0z6ROjRi9YfBGiw3RJ
U6nHWP7A8CoQ7R7l06o+SpPMWsgkyqA5iFARDgxaeqEyXxgF2hHSYn59F/6rWOab
aYYkEEBQJz8YfX39bkkoXWxKXOuon25ApWjXWJKjXnx1mZAcqEqLbw7jcvelYoqS
JBDa9O42UmENKvF5FObIg0QuvA4z9c+sPlFEAz8+3CbkLlK5kuf2e7T0pryZONXR
4GNEii0GnK4RKgP4ZEwIh2ycYsljXRIi1aYmsQY1HRQmBpKqzbZX38tPM6Dj34SR
cOLBZXBQZHdqFCd/BK5V9tg+vsY15+FziFoq2adbfdlt22OPMIvFDhyYRXfNmUEW
DztztjFZs6lfma67nWPfK3fL1QvNg4ZtV4tqD+lqiJm6hHjc+sYNxiZSfPKPXPCr
Mon/ulSO3Y/e/uSaa9ujiG65mHOzJH9bZzCb3+4C+WGDu7CbJYojkxEFSN3IwMiw
ISHzW8Q6EM13Te4z/MMM/FIeYuTRX/twm9hPxH35bKiYR7BRAXyV/P9AxksA/95k
B2kIg9Ib0ApMVkmr6zn9zKvp8z6zrDTZpB2oOZKXrPvIhVXtdvn/w0wrLCToMk6G
zRkg4rASwk/j/q91rOT9w1SHRv0bbYaSiiv4yQu/Ol9JFLwCJs76CSB/89VJh6y0
oOPWysMQF4wXV3MTuYhE
=F8om
-----END PGP SIGNATURE-----

--fKov5AqTsvseSZ0Z--
