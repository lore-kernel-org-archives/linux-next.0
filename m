From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: linux-next: mmc tree build warning
Date: Fri, 5 Jun 2009 07:18:06 +0200
Message-ID: <20090605071806.3e154577@mjolnir.ossman.eu>
References: <20090605113707.0f87467f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1; protocol="application/pgp-signature"; boundary="=_freyr.ossman.eu-17852-1244179091-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 82-117-125-11.tcdsl.calypso.net ([82.117.125.11]:36607 "EHLO
	smtp.ossman.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754919AbZFEFSL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 01:18:11 -0400
In-Reply-To: <20090605113707.0f87467f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,  =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.ossman.eu-17852-1244179091-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jun 2009 11:37:07 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Pierre,
>=20
> Today's linux-next build (x86_64 allmodconfig) produced this warnings:
>=20

Thanks, they were already spotted elsewhere. Patches to fix these
warnings are on their way.

Rgds
--=20
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org
  TigerVNC, core developer          http://www.tigervnc.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.ossman.eu-17852-1244179091-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkooqpIACgkQ7b8eESbyJLhdfACfacjefw6Fi0QJ96I2vXTi3wza
TyEAnjMj9BoHRVEKSRKQWZUtPv5FiF4+
=pNK4
-----END PGP SIGNATURE-----

--=_freyr.ossman.eu-17852-1244179091-0001-2--
