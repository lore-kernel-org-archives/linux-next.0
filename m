From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Mon, 1 Jun 2015 18:50:12 +1000
Message-ID: <20150601185012.093db327@canb.auug.org.au>
References: <20150529204002.1cd0cc0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M60hMxwMSRT2hJxI.Fq.6KH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38901 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751371AbbFAIuT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 04:50:19 -0400
In-Reply-To: <20150529204002.1cd0cc0a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johnny Kim <johnny.kim@atmel.com>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>

--Sig_/M60hMxwMSRT2hJxI.Fq.6KH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, 29 May 2015 20:40:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced a large number of warnings in
> drivers/staging/wilc1000.

Since there are so many warnings, I have disabled the driver for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/M60hMxwMSRT2hJxI.Fq.6KH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbBzJAAoJEMDTa8Ir7ZwVKO4P/1Gs/+8TanASVNTBZnWAehha
AB5ItQkCx4aiDe2JF2nLq3k/TZPVn+ABTM+z+RS48nkQMQ7pX8tAWfDwcu/855+0
B4dq5pRGlw0SV1i5zrl9sRpW8U7EgRol1FTKQ4g8azYczVL0WF6yFkk+wFyesqr+
9qRWieqMhvvh/VSIkT+muqj6d1JoxGAEEeu/jI+R5jsy+5noDHun5sYrrljXnVHX
/uPtzDmK6DdyPDEUtobsdBJpBwIhZJYHzcTEs0w6GOXelthU7w6Y9W7Q4POvD+b2
lvRiaTB8L8zuWreNXnEkYp4OvZQ2doeC0pgb6g4sybMPNJ+3z0bCRjKxRzRZJMSE
6Bh0B5/X2Jrh9QzevtqMhvBx9H+C2O1iKzLslUxvog6PJvxhp6XBLDPH5f8eWmCY
tm+HjuEGFs5PRJYMJ+W9LXg8gtVMR7YAYr6QTLWYxIwvEMVCfnTBKmDNwfg7ojSl
LXj0CRaabYgQslA2+KAOC9wir24CtYPHqqwTDTwIN8HQFjIsSeNFH630OD3RW4l5
rt2zWUsqFQXDxTTCe0r1/yOmqZ5v4aC6GRfqfmbSqC8nfqpioLXEP0tcappLXpPs
WRV17e8qRs++/uJcmCS2hhmQ0Rz40Kk90Q8eV4st03soexjtBDQRlTAaTmvhduzR
tJgxwPpm8PyO+dSkCiQg
=Bji0
-----END PGP SIGNATURE-----

--Sig_/M60hMxwMSRT2hJxI.Fq.6KH--
