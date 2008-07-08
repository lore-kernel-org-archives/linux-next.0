From: Pierre Ossman <drzeus@drzeus.cx>
Subject: Re: linux-next: hdlc tree build failure
Date: Tue, 8 Jul 2008 11:28:00 +0200
Message-ID: <20080708112800.61b083d7@mjolnir.drzeus.cx>
References: <20080708183700.44465c76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=PGP-SHA1; boundary="=_freyr.drzeus.cx-20819-1215509286-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.drzeus.cx ([85.8.24.28]:53767 "EHLO smtp.drzeus.cx"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751049AbYGHJ2I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 05:28:08 -0400
In-Reply-To: <20080708183700.44465c76.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.drzeus.cx-20819-1215509286-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2008 18:37:00 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Pierre,
>=20
> Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> drivers/mmc/host/sdhci.c: In function 'sdhci_adma_table_pre':
> drivers/mmc/host/sdhci.c:363: error: 'bad_dma_address' undeclared (first =
use in this function)
>=20
> Caused by commit b13668f718fa98b07b4ea23417fa495ccd922eca ("sdhci:
> graceful handling of bad addresses") which added references to
> bad_dma_address which only exists in x86.
>=20

Odd.. it seems only x86 defines that value. Looking further, it seems
x86 is the only platform that checks that the address is reachable by
the device (hence the need for an error value), all others will gladly
let the device corrupt your system memory.

I'm not sure what to do here... ifdef the entire thing with ARCH_X86?
Or just remove the error checking and let things break creatively on
x86 as it would on other systems?

Rgds
--=20
     -- Pierre Ossman

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.drzeus.cx-20819-1215509286-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkhzMyUACgkQ7b8eESbyJLgwwQCgg1AsHpVMuYt5NaO1CBbcOBPy
h6cAoO5vSR2qiCn7INOLGkxe2ureKLfV
=32qD
-----END PGP SIGNATURE-----

--=_freyr.drzeus.cx-20819-1215509286-0001-2--
