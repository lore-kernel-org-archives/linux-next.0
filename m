From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Thu, 26 Feb 2015 13:14:13 +1100
Message-ID: <20150226131413.2aceaf7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2e/jVuSfc1h70_p8/t/la60"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39522 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752929AbbBZCOU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Feb 2015 21:14:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--Sig_/2e/jVuSfc1h70_p8/t/la60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/clk/clk.c: In function 'clk_disable_unused_subtree':
drivers/clk/clk.c:514:3: error: label 'out' used but not defined
   goto out;
   ^

Caused by commit a2146f032294 ("clk: Use lockdep asserts to find
missing hold of prepare_lock").  Commit c440525cb967 ("clk: Remove
unneeded NULL checks") removed that label along with the NULL check
that a2146f032294 reintroduces (was this a bad rebase?).  Please do
simple build tests.

I have used the clk tree from next-20150225 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2e/jVuSfc1h70_p8/t/la60
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU7oF6AAoJEMDTa8Ir7ZwV7fUP/RcB1eMJrdrsNkbn4cuwJ3FA
eZeOhFFYua334t28t1+tZqfr4hPW3C6EjFPMPb3WgL9j5hitCCpAaD6Pqn3QUg23
jtKT9B8fLTl6QChNimAdcd8Qp2OlpAc04rqt3XN9kGo+29456xoEkXaLkHT16umH
zzYFDCNQCzC8TEuZz9N50l2KG2vq3OcUEPlMC0zFqee6d4gEWE32p0ygl6Wsy6cs
PNiKUaAhP5BjU/Pcc6rbmn9h6MZQVlPLbSiM8aUybbQklD/gYH3/VIJUO3hsR8ne
GhOcCE4+pF0dEN5V/f1rn+3usL+elYJMWDo6tEMnHijiUmag3svG3V8gruFDK1Nq
lz/ACgIxN3FMDChXQkPqbuNtFKygJOkTggICGMbHtkYvcpOOzolD/HcvLgbQFxI1
zR484Oj9Y0HENA5nTvTIE89VuF4LixMTnWCaEnTAsz3VXnQ6LHMw2axKT0i47j2x
7mtHH2BhD6M7aj1+BQM4TLPXIlAr2G8NjiiFN9D115jLpKMs0eqvOKwWnz6DWNBw
aFdilalSMzMYRmQj4ykjQK4p9EtMlOiTyTCio3w8mRFPTC4GacJ43pPIWI95qKKw
sIyW6+Lm6UYkusNg0eOmeTzDl07jwFpeRLPQiLfroHlBiE+3tjIKxhP3rmAV4BEG
Z2KkW7zOW2kgzQvNkYr6
=6Oam
-----END PGP SIGNATURE-----

--Sig_/2e/jVuSfc1h70_p8/t/la60--
