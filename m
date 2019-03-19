From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Wed, 20 Mar 2019 08:15:49 +1100
Message-ID: <20190320081549.7112c33c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/618FRZgG7M0vaLQeL9_GrKU"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/618FRZgG7M0vaLQeL9_GrKU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  13f61dfc5235 ("mt76: fix schedule while atomic in mt76x02_reset_state")

Fixes tag

  Fixes: e4ebb8b403d1 ("mt76: mt76x2: implement full device restart on watc=
hdog reset")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  004960423fe1 ("mt76: mt76x2: implement full device restart on watchdog re=
set")

--=20
Cheers,
Stephen Rothwell

--Sig_/618FRZgG7M0vaLQeL9_GrKU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyRXAUACgkQAVBC80lX
0Gxf9wf+JlXe6uuNvIIy847vnW2S26JD8fXZxuO8/hiNsfGjqH9q4OMjSjbT0V0U
meColBd+i51f0QTX7PBiaaRVx80/VZ8y3C2NhvDJ28ZFuyNFsf9lS8GL7HvArGYa
VfF5cEgcjR7ehJjO1hgfgKOGpBMvzhoWouxJFv1GQ5EAJxUAKZp/66E0uD9XR4dE
dJMpqdaCAVt+M8wqDdQyr4ArV0L14zoAxupOmpR9DvwcOu4TtHsKbIGYIlaXs4Ax
UvpyTMtJhwc56Pfq+q7gvWJ+AWqe6IJKgGip5Q7rdeXrNayDzfot8qIqFWJ1v3+N
tnD+KNDDbc+1+iYCSnom4K1wQ5K4KQ==
=GNw9
-----END PGP SIGNATURE-----

--Sig_/618FRZgG7M0vaLQeL9_GrKU--
