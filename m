From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: linux-next: manual merge of the mmc tree
Date: Mon, 7 Jul 2008 22:23:13 +0200
Message-ID: <20080707222313.38303823@mjolnir.drzeus.cx>
References: <20080708010217.02e927bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=PGP-SHA1; boundary="=_freyr.drzeus.cx-13538-1215462199-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.drzeus.cx ([85.8.24.28]:35384 "EHLO smtp.drzeus.cx"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753902AbYGGUXV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 16:23:21 -0400
In-Reply-To: <20080708010217.02e927bd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andres Salomon <dilinger@queued.net>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.drzeus.cx-13538-1215462199-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2008 01:02:17 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Pierre,
>=20
> Today's linux-next merge of the mmc tree got a conflict in
> drivers/mmc/host/sdhci.c between commits
> e08c1694d9e2138204f2b79b73f0f159074ce2f5 ("olpc: sdhci: add quirk for the
> Marvell CaFe's vdd/powerup issue") and
> 603ded16a308d0a7a17738c973e3c8cbcd5db7dd ("olpc: sdhci: add quirk for the
> Marvell CaFe's interrupt timeout") from Linus' tree and various similar
> commits from the mmc tree including one that moves the code into separate
> files.

I've done a new update that should sort out the mess.

Rgds
--=20
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.drzeus.cx-13538-1215462199-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkhyezcACgkQ7b8eESbyJLhhowCeMqsQlxMYtrLIHhUwVCO7K8Eo
q80An3efQw3/c9L/+RLFK+Gyc9A40xFo
=L3p6
-----END PGP SIGNATURE-----

--=_freyr.drzeus.cx-13538-1215462199-0001-2--
