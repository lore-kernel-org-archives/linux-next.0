From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Sep 2018 10:11:07 +1000
Message-ID: <20180918101107.74d8689a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gk.xrKYo+V8dzSowvoh9sfc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Vakul Garg <vakul.garg@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gk.xrKYo+V8dzSowvoh9sfc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/net/tls.c

between commit:

  50c6b58a814d ("tls: fix currently broken MSG_PEEK behavior")

from the net tree and commit:

  c2ad647c6442 ("selftests/tls: Add test for recv(PEEK) spanning across mul=
tiple records")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/net/tls.c
index 8fdfeafaf8c0,96fc6fe70293..000000000000
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@@ -502,55 -502,28 +502,77 @@@ TEST_F(tls, recv_peek_multiple
  	EXPECT_EQ(memcmp(test_str, buf, send_len), 0);
  }
 =20
 +TEST_F(tls, recv_peek_multiple_records)
 +{
 +	char const *test_str =3D "test_read_peek_mult_recs";
 +	char const *test_str_first =3D "test_read_peek";
 +	char const *test_str_second =3D "_mult_recs";
 +	int len;
 +	char buf[64];
 +
 +	len =3D strlen(test_str_first);
 +	EXPECT_EQ(send(self->fd, test_str_first, len, 0), len);
 +
 +	len =3D strlen(test_str_second) + 1;
 +	EXPECT_EQ(send(self->fd, test_str_second, len, 0), len);
 +
 +	len =3D sizeof(buf);
 +	memset(buf, 0, len);
 +	EXPECT_NE(recv(self->cfd, buf, len, MSG_PEEK), -1);
 +
 +	/* MSG_PEEK can only peek into the current record. */
 +	len =3D strlen(test_str_first) + 1;
 +	EXPECT_EQ(memcmp(test_str_first, buf, len), 0);
 +
 +	len =3D sizeof(buf);
 +	memset(buf, 0, len);
 +	EXPECT_NE(recv(self->cfd, buf, len, 0), -1);
 +
 +	/* Non-MSG_PEEK will advance strparser (and therefore record)
 +	 * however.
 +	 */
 +	len =3D strlen(test_str) + 1;
 +	EXPECT_EQ(memcmp(test_str, buf, len), 0);
 +
 +	/* MSG_MORE will hold current record open, so later MSG_PEEK
 +	 * will see everything.
 +	 */
 +	len =3D strlen(test_str_first);
 +	EXPECT_EQ(send(self->fd, test_str_first, len, MSG_MORE), len);
 +
 +	len =3D strlen(test_str_second) + 1;
 +	EXPECT_EQ(send(self->fd, test_str_second, len, 0), len);
 +
 +	len =3D sizeof(buf);
 +	memset(buf, 0, len);
 +	EXPECT_NE(recv(self->cfd, buf, len, MSG_PEEK), -1);
 +
 +	len =3D strlen(test_str) + 1;
 +	EXPECT_EQ(memcmp(test_str, buf, len), 0);
 +}
 +
+ TEST_F(tls, recv_peek_large_buf_mult_recs)
+ {
+ 	char const *test_str =3D "test_read_peek_mult_recs";
+ 	char const *test_str_first =3D "test_read_peek";
+ 	char const *test_str_second =3D "_mult_recs";
+ 	int len;
+ 	char buf[64];
+=20
+ 	len =3D strlen(test_str_first);
+ 	EXPECT_EQ(send(self->fd, test_str_first, len, 0), len);
+=20
+ 	len =3D strlen(test_str_second) + 1;
+ 	EXPECT_EQ(send(self->fd, test_str_second, len, 0), len);
+=20
+ 	len =3D sizeof(buf);
+ 	memset(buf, 0, len);
+ 	EXPECT_NE(recv(self->cfd, buf, len, MSG_PEEK), -1);
+=20
+ 	len =3D strlen(test_str) + 1;
+ 	EXPECT_EQ(memcmp(test_str, buf, len), 0);
+ }
+=20
  TEST_F(tls, pollin)
  {
  	char const *test_str =3D "test_poll";

--Sig_/gk.xrKYo+V8dzSowvoh9sfc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlugQpsACgkQAVBC80lX
0Gz3EQf/UJDAfYgBYpPjUgDz82f+NRcBqrR/ekZfPvomH1PKo/d6tHibfGRW4VEX
f1BEF2Qp5z7JmKfqToq6Yv5wqBV+m3Lfk9pn5QkzhPBRLHko/35ia/RubS2GBCYw
qnyMGZtvA6nX4APzziHLhmWUDJDHrCw+2qAKA3VGWTnfI+DAFed6PdCnUX+jOYVz
J0Tp1G6JDAWLpQZqKYMjjligl0agrRaLvXbVTw36lhAtuS45BPzpv8kZb+2KK1hU
tJIAOuK+RB2bT+jl7jn75LhsdVqfkmzgpJc+cGVG2fWJQauZQYXCKym+wc3gZQCw
qSJfixe1ozp58yU1SLC8Y7Ydwtoirw==
=Mcd3
-----END PGP SIGNATURE-----

--Sig_/gk.xrKYo+V8dzSowvoh9sfc--
