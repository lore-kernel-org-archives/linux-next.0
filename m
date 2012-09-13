From: David Fries <david@fries.net>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Thu, 13 Sep 2012 08:24:08 -0500
Message-ID: <20120913132408.GZ2608@spacedout.fries.net>
References: <20120913181127.862265ddb9a08758ada8405c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120913181127.862265ddb9a08758ada8405c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 06:11:27PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
>=20
> drivers/built-in.o: In function `rtc_hctosys':
> hctosys.c:(.init.text+0x4a98): undefined reference to `rtc_hctosys_ret'
> hctosys.c:(.init.text+0x4b54): undefined reference to `rtc_hctosys_ret'
> hctosys.c:(.init.text+0x4b58): undefined reference to `rtc_hctosys_ret'

Can you post your .config?  `grep RTC .config`
It would seem to me that drivers/rtc/hctosys.c is being compiled
without drivers/rtc/class.c which now holds the global variable, but
Kconfig says that RTC_HCTOSYS 'depends on RTC_CLASS =3D y'.

config RTC_HCTOSYS
	depends on RTC_HCTOSYS_DEVICE
Or, how do you depend on a string value being set?

config RTC_HCTOSYS_DEVICE
	depends on RTC_CLASS =3D y

> Caused by commit "rtc_sysfs_show_hctosys(): display 0 if resume failed"
> from the akpm tree.  rtc_hctosys_ret was moved into class.c but protected
> by defined(CONFIG_PM) && defined(CONFIG_RTC_HCTOSYS_DEVICE) and this
> build does not have CONFIG_PM set.
>=20
> I have reverted that commit for today.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



--=20
David Fries <david@fries.net>    PGP pub CB1EE8F0
http://fries.net/~david/

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlBR3ngACgkQAI852cse6PDhnwCbBRE0QYTW4kr3DJEhw8j1FwF/
Z7YAnRcylke7OfUIszO4pc22gY7d1CvJ
=anMY
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
