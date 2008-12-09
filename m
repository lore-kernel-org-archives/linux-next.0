From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: linux-next: mmc tree build failure
Date: Tue, 9 Dec 2008 07:47:51 +0100
Message-ID: <20081209074751.3967406b@mjolnir.drzeus.cx>
References: <20081204152829.69a795a3.sfr@canb.auug.org.au>
	<20081209144244.fc3ebaa0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=PGP-SHA1; boundary="=_freyr.drzeus.cx-27201-1228805277-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.drzeus.cx ([85.8.24.28]:48197 "EHLO smtp.drzeus.cx"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751930AbYLIGsB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 01:48:01 -0500
In-Reply-To: <20081209144244.fc3ebaa0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>, Philip Langdale <philipl@overt.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.drzeus.cx-27201-1228805277-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Dec 2008 14:42:44 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Pierre,
>=20
> On Thu, 4 Dec 2008 15:28:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >=20
> > Due to commit 75766a3cee0a1eb2f373e8112a73e69262e7831a ("ricoh_mmc: Use
> > suspend/resume_noirq") clashing with commit
> > 6e674b2ed59695a90166d9500aa2696a495696e7 ("PM: Simplify the new
> > suspend/hibernation framework for devices") from the driver-core tree.
> >=20
> > I am not sure what to do with this, so I have reverted the mmc tree
> > commit above for today.  Hopefully, Rafael can suggest a fix.
>=20
> Since I am still getting this error, I have dropped the mmc tree for
> today.

Sorry about that. I got side-tracked and forgot to push the fixed tree.
It should be up now.

Rgds
--=20
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.drzeus.cx-27201-1228805277-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkk+FJwACgkQ7b8eESbyJLgumgCgjIXU/alkhzSnTG7U3cUblcVS
LsMAoMjxoFt7n9lnNi6uqAuTDqxiE7PI
=m4wp
-----END PGP SIGNATURE-----

--=_freyr.drzeus.cx-27201-1228805277-0001-2--
