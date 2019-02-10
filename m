From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Mon, 11 Feb 2019 07:14:42 +1100
Message-ID: <20190211071442.153e158d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JuyT=nG_xTwOHADdz3gBgWj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JuyT=nG_xTwOHADdz3gBgWj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ccc8ca9b90ac ("net/smc: fix byte_order for rx_curs_confirmed")

Fixes tag

  Fixes: b8649efad879 ("net/smc: fix sender_free computation") (net-tree)

has these problem(s):

  - The trailing '(net-tree)' is unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/JuyT=nG_xTwOHADdz3gBgWj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxghjIACgkQAVBC80lX
0GwyXwf+POnzrOJWYp6o9ChWPy+nupuh/WVQ3ZoBfFWas4arHyu9HGjXTP/wSo8w
KBQvgTwANygKb+zciao/0ACZtCC5qmZJTOQXAeo/vFn0gPnaJ3DHkN8Z5GSGBXvL
OCk/LN+bQoHm6I1QFc+xlSye9d26S/o6jA/RPun4l7jPuu0Hd5uWdXef/KdkSWME
6W7fM+BqK1nDvSxnaTOUDIULsTJPepShZi3vMFKD5ytzt8IT+qZ/RAYlbPYc7lVk
rISKsO8cMdwYlzmtB5ocaYd83RKHMtj1fM/g9movwbrWQn39wpH0+KvAgSh5ZVNh
9yWPoXa7HOa2M9g5o7VBD8/40MYHLg==
=/Jb8
-----END PGP SIGNATURE-----

--Sig_/JuyT=nG_xTwOHADdz3gBgWj--
