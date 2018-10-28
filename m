From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Mon, 29 Oct 2018 09:35:32 +1100
Message-ID: <20181029093532.38a3888e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iHyy82eJ6+rygpE93muF4IO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/iHyy82eJ6+rygpE93muF4IO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the origin tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

net/bridge/br_multicast.c: In function 'br_multicast_query_received':
net/bridge/br_multicast.c:1432:32: error: 'union <anonymous>' has no member=
 named 'ip6'; did you mean 'ip4'?
       !ipv6_addr_any(&saddr->u.ip6)))
                                ^~~
                                ip4

Caused by commit

  5a2de63fd1a5 ("bridge: do not add port to router list when receives query=
 with source 0.0.0.0")

# CONFIG_IPV6 is not set

I have just reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/iHyy82eJ6+rygpE93muF4IO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWObQACgkQAVBC80lX
0Gx6hAf/awY7VZlqjz3PKj61F8pi04/HNge7EKzsHPliXrVEqHErqKWNnaZ5V9OM
UGKpYpGn7+/QjJrtRIERTfL9hDowu6P2ZXBN7QGfbPnxfYzjvOpzXw/s4ZxnLZGO
n4texDl55gCvn6QMQS5MEKOHie3Z4rmU4HIEyP0MNQk8LvwiL0DTvRE/WI5i+lz/
OP2024cSO67RPI1xWk2GzGmwcwgdYCbrmP1DMm2kJbd905ll3AKZNc0FBHpyktEE
rPGbmQxCDtQ7yfZUhfkMHR7mBymQEg1hJ/ij9pkdtXWVI2wjuJ1q5AeUBwvkZILw
ykdR/rVXpyN3IC6SZQZIjMHjwv4hdg==
=K7Tx
-----END PGP SIGNATURE-----

--Sig_/iHyy82eJ6+rygpE93muF4IO--
