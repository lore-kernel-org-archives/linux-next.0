From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Date: Mon, 30 Oct 2017 20:55:47 +0000
Message-ID: <20171030205547.pvd23ahq7xgahlke@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2a3zhkdh4u47cvpe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--2a3zhkdh4u47cvpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  net/ipv4/tcp_output.c

between commit:

  6aa7de059173a ("locking/atomics: COCCINELLE/treewide: Convert trivial ACC=
ESS_ONCE() patterns to READ_ONCE()/WRITE_ONCE()")

in the tip tree and some change in the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/ipv4/tcp_output.c
index a69a34f57330,48531da1aba6..000000000000
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@@ -1978,7 -1908,7 +1978,7 @@@ static bool tcp_tso_should_defer(struc
  	if ((skb !=3D tcp_write_queue_tail(sk)) && (limit >=3D skb->len))
  		goto send_now;
 =20
- 	win_divisor =3D ACCESS_ONCE(sock_net(sk)->ipv4.sysctl_tcp_tso_win_diviso=
r);
 -	win_divisor =3D READ_ONCE(sysctl_tcp_tso_win_divisor);
++	win_divisor =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_tso_win_divisor);
  	if (win_divisor) {
  		u32 chunk =3D min(tp->snd_wnd, tp->snd_cwnd * tp->mss_cache);
 =20

--2a3zhkdh4u47cvpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3kdMACgkQJNaLcl1U
h9BY3gf6AjGHwAEF7NDfKp8RhWbMwD64Ove6QLsTaPYe+f8lJoRO+MYt7u41WC12
rmNPqQAl6xt4Sk0N8p8ZVcdeUrMs91m0NZ8C4O7w4V4R89aRrp05yMJuPAYTfBZg
HNUzWa63x+qHU1wN59Ha0lA76NVr50PbzqCgjNwJfRAmzhaKhE3LUE29QWQhdfG8
IupXcsmk+23fytfAHd9gnjoPxV7SswRX05DcM06TVsluUmLgzfe6XUpxGwK1UjtN
HLplYwEPifIk4LTrTBexTiqkWU553X0v5Yi0gnJYes0F69Fj/Nnd06Svbw8Emzpg
gpxejqG2Xm5UWERpOH/4LXWi74m26g==
=rbhK
-----END PGP SIGNATURE-----

--2a3zhkdh4u47cvpe--
