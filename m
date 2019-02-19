From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 19 Feb 2019 11:30:41 +1100
Message-ID: <20190219113041.14ac62ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5ElCMpKabLiTj9k5rBR2gWg"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5ElCMpKabLiTj9k5rBR2gWg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv4/tcp.c

between commit:

  04c03114be82 ("tcp: clear icsk_backoff in tcp_write_queue_purge()")

from the net tree and commit:

  3a9a57f63794 ("tcp: move snd_cwnd & snd_cwnd_cnt init to tcp_disconnect()=
")

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

diff --cc net/ipv4/tcp.c
index cf3c5095c10e,cab6b2f2f61d..000000000000
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@@ -2577,9 -2595,11 +2596,10 @@@ int tcp_disconnect(struct sock *sk, in
  	tp->write_seq +=3D tp->max_window + 2;
  	if (tp->write_seq =3D=3D 0)
  		tp->write_seq =3D 1;
- 	tp->snd_cwnd =3D 2;
 -	icsk->icsk_backoff =3D 0;
  	icsk->icsk_probes_out =3D 0;
+ 	icsk->icsk_rto =3D TCP_TIMEOUT_INIT;
  	tp->snd_ssthresh =3D TCP_INFINITE_SSTHRESH;
+ 	tp->snd_cwnd =3D TCP_INIT_CWND;
  	tp->snd_cwnd_cnt =3D 0;
  	tp->window_clamp =3D 0;
  	tp->delivered_ce =3D 0;

--Sig_/5ElCMpKabLiTj9k5rBR2gWg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrTjEACgkQAVBC80lX
0GykxQgAhmkUZF9T2XBiTBPoNGpQddPNWswwqQNAdux7QXADtx8d/PxYr2WIwyp2
5yHeL9px085+nHv743KIIqX2kiEwQfGpz++HRD4oKnGdSp7GpW6ENbFa/iFqf6Ph
XFoayY07RU0nXhW7FsxrcGeLR+6kR2xLf1QzUwLm9nFPkVqcJhTrHWtWpjSOrdSl
JC6z/r2E+5EZa93aD65T8oIAXtp7YdKD2px5tpNykzmlpVR6GhyXSsmNQM4RdUm0
uxBVsDWuekxPvFoFsWt4+49Zb4/G1U8oDzcQ7I0nqu7J7kyNRYmj8KtHDEaYlDZ6
lCvica66mdZu66Z2KMDAGvZbPIY4rg==
=j0KX
-----END PGP SIGNATURE-----

--Sig_/5ElCMpKabLiTj9k5rBR2gWg--
