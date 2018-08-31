From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the bpf-next tree
Date: Sat, 1 Sep 2018 05:07:51 +1000
Message-ID: <20180901050751.3714fc63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F9cPL1urc81lZiOWy+5JsAQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/F9cPL1urc81lZiOWy+5JsAQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0f93c3995c93 ("bpf: add TCP_SAVE_SYN/TCP_SAVED_SYN sample program")
  9452048c7940 ("bpf: add TCP_SAVE_SYN/TCP_SAVED_SYN options for bpf_(set|g=
et)sockopt")
  175eba5962b4 ("xdp: remove redundant variable 'headroom'")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/F9cPL1urc81lZiOWy+5JsAQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluJkgcACgkQAVBC80lX
0GzncwgAhyqs4LlNWeLLMxSbNv6XTZZ+ls3ne/1g5cSze2vthwLoibDerx6QJfDw
9ljAbM3gWVKMduW1wzllNooLNB2CtUaFMXQHOahj0UxqCqsCMUcW2AhuK3iazts+
A7VvybUqqN1ilkumK6QQjdp0zyBm/KClco2meD+IOYENKTcsTD6AkDHTF6C/hM2J
9vLV8uNkPVuwjxRcDJn649jGeJFk9xbKjb08BqTKo1iKU/+8Thn4WxBLqzR5oKlI
GBAVp8bqYB8+cJEqj5+20ysleGrHT6qlSVBuwIKOaWQEIMjXQMcuGt0/r+x9CpGl
O1UqqBZzrW+k7TinsNTUgwgXfddJKw==
=RWQq
-----END PGP SIGNATURE-----

--Sig_/F9cPL1urc81lZiOWy+5JsAQ--
