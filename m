From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Mon, 4 Feb 2019 15:34:46 +1100
Message-ID: <20190204153446.03ffb5e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p4WyhcwF87_CCDBil/U8v7g"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/p4WyhcwF87_CCDBil/U8v7g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (sparc64
defconfig) failed like this:

/home/sfr/next/next/net/core/sock.c: In function 'sock_setsockopt':
/home/sfr/next/next/net/core/sock.c:1146:2: error: duplicate case value
  case SO_BINDTOIFINDEX:
  ^~~~
/home/sfr/next/next/net/core/sock.c:891:2: note: previously used here
  case SO_TIMESTAMP_NEW:
  ^~~~
/home/sfr/next/next/net/core/sock.c: In function 'sock_getsockopt':
/home/sfr/next/next/net/core/sock.c:1493:2: error: duplicate case value
  case SO_BINDTOIFINDEX:
  ^~~~
/home/sfr/next/next/net/core/sock.c:1293:2: note: previously used here
  case SO_TIMESTAMP_NEW:
  ^~~~

Caused by commit

  887feae36aee ("socket: Add SO_TIMESTAMP[NS]_NEW")

I applied the following fix patch (I just update the clashing id rather
than update them all, but the latter may be better).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 4 Feb 2019 15:24:11 +1100
Subject: [PATCH] socket: fix for Add SO_TIMESTAMP[NS]_NEW

Fixes: 887feae36aee ("socket: Add SO_TIMESTAMP[NS]_NEW")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/include/uapi/asm/socket.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi=
/asm/socket.h
index 8c9f74a66b55..88fe4f978aca 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -108,7 +108,7 @@
 #define SO_TIMESTAMPNS_OLD       0x0021
 #define SO_TIMESTAMPING_OLD      0x0023
=20
-#define SO_TIMESTAMP_NEW         0x0041
+#define SO_TIMESTAMP_NEW         0x0046
 #define SO_TIMESTAMPNS_NEW       0x0042
 #define SO_TIMESTAMPING_NEW      0x0043
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/p4WyhcwF87_CCDBil/U8v7g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXwOYACgkQAVBC80lX
0GxRzgf+Mua9He8p3RVJFI8H+Newl2TzzXODR3x+tqg6QAUFC6Nx2XsEW35LIl//
eEER5nBqeSyEFIw5GKFfIZ6OmPbqXTZa+YcAuQelxb6rTvYsMepVBSGa41grL52T
jTGmSCkr6BW+sHmirM3DRbzzuCS8tBddcsZCF8IgEJzOaDvOr46Fs2qPUcWK2Z+B
muYQArx2V0wnI8zDec0pvxpgs7g/b1vvMUKPXMfjMWhduQnrBKEVHjnDPez9sXHa
j9jbBbI6I2oiOsWxm1LOAUvVLffw3SZstk4odTrxOfPke6/wpzlp6gN5xhqjRtGN
Xrv9xdBtXCfzmdVb8TdwukGr1JwB1A==
=TCyT
-----END PGP SIGNATURE-----

--Sig_/p4WyhcwF87_CCDBil/U8v7g--
