From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: Kernel panic on 2.6.27-rc6-next-20080919
Date: Wed, 8 Oct 2008 09:03:31 +0200
Message-ID: <20081008070331.GA11954@denkbrett.schottelius.org>
References: <20081005104224.GA4588@denkbrett.schottelius.org> <20081006084914.d4481ea1.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:48043 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753314AbYJHHNy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Oct 2008 03:13:54 -0400
Content-Disposition: inline
In-Reply-To: <20081006084914.d4481ea1.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, Kevin Lloyd <klloyd@sierrawireless.com>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Randy!

Randy Dunlap [Mon, Oct 06, 2008 at 08:49:14AM -0700]:
> On Sun, 5 Oct 2008 12:42:24 +0200 Nico -telmich- Schottelius wrote:
>=20
> > Hello!
> >=20
> > I'm on the Lenovo X200 notebook. Compiled next with the attached
> > configuration. When accessing ttyUSB2 using wvdialconf, the system
> > ends up in a kernel panic.
>=20
> Hi,
> Can you provide any panic messages or register/stack dump or
> a digital photo of the screen (if it's useful info)?

Sorry, there is no debugging output available, it just freezes.

But I can confirm it working with 2.6.27-rc6-denkbrett-00099-g45e9c0d
(Linus' tree).

Hope that helps a bit

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjsW0MACgkQuL75KpiFGIy8qQCfT4/LRZPMibs0h0Dm6ynSEGvs
So0AoObevOqHSXt0t7L3unLFz2bM82bh
=M8C2
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
