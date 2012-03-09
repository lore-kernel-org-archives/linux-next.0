From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: toolchain version for mips builds, esp. cavium
Date: Sat, 10 Mar 2012 09:38:00 +1100
Message-ID: <20120310093800.de6112c535519c0e53109ff7@canb.auug.org.au>
References: <CAP=VYLpk9RonUUWmnC2-7wPi7Oqra_y7K4qQNLfMYqNKMo8QMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__10_Mar_2012_09_38_00_+1100_p=y09dqIApq4Jd9E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42292 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030266Ab2CIWiP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 17:38:15 -0500
In-Reply-To: <CAP=VYLpk9RonUUWmnC2-7wPi7Oqra_y7K4qQNLfMYqNKMo8QMg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: david.daney@cavium.com, ralf@linux-mips.org, linux-next@vger.kernel.org, tony@bakeyournoodle.com

--Signature=_Sat__10_Mar_2012_09_38_00_+1100_p=y09dqIApq4Jd9E
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 9 Mar 2012 17:01:07 -0500 Paul Gortmaker <paul.gortmaker@windriver.=
com> wrote:
>
> The linux-next builds for cavium defconfig have been failing for
> quite some time now, since it tries to use gcc-4.2 and the option
> for the octeon didn't appear until gcc-4.4 ("-march=3Docteon")

Thanks for working that out.

> What is the process for getting a different toolchain building the
> cavium in linux-next?

We are actually in the process of replacing all our toolchains with newer
ones, but it just takes a bit of time between our "real" work.  (The
tricky part is that the current kisskb build server is PowerPC based.)
Hopefully we will have this sorted out soon.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Sat__10_Mar_2012_09_38_00_+1100_p=y09dqIApq4Jd9E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPWoZIAAoJEECxmPOUX5FEnjIP+wevk9CJpN9phEDL6kLuhwjP
rK2fhhwljo/M4ynBgXyVuRxG5hddsPfmgDkvGfhEeGmqx+xAkvQil62XdaNbi1p3
HNc+q3ddnsmR/sINMpax9zYk8YQU4ZMsJWfOaf8dBUiUQj91z7lKGE1Gq8g827n6
lncpFJy3XSL9CZ9HLIoTmaqRdd8UirwI+ozzwjvO2kCaKo8jAI8iVQzDILuBtmMZ
0ekGYu9fjajn2L/boif2cz5k4FeJq/O1T4FlTrr96S49GIRaRutpKgOLtLzXfmtH
XaSd6ZG72oCReVzmsFuoldUZhI+vlzpjX5I6g1BRQbsgbt5RkdCLzaDuKNKqEAYU
eGp10968WQtGXgAbSAuqn38Dwnaap42G3FCoC5Vqd6cJiafYYbiAH0GAvDkcqVt8
vUIlC1py8hGY0vVmg/mK4A7jZxsDaZvHze9MA6NwSukb+0k6Wus0UsqWlGQ9M4mg
HjXj4ioCOjamAABclrgq22RkHhUtDF0Qeufc2phi/XzMlvnawVZKR1cCuBbuJ5Hw
zpYjMALmVJ1oZK6balkMk36ZleFaJo+4xMSPDZT2EEMOg1dX1AcU7fvGESXRO/ao
I/36ofVknnPihpAJuoXjP+BYxZfzE+mzdy5P48i6ZX1QJ2UY93wUkQGGE2adnmBy
567ZG4ma9U66bEr6Fq3q
=ulqF
-----END PGP SIGNATURE-----

--Signature=_Sat__10_Mar_2012_09_38_00_+1100_p=y09dqIApq4Jd9E--
