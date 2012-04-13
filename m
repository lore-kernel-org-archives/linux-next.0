From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: boot failures with next-20120411
Date: Fri, 13 Apr 2012 12:57:04 +1000
Message-ID: <20120413125704.58de94f379ad9fca1b16a5b9@canb.auug.org.au>
References: <20120411165835.415e546374a54ea94669b0c6@canb.auug.org.au>
	<16710.1334284211@neuling.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__13_Apr_2012_12_57_04_+1000_ds8L+LXluqS0h3DX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38155 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752568Ab2DMC5N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Apr 2012 22:57:13 -0400
In-Reply-To: <16710.1334284211@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-next@vger.kernel.org

--Signature=_Fri__13_Apr_2012_12_57_04_+1000_ds8L+LXluqS0h3DX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Apr 2012 12:30:11 +1000 Michael Neuling <mikey@neuling.org> wrot=
e:
>
> I managed to bisect this down using pseries_defconfig with next-20120412
> to this patch:
>=20
>   commit 85bbc003b24335e253a392f6a9874103b77abb36
>   Author: Jiri Slaby <jslaby@suse.cz>
>   Date:   Mon Apr 2 13:54:22 2012 +0200
>=20
>       TTY: HVC, use tty from tty_port

Thanks for that, Mikey.

> Reverting this commit (and 0146b6939074ebe14ece3604fd00e7be128a3812
> otherwise git barfs) fixes the problem on next-20120412.

I will revert those commits form linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__13_Apr_2012_12_57_04_+1000_ds8L+LXluqS0h3DX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPh5YAAAoJEECxmPOUX5FE4pkQAJIk34JSpUO7sKbhtfdIgTw0
O42F9Cs0+Fx5i9h4pOKbFm/DE4zLPJ+4YyaWOo1iGBUz2PrIGTRFGdq/PBVDLfJg
ZP5Oo8uVRHqW6QcgzV/4APJXQ5SGyoikrQhMMO+8hujU8TsoXABmUU3HEs71kEjs
sGZ/GCOiVBjjWkrhvT4iPdJRdEqscpjQzxwVSPx65j6FtbLEXNovMVSONArciyr5
aiIH9mdv57Uc7zI9gZfOsrNiETJwyDvV+mVoYIcwMyJxTKtB52YVSOfpyGNERRnG
e30p/JM3YOIXnC141DM8keV+D/hXytGOJjS5GeZg0YMH1XlGI/IfcS+XK6Ce09Y6
Nlj4mFyH+dqWWUgpEeEIvgpkXjvUFdUhl1YXZhGYKdSL9LOFWfXzWC3V5Bkoa/pG
C42KpfB9PECLoDHNC3ZkGAeORSrjgfXZcvSnT6KsP6f2wozjpAQGH6a0g8Z3cd42
4BEB7KOfLiI4zase4+04PgnFYKXvqHvpVM5MfjzJoFdsmvNMB/kQPshegdSyzZqX
Papz8AVQ/GuK+47YNkGzBqsMeV3dJ3tIzNdATRhXQAP98CNN4mb5sB0pDUDBPmCI
PI4kDgDkJ9EegCZo978BidhphKKyCCCB8tac+BjyM2R2k1Okr+4WMbhDhawvjEGi
rJ7LyJQU+lX7kGjw6uuP
=tfx4
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Apr_2012_12_57_04_+1000_ds8L+LXluqS0h3DX--
