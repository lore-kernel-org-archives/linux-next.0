From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 13 Jul 2018 10:47:52 +1000
Message-ID: <20180713104752.697563af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j/4oXbMF2CmrDxFIlsDjrKF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Baranoff <sbaranoff@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/j/4oXbMF2CmrDxFIlsDjrKF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv4/tcp_ipv4.c

between commit:

  21684dc46c59 ("tcp: fix sequence numbers for repaired sockets re-using TI=
ME-WAIT sockets")

from the net tree and commit:

  cca9bab1b72c ("tcp: use monotonic timestamps for PAWS")

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

diff --cc net/ipv4/tcp_ipv4.c
index 3b2711e33e4c,dc415c66a33a..000000000000
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@@ -155,25 -155,13 +155,26 @@@ int tcp_twsk_unique(struct sock *sk, st
  	   and use initial timestamp retrieved from peer table.
  	 */
  	if (tcptw->tw_ts_recent_stamp &&
- 	    (!twp || (reuse && get_seconds() - tcptw->tw_ts_recent_stamp > 1))) {
+ 	    (!twp || (reuse && time_after32(ktime_get_seconds(),
+ 					    tcptw->tw_ts_recent_stamp)))) {
 -		tp->write_seq =3D tcptw->tw_snd_nxt + 65535 + 2;
 -		if (tp->write_seq =3D=3D 0)
 -			tp->write_seq =3D 1;
 -		tp->rx_opt.ts_recent	   =3D tcptw->tw_ts_recent;
 -		tp->rx_opt.ts_recent_stamp =3D tcptw->tw_ts_recent_stamp;
 +		/* In case of repair and re-using TIME-WAIT sockets we still
 +		 * want to be sure that it is safe as above but honor the
 +		 * sequence numbers and time stamps set as part of the repair
 +		 * process.
 +		 *
 +		 * Without this check re-using a TIME-WAIT socket with TCP
 +		 * repair would accumulate a -1 on the repair assigned
 +		 * sequence number. The first time it is reused the sequence
 +		 * is -1, the second time -2, etc. This fixes that issue
 +		 * without appearing to create any others.
 +		 */
 +		if (likely(!tp->repair)) {
 +			tp->write_seq =3D tcptw->tw_snd_nxt + 65535 + 2;
 +			if (tp->write_seq =3D=3D 0)
 +				tp->write_seq =3D 1;
 +			tp->rx_opt.ts_recent	   =3D tcptw->tw_ts_recent;
 +			tp->rx_opt.ts_recent_stamp =3D tcptw->tw_ts_recent_stamp;
 +		}
  		sock_hold(sktw);
  		return 1;
  	}

--Sig_/j/4oXbMF2CmrDxFIlsDjrKF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltH9rgACgkQAVBC80lX
0GzWNwf+NKiB5ZCGsvvZ2WrAeWiMa6P10qyeJbC+pUHP2OGhTHxzn7kugQzxG5rA
lQSw1A23lv/Wcn0jNMocuZC3gAErhv3zbW00dj+CfszDtjZq++WhfXBQ5OSBJI0F
caIvgWCqnEtgiJ9R+kFI7nulcaKUfq+AepoQOq6+8v+QmMtiQ+Iyh8JQZbrdWnQt
0CgRxgTe9GIhkbqFu2hWHbLB4J53lemXEdNTCu0DD37rZlZW1HQn2ESMVGQAaa3W
CYXTt/a7zGGpLOPOCoMUaYO5PilZjWWyrx3i5Fu1qyhla04pzey3H4uO+TkcJrMp
uhVKY1CwfExkWiVTKpQzv5qAmVd6TA==
=scmK
-----END PGP SIGNATURE-----

--Sig_/j/4oXbMF2CmrDxFIlsDjrKF--
