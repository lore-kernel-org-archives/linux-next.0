From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 30 Apr 2015 12:05:34 +1000
Message-ID: <20150430120534.366bed94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MuI8kYWnaz+J=AJpYmCkfB5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52877 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751206AbbD3CFk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2015 22:05:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bard Liao <bardliao@realtek.com>

--Sig_/MuI8kYWnaz+J=AJpYmCkfB5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

sound/soc/codecs/rt5645.c: In function 'rt5645_set_jack_detect':
sound/soc/codecs/rt5645.c:2555:2: error: implicit declaration of function '=
rt5645_irq_detection' [-Werror=3Dimplicit-function-declaration]
  rt5645_irq_detection(rt5645);
  ^
sound/soc/codecs/rt5645.c: At top level:
sound/soc/codecs/rt5645.c:2591:12: error: static declaration of 'rt5645_irq=
_detection' follows non-static declaration
 static int rt5645_irq_detection(struct rt5645_priv *rt5645)
            ^
sound/soc/codecs/rt5645.c:2555:2: note: previous implicit declaration of 'r=
t5645_irq_detection' was here
  rt5645_irq_detection(rt5645);
  ^
sound/soc/codecs/rt5645.c:2591:12: warning: 'rt5645_irq_detection' defined =
but not used [-Wunused-function]
 static int rt5645_irq_detection(struct rt5645_priv *rt5645)
            ^

Caused by commit 6e747d5311fc ("ASoC: rt5645: Adds push button support
for rt5650").

I have used the sound-asoc tree from next-20150429 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/MuI8kYWnaz+J=AJpYmCkfB5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVQY3yAAoJEMDTa8Ir7ZwV+tgP/iN9TnWiFJOeySMbVPxsmtZQ
SlxXl1faHjstBU3C8/2zHDep44eVT9muqpBCKFPl23HS14+DJfloTZibwwley5GX
0knZU9N8YfEwtOBxENwS726RZsMmw6pa9Dzto/uba3hZM6IQsGxXs+kRy6XVSiQG
wHNGY7jlS765ybPMcqQcI3qNgi8Ei1YAaGKtwcjqbN1vPCKasrhb2nHoxA7GyEhr
EscemnItaWv+UX22ZRnDQ7XqCe1ISjBYeHmX6dQ0S73/SN/rCawVe0xcPYlha3ry
8buvwsrySBLR4O3pIh3qDonYboJziu8krZhFLZOrfXfllfHRkreQsy426kRX8wo+
9U7tjoXqzy01mswt6LieJ6CdAO89xjkQQCp4zp4Ux3nyIIVaUumDFdZ97odjRDCa
wpzGd9GRNJpA4gpM1Fc+iM/weW+TMNLjntTO9A1b8T6mxW5kjuHMzQGvwmF+crBp
XExomtFLGU2J47yLhF1KG+LexlWUFM9qqjOQgSSqrJlNJzWL4mSIfClw2yZSNM/o
fFSsWSMMKCb1BFKTO7dPAThIgjsAfJY92IuokClZAAMPn1DNtmojvsIayVyaFEHc
RP2OyxUefKkh/6bs6aziQKFxVAQPj4DVkXigv+lyK+3/4tLSuGR9IUnv03AEEcXg
cJ1H8155u4dfxAt/wXmd
=1FZT
-----END PGP SIGNATURE-----

--Sig_/MuI8kYWnaz+J=AJpYmCkfB5--
