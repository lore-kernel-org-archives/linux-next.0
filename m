From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Mon, 22 Dec 2008 13:42:21 +1100
Message-ID: <20081222134221.6961bcf6.sfr@canb.auug.org.au>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au>
	<20081222013110.GA28196@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Dec_2008_13_42_21_+1100_MtEXNg8G9FUh6_A9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42598 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751946AbYLVCm3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 21:42:29 -0500
In-Reply-To: <20081222013110.GA28196@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Mon__22_Dec_2008_13_42_21_+1100_MtEXNg8G9FUh6_A9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(Just cc'ing Sam)

On Sun, 21 Dec 2008 17:31:10 -0800 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Dec 22, 2008 at 11:33:35AM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> >=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such fi=
le or directory
> >=20
> > I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
> > Makefile, Kconfig and docbook linkage for the stack") just to make the
> > build work.
>=20
> Inaky, any ideas?  This really looks like a build system error that I
> ran into with the staging tree in the past.  I had to add a "dummy" file
> to the empty directory to get it to build properly.
>=20
> I tried to duplicate the problem with a sample patch, but never could :(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Dec_2008_13_42_21_+1100_MtEXNg8G9FUh6_A9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklO/o0ACgkQjjKRsyhoI8z+fACgiQte+6Cujl+ke4LuTGdoytiE
eLUAoIjwqxYEJvJXtkfQeDA3wTaqSfZK
=6fWc
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Dec_2008_13_42_21_+1100_MtEXNg8G9FUh6_A9--
