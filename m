From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Thu, 28 May 2015 21:40:49 +1000
Message-ID: <20150528214049.747115f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pyURHc.vp.b/euL32m8qHL8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>
List-Id: linux-next.vger.kernel.org

--Sig_/pyURHc.vp.b/euL32m8qHL8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (powerpc allyesconf=
ig)
failed like this:

crypto/jitterentropy.c: In function 'jent_get_nstime':
crypto/jitterentropy.c:135:5: error: implicit declaration of function 'time=
keeping_valid_for_hres' [-Werror=3Dimplicit-function-declaration]
     (0 =3D=3D timekeeping_valid_for_hres()) &&
     ^

Caused by commit bb5530e40824 ("crypto: jitterentropy - add
jitterentropy RNG").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/pyURHc.vp.b/euL32m8qHL8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZv7MAAoJEMDTa8Ir7ZwVEX8P/2UUurDgefmx8onOJjTPpoQ9
igXsN60EOqQVc4DCm1wn+QmWPXfcSKHZyczhLORO7rYCM0abF+3EZn7jx8EI0q3D
iuclWCyHkWJ7rDdgmIC5elSGEuYJkxsVcPKRRED0t2eWxwX9FYQPGcQAPeKyqGj6
00tkhtxScdwFRtbd0Wnn8DqldJatZX3LBki+vD+COwDIz4sJKXB14DecblXIJ/sW
eWi+iP1JP897x76X5EZPM37B4YVp6av46ulQxQANbt9Xg4BgSO5Yw9E5xCvZvv5E
2WhDxUPAuyDAkEGAdNMP4D7QRGF1O/LzMJnYIKuZ4qYFT4WFwP09bM6RdokrHwIp
nUqPldMQCulpG5fOLEc94L6iaEU2zmYMal+bxvKsVT5Y7c3RKIBngViXe0c5LumY
z6OoJG3BQkLL2fYNxRXPjXsyVx1QlW7+BPirv7UwwHFD5eX2dkPJUM2nreu5ZqH6
WrTeJcu7OZd+ZXr1IsNf/2AlVI0uTt4f0ozG1/7228TQirg56dkSc/Hn4/cwYZwn
Wjw7fEOsTcg/cDjkyHQsACAmA/cMhRw/zQ15bmWGOqS60lv0/0+UNJZDP2XBsTVF
C7OIHBUnAczfys4S7VaWrdtmP4+XxlvRAhXdXYOybevXgZqjLqQyvZmYy54IIsYM
lwhenSqpi7qFJNWiWk6e
=o1ub
-----END PGP SIGNATURE-----

--Sig_/pyURHc.vp.b/euL32m8qHL8--
