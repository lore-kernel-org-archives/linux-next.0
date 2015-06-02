From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Tue, 2 Jun 2015 18:06:36 +1000
Message-ID: <20150602180636.0f89c971@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8.H7bi07=9pzbzic6bB7hM5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44068 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754248AbbFBIGn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 04:06:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bart Van Assche <bart.vanassche@sandisk.com>, Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>

--Sig_/8.H7bi07=9pzbzic6bB7hM5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/usb/gadget/function/f_mass_storage.c:280:12: error: 'MAX_COMMAND_SI=
ZE' undeclared here (not in a function)
  u8   cmnd[MAX_COMMAND_SIZE];
            ^

Caused by commit 0e640c799103 ("Replace MAX_COMMAND_SIZE with BLK_MAX_CDB").

I have used the scsi tree from next-20150601 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/8.H7bi07=9pzbzic6bB7hM5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbWQRAAoJEMDTa8Ir7ZwV8KcP/1yFc2Fp71O/88eEkLa+JsE8
daHXpAPxJtLSiehcmOxECvVVFI2raEQiA4sxF+EeCjn/f3+KsXLNqwSMirhsk4bM
3iZlO0csSuVhcTFeLMJIZSNuPZs1Pmib3F89VDr/Yc7df5Xp1sYU9LYDLzV8sJPp
nFyDDAaExywQQRHvmXypSM0NvtH9MvL5V8xPrkTIEQ2u+XUsOf0GGq3hTkB3rx2N
iQjMnWJtDQX0JnO1nvnk8WWSZZBKQaM0YFGXO3FfTKfFz01t7d5Bwd034YO9dSHb
1lZ3LFZms4M4aSystlclaxczVZ3XszgOMIVbQiGY6TYpRZxziMyFT4t8ezvH3VEY
x98tft2CE00VQTFUksHmUapHCUcLlfvWDYkc6YErEajd/e3V8Fne89lF2kIuj8mM
iS8TU3AIeX7ARadxB9Kw9BZW81Xez3nUBxXNKXda/NTAdby7XqiwWciODt2itjQC
HhsQkVKk021uOwvlEHGcklPYknfvKTvV6AY00B+QIdoqki0R+U8iwtk+x6s4G8R0
OCwQznPRhmK6RXvHU0dz9ULnS4ZCkWs+jI536vMWSI6REfAkpQntT6qocHuotRIV
sFnSejs7jKTIEO8/CCfNRej2QV1f7WKbGRSUi1tE8RjBF/h4gjEyOevoxvRkCZaZ
uBgS5LOqhymLmMj0KvhO
=Ltl2
-----END PGP SIGNATURE-----

--Sig_/8.H7bi07=9pzbzic6bB7hM5--
