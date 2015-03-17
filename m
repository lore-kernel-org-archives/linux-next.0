From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Tue, 17 Mar 2015 13:01:04 +1100
Message-ID: <20150317130104.548124c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/13ggSojdA.s619m6+S6ug8F"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hartley <james.hartley@imgtec.com>, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/13ggSojdA.s619m6+S6ug8F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64 allmodconfi=
g)
failed like this:

drivers/crypto/img-hash.c: At top level:
drivers/crypto/img-hash.c:878:1: error: expected ',' or ';' before 'static'
 static int img_hash_probe(struct platform_device *pdev)
 ^

Caused by commit d358f1abbf71 ("crypto: img-hash - Add Imagination
Technologies hw hash accelerator").

I have used the crypto tree from next-20150316 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/13ggSojdA.s619m6+S6ug8F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVB4rmAAoJEMDTa8Ir7ZwVFfEP/iT3444sKVINTIu+7M5KQumS
BpSz95TCP984BLYdlNzi9o/d/RzaCbfW3Dz/hFDR1fmlotaTCqMbVwUN8Z69zR6b
qyPrib3rybJ6iDvZRO0GX/MZUEa5s0rNMebijuEEOaav03Oit5vziFL5ByOGPris
yTSze1tfDQEzILBhlyBivT53p+wJ+q/pH+zd5FrhXmjW8ugG1abB8CloHwZ8R4kO
bXOWMPOHJTpUI2w+6iToO8aM5ekh957EvCgl/zCRi3uHIs/7tPNHNqR5bQIakvr7
ICFncSVgW4bKX7feoIPA7HEjAzVf4RuGAGFrv3HE8/Iz4mYUUcT904IbA9EbI83+
+Y7advCsU2nBxKPul3HwqKTxrm/ilFvQt2hUdgMwTjqH5xNM5e9a78JLGGhNh62k
rDvMxMD8ra7qskCIawc52gvrAhMfGQNw67jNCK5silMGcLat+pBv9dbY/DddsUCF
IL8bfhdRmCVvqXfkkr4Q7EY3T6OXBDkRNKd/aZhh8o6uYSpRt7ZbhWk5RU+V7IE0
OE4hEESbgwY1zRE9QUxtn/sXXBfT6jZXWlLY/RJzxGiKmoD3Uw06jHuRjuhQeh4R
j2ed75HL5ilnerzOSRpOtdPIWDmlsKXmJCuVYl9YcWuN7kbeH62Ot6HckRQQnEC8
BAz2hH+FKHWIuF0jbBpF
=9bRz
-----END PGP SIGNATURE-----

--Sig_/13ggSojdA.s619m6+S6ug8F--
