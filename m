From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the crypto tree
Date: Tue, 10 Mar 2015 16:44:17 +1100
Message-ID: <20150310164417.540c18a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0hR9sDVgE44LLFbt7bMTajr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>
List-Id: linux-next.vger.kernel.org

--Sig_/0hR9sDVgE44LLFbt7bMTajr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's (and the past few days)
linux-next build (powerpc allyesconfig) produced these warnings:

crypto/algif_aead.c:561:2: warning: initialization from incompatible pointe=
r type
  .sendmsg =3D aead_sendmsg,
  ^
crypto/algif_aead.c:561:2: warning: (near initialization for 'algif_aead_op=
s.sendmsg')
crypto/algif_aead.c:563:2: warning: initialization from incompatible pointe=
r type
  .recvmsg =3D aead_recvmsg,
  ^
crypto/algif_aead.c:563:2: warning: (near initialization for 'algif_aead_op=
s.recvmsg')

Introduced by commit 400c40cf78da ("crypto: algif - add AEAD support").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/0hR9sDVgE44LLFbt7bMTajr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/oS2AAoJEMDTa8Ir7ZwVjrEP/124rMRknBbz/1If/hISsOvB
vHxzEftujO+t1kYIOw/j7ou8EheaySu181PUulM1amV5hQwSJqRtgJJ7SdeBUu0p
pOn8rSJbV869Ho4ijedHh8rV4M5vmZJryyTKAWNZC/cepaT58Z3dQQg3e9BHq7JA
73xwH5O7qdxJYSpXy8dsiRJ65GIl3W1ZzjNFXv+xKpItb5GU0ZVRlwUPek3I5/BW
rsMy3AiEa8M0cm3SVsQ1TeFBJtaPMpd3dnZgM/FBrMC4AjKPwytuVDdQbiCX4RHy
lyqUsqckLas+vU6ZGH6m6HdKgYxRzc9NM0bv5RW+Z1Fa/I4cHSpfdV8cnu5JuNiP
ciQcE/zEE8yKfXzLjbpFLYf5zQqrxI6Ch+1UEtUX/P3r/d756o3AuSRfWi/FcYuU
16rWBRHRMfPZf89zTllTSOcwn6mpXe9RHn9iQRJaXr4XSE3SPNaIn+4xFQlPsdXk
6F87S7sL2tBfI0z1BpWwG5h+NQqw/j6MPrJ/dzT805uylXZbw68CwSPGu2nY82gF
5SGplfuD1fuTPCSbBC+wFxyKHkGqQB9HqiEv5f1HhivI6ekugZ319hRPZXFKYlvv
aHfSWVtYXOAHUb9iSQR02MkCOtA2RRmuGqWN18NJDtuScJeJOHmiyRBXvcNdlKP7
jo5dkjjPzws6NG/o599Z
=hG/j
-----END PGP SIGNATURE-----

--Sig_/0hR9sDVgE44LLFbt7bMTajr--
