From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the hid tree
Date: Wed, 27 Aug 2008 13:10:17 +1000
Message-ID: <20080827131017.6b6264a3.sfr@canb.auug.org.au>
References: <20080825144633.393096b5.sfr@canb.auug.org.au>
	<20080825155056.GA17926@anvil.corenet.prv>
	<20080826094054.041d8d1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Aug_2008_13_10_17_+1000_I+53EOFoFZtweJhL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40679 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752301AbYH0DKd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 23:10:33 -0400
In-Reply-To: <20080826094054.041d8d1d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>, Jiri Slaby <jirislaby@gmail.com>

--Signature=_Wed__27_Aug_2008_13_10_17_+1000_I+53EOFoFZtweJhL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry, Jiri,

On Tue, 26 Aug 2008 09:40:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 25 Aug 2008 11:50:56 -0400 Dmitry Torokhov <dmitry.torokhov@gmail=
.com> wrote:
> >
> > I wonder what we should do in such case... are you going to use rerere
> > till we resync with Linus?
>=20
> Yes, that is what happens (unless something dramatic changes :-)).

OK, so this has come up again today (the conflict has changed and rerere
doesn't cope with that).  Could you please either merge with 2.6.27-rc4
or cherrypick commit f89bd95c5c946776f116ffeb997653d4193d6a35 ("Input:
bcm5974 - add driver for Macbook Air and Pro Penryn touchpads") (or merge
Linus' tree at the commit) into the hid tree (and fix the conflict),
please?  This is likely to be a real ongoing pain if this file
(drivers/hid/usbhid/hid-quirks.c) keeps being modified in more and more
patches.

I fixed it up again for today (used the version of
drivers/hid/usbhid/hid-quirks.c from the id tree and applied the same
patch as before).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Aug_2008_13_10_17_+1000_I+53EOFoFZtweJhL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki0xZkACgkQjjKRsyhoI8zkiACeJ+Hw+8gJbyXbQSB8NjoYqDvz
Pz0An2AWiyKNmre9Vo5CSbb46OrB3bwt
=xauL
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Aug_2008_13_10_17_+1000_I+53EOFoFZtweJhL--
