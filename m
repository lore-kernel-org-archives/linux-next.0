From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Tue, 12 May 2015 13:35:18 +1000
Message-ID: <20150512133518.2c63a00c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3kcNFXGJZbX3ZWVQOzD2clH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52992 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752169AbbELDfY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2015 23:35:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/3kcNFXGJZbX3ZWVQOzD2clH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/drivers/pcsp/pcsp.c: In function 'snd_pcsp_create':
sound/drivers/pcsp/pcsp.c:51:5: warning: format '%li' expects argument of t=
ype 'long int', but argument 2 has type 'unsigned int' [-Wformat=3D]
     "(%linS)\n", resolution);
     ^

Introduced by commit 447fbbdc2cd5 ("sound: Use hrtimer_resolution
instead of hrtimer_get_res()").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/3kcNFXGJZbX3ZWVQOzD2clH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUXT7AAoJEMDTa8Ir7ZwVbaoP/jyqIusWRtxzjdBPc66viOqO
RU6HqU7/PkJBggV6f/tmcUQFxbmFymYnKrpByO2HH0CMxAQ0pyo+MZ9YCOl9M4OL
M62K5Hee6y0ok4kwLK4DRiKpvI2dgJnFLZGYDyHy5Iw3gpJqOLasM4CjA0FtWL7D
BIIzmvHmhieySmPbzIFGVdT/x2xkPzi4+car6e1ioi83/d32hIjhc9VYlJXu3zyF
uIrRwEvoHCV9x82ymt8KPIPf53WIpWj6LhmtNBEO8O64mfUs0CYkiGAwYtMtNF9s
4aUI6NdvaeymD0rAikiCpgQ+AkeFsTEPFvuxIu5P/UeYQwdaHRuFFhDrZ09rDfQe
eNCPFm+S57DjZbPMAvwfG0C7vpSyqbzJ9vHs08eGK7GBF3U2bKVvQk6BhOX14wI8
5dDW9acBSElf8krAI1R9gJsNrokysG9oDCkIqu4o1F5K3dmH0E3URHibmyFnkTPa
Is+0WyrZk9vH0Lc2wH800kXiEM7QSofy7OKxYdvb1WtHaslE0Ga49F/44DIsZNDd
BScBYg8tiejwjgq14SjYy3DPc8r3hickV3ho1ZmzPeawAMih+r8XFrnnQGIHU9rQ
cBbJptTC/83NogfjFb/fEIhNb/y3eyhK4Of8Z2iuIQ41jLx1C+qtLMivNYLIkGvY
F0nKwdvs+ZLee5FxxI/b
=UKaX
-----END PGP SIGNATURE-----

--Sig_/3kcNFXGJZbX3ZWVQOzD2clH--
