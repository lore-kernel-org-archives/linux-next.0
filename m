From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i2c tree build failure
Date: Mon, 31 Aug 2009 21:03:35 +1000
Message-ID: <20090831210335.f382d7ff.sfr@canb.auug.org.au>
References: <20090831111935.5059565b.sfr@canb.auug.org.au>
	<20090831120449.3f64aa74@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__31_Aug_2009_21_03_35_+1000_RcQB6i5xSyG2.A4V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51926 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751244AbZHaLDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2009 07:03:39 -0400
In-Reply-To: <20090831120449.3f64aa74@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Mon__31_Aug_2009_21_03_35_+1000_RcQB6i5xSyG2.A4V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Mon, 31 Aug 2009 12:04:49 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>=20
> These are caused by the fact that I moved the patch adding
> class_compat_create_link() and friends out of the NEXT_PATCHES section.
> I did so because Greg KH (Cc'd) added this patch to his driver-core
> patch set, which I thought was part of linux-next. I simply didn't want
> to apply the same patch twice.

It doesn't really matter if the same patch appears twice - git usually
copes quite well.  Also I can tell and I (usually) don't bother
commenting on it.

> To clarify the dependency, I added the following to my series.conf:
>=20
> # NEXT_BASE driver-core.current
>=20
> but apparently it didn't work as intended.
>=20
> Greg, please clarify whether the patch in question
> (driver-core-add-support-for-compatibility-classes.patch) is pushed to
> linux-next or not.
>=20
> Stephen, if my dependency tag is not correct, please tell me how to fix
> it.

It was fine, except that Greg has that patch in the driver-core series
(not driver-core.current).  It you decide to leave that patch out and
change the dependency, please let me know as I will then have to merge
your tree after Greg's (it is currently earlier.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__31_Aug_2009_21_03_35_+1000_RcQB6i5xSyG2.A4V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqbrgcACgkQjjKRsyhoI8yOcQCeLEOOMNoZi91AvVn/7sU7s1Yh
aMwAniC3UC5hqm3I/U2X7LNisRO/KVhN
=3NL+
-----END PGP SIGNATURE-----

--Signature=_Mon__31_Aug_2009_21_03_35_+1000_RcQB6i5xSyG2.A4V--
