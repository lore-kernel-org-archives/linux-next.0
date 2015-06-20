From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Sat, 20 Jun 2015 20:48:26 +1000
Message-ID: <20150620204826.010cd35a@canb.auug.org.au>
References: <20150529204002.1cd0cc0a@canb.auug.org.au>
	<20150601185012.093db327@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.j4hmId+zN=Nw94jPVGH9AE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59853 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751891AbbFTKsd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 06:48:33 -0400
In-Reply-To: <20150601185012.093db327@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johnny Kim <johnny.kim@atmel.com>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>

--Sig_/.j4hmId+zN=Nw94jPVGH9AE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 1 Jun 2015 18:50:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 29 May 2015 20:40:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the staging tree, today's linux-next build (x86_64
> > allmodconfig) produced a large number of warnings in
> > drivers/staging/wilc1000.
>=20
> Since there are so many warnings, I have disabled the driver for now.

I tried building this with the driver enabled but it still produces and
inordinate number of warnings, so I have disabled it again.  Please
either get them sorted out or disable this driver before asking Linus
to merge it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/.j4hmId+zN=Nw94jPVGH9AE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhUT/AAoJEMDTa8Ir7ZwVALAP/1dpvu5ARGvHObjVSuoyADvD
izJBzi0MYQ20Rkv6V4okQP8Q8h8ysPxC/LnqJObU4bWE9REzKeUSgICtKurXyG5g
xZI+AOm0tXLvo9ltPEPs3oHED6XESdvq+a97dymzFiHJHBieAo90jTtJkJVCGj4R
HiNwPRGRaG8P/+YTZddGZ9/GyUPYCoqy5CZT3rwjcOw/hU9hL0QhZdTSIMrhpIOu
tC2667+wMVOqKUMrX972LJUb/11neumGjYjb8MTL6AXy8BCRCCG8T9gm+74X5qEP
f0a58uhlILtFU5aBUauCO7GLlun7VctJTHW+dvzQLRFPlmBOH+pHYSj8w2fTU2Zd
omgRyIIQwSBeNMQ5cjRw3+SoMm/6epBcj+5gawsvLrCSyHs4bbxjUQ+DmuW1TXbM
UvVQr22J9ndG+UCSLplgVmigs9kDYEhaz/IxWjx/E0mPGonua38LvHyLlK5l/Lw/
4YcsojGl21Zuv1QFfsr8rePScrJkmiWC7VwBpA+g3unXpd7nVFLaIdYcVzYX6Bd7
R3I6qGkP3ekHzyhwrezGkmyp9jBz7EVwwnsF8SxJF8ZfHf+jeRD5PFOA06kdO5RM
E0eLv68+76A4pZ4b+DBjBQ/2mT3d7ZrAqL7hH1iKKwUfy5D7lABuW81I0MzUntyi
teaUYinjxvYI0Ym33fG+
=pYN3
-----END PGP SIGNATURE-----

--Sig_/.j4hmId+zN=Nw94jPVGH9AE--
