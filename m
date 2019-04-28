From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Sun, 28 Apr 2019 16:49:36 +1000
Message-ID: <20190428164936.51bc0e7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v3H7.PmPscfamGqzgt0jHF_"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/v3H7.PmPscfamGqzgt0jHF_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c1c477217882 ("l2tp: use rcu_dereference_sk_user_data() in l2tp_udp_encap=
_recv()")

Fixes tag

  Fixes: d00fa9adc528 ("il2tp: fix races with tunnel socket close")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

Fixes: d00fa9adc528 ("l2tp: fix races with tunnel socket close")

--=20
Cheers,
Stephen Rothwell

--Sig_/v3H7.PmPscfamGqzgt0jHF_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzFTQAACgkQAVBC80lX
0GyxsQf9FwooBMbY+hUtE6GYrJ2iZJy4z7QmdSBeYjMdthpqjWCffwtAkYgNpZVF
Q/FKbenCjXyz0bKaYJTtTb3Ejql6HMJj6bauW7s68aELaKcFsntl8aMtufcyAxEX
7ODiZ9b6RJOF+7h+0tWb7aLAiXlOrnUFnihuWkhNnUjlj9QVguQCnHQnfvcjPgCc
dw4jJxVHp1NXKVz3Dw7vFeWdS4B/eBUqeALnPCmSHZewFLMvnRNHNgCQhGXP30p9
bxLIkzm26ejBjqFP+RyuwRV5TkdbYJf7BCQ2Rvwg/sMOUm54MW+3q9/xted26d0N
tGQYSkzm0sx2kYftlX9fxqpr8LeLNQ==
=nd0u
-----END PGP SIGNATURE-----

--Sig_/v3H7.PmPscfamGqzgt0jHF_--
