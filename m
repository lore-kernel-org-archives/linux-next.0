From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Mon, 19 Mar 2018 12:04:33 +1100
Message-ID: <20180319120433.24cc4be1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rvvOt6xsja+.U4n9.FFTr/X"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harsh Jain <harsh@chelsio.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rvvOt6xsja+.U4n9.FFTr/X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/crypto/chelsio/chcr_ipsec.c:66:0:
drivers/crypto/chelsio/chcr_crypto.h:343:12: warning: 'chcr_ahash_continue'=
 declared 'static' but never defined [-Wunused-function]
 static int chcr_ahash_continue(struct ahash_request *req);
            ^~~~~~~~~~~~~~~~~~~

Introduced by commit

  5110e65536f3 ("crypto: chelsio -Split Hash requests for large scatter gat=
her list")

--=20
Cheers,
Stephen Rothwell

--Sig_/rvvOt6xsja+.U4n9.FFTr/X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqvDKIACgkQAVBC80lX
0GxosAf/Z4LngXkrYhHqp9Ilzv/yc+qjlyf+w+l+AUhHZh6MLU11Mm8wEqP8mUxA
gM29tdlsxL1XnardbXiTG+EjphAZGIP6g5uv+P8at+gtytOMi1vLzGXvL1ibEKAm
g3RLyBOjNGgC46O1yd7PW4FOFAaL7VFxboZA3GpLj8EdWOtfz6cnc0KtcAq8Z/XH
EWmhERAqMt8mUoY/iERj8FFSwnChBeBzNDPnkT41zPcV2TEXylROyljv3VTzZpVB
+H+SqNwiAlZzsdAbhnbh8xMNOsZLrjovLNR5d9yUJuQ+Mudt5PvoyOEeCniCjbpn
5yyBGiX/o8+p+7VRcjj2TNfYBNHdpg==
=Emsn
-----END PGP SIGNATURE-----

--Sig_/rvvOt6xsja+.U4n9.FFTr/X--
