From: Pierre Ossman <drzeus@drzeus.cx>
Subject: Re: linux-next: hdlc tree build failure
Date: Tue, 8 Jul 2008 11:30:47 +0200
Message-ID: <20080708113047.2c37862d@mjolnir.drzeus.cx>
References: <20080708183700.44465c76.sfr@canb.auug.org.au>
	<20080708112800.61b083d7@mjolnir.drzeus.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=PGP-SHA1; boundary="=_freyr.drzeus.cx-20839-1215509452-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.drzeus.cx ([85.8.24.28]:56131 "EHLO smtp.drzeus.cx"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753781AbYGHJay (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 05:30:54 -0400
In-Reply-To: <20080708112800.61b083d7@mjolnir.drzeus.cx>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus@drzeus.cx>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.drzeus.cx-20839-1215509452-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2008 11:28:00 +0200
Pierre Ossman <drzeus@drzeus.cx> wrote:

>=20
> I'm not sure what to do here... ifdef the entire thing with ARCH_X86?
> Or just remove the error checking and let things break creatively on
> x86 as it would on other systems?
>=20

Calling dma_mapping_error() seems to be the correct approach instead
of directly checking the return value. That should at least compile for
all systems. I'll update my tree.

Rgds
--=20
     -- Pierre Ossman

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.drzeus.cx-20839-1215509452-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkhzM8sACgkQ7b8eESbyJLgBTgCg6tdasvoJPhJxy7OHFFFKM/69
xwUAnAhR6npwU4zlS6wg/dQF6SpsiRZb
=jyXi
-----END PGP SIGNATURE-----

--=_freyr.drzeus.cx-20839-1215509452-0001-2--
