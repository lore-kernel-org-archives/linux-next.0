From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Wed, 4 Mar 2015 11:34:29 +1100
Message-ID: <20150304113429.15c54218@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iiF_=Nj.062lfj_SaZar7cf"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38063 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755172AbbCDAeg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2015 19:34:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>

--Sig_/iiF_=Nj.062lfj_SaZar7cf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mfd/mt6397-core.c: In function 'mt6397_irq_domain_map':
drivers/mfd/mt6397-core.c:124:2: error: implicit declaration of function 's=
et_irq_flags' [-Werror=3Dimplicit-function-declaration]
  set_irq_flags(irq, IRQF_VALID);
  ^
drivers/mfd/mt6397-core.c:124:21: error: 'IRQF_VALID' undeclared (first use=
 in this function)
  set_irq_flags(irq, IRQF_VALID);
                     ^
drivers/mfd/mt6397-core.c:124:21: note: each undeclared identifier is repor=
ted only once for each function it appears in

Caused by commit 06d1bcedc888 ("mfd: Add support for the MediaTek
MT6397 PMIC").

I have used the mfd tree from next-20150303 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/iiF_=Nj.062lfj_SaZar7cf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU9lMaAAoJEMDTa8Ir7ZwVORcP/3ELC4Ej07te3v12t4KtoIJW
kaEdhb5CkVuyYHFKVZNKC5RRdEujXAWzd32BtIdndgmBocFM9aGvMGmcQhFovK1K
mg9fGJ8B3Z3gXAoJt5v0uBq0a8hLb71wqOZ0w7vwHf0HzgNLzrkRc9I+p2OHVFAa
KF9er2C6owD3FgIrcAN1dhr48dibQz+aXGTYBsUi48/j9FItu/9p7Q0TQFiu3EsE
EX0iwBz5Jpub9h14Gg2So3hmuIPBxFtnNq1gFbv/kzs7wWs7fREMCSe6B3pwxAN4
w7SF/q1qLGwpbw+AH4PN2PCHPJZBuYA+XGPMLt8Ob9DFOR58nk9bqABoq/fN7XaN
p3JiJNKtkhvKH0UFyqN0U+OY6VAhbF8wxkhSXA0FC32vIeKcl/je06OxFx/LoqDD
2QjT9ZuCvukmCpTdie0GumU+ckJiHmJv2SjYKSGJGkCzWmAmZfT0Kas+5e4H5cV8
kSdtyOhr0RluNGU3jCPngrsq/S9+3AB029UMKb4TrWxAFworbEMH1bGrJmAjuxQm
WwN9WsBrJUh9GAhJ9uh70ShC1qEDK2gQ0wbGPlwh6O6yR9zJTr0CCh9xTf5TEpt2
oszRgSBC54ILLRhICjVvUHSIf78hRBZ34kXiQ+arLSis9nDz1eH8Fb8P8mAVt5bO
esF7vi+n9zDpjiBQmwu2
=vqXL
-----END PGP SIGNATURE-----

--Sig_/iiF_=Nj.062lfj_SaZar7cf--
