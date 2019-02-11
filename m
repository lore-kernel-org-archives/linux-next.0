From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Tue, 12 Feb 2019 09:17:27 +1100
Message-ID: <20190212091727.7d93c434@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZhQK5b7Id5CuJZbQFQzBtZc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZhQK5b7Id5CuJZbQFQzBtZc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cbd72b485214 ("net: dsa: microchip: add switch offload forwarding support=
")

Fixes tag

  Fixes: c2e866911e254067 ("microchip: break KSZ9477 DSA driver into two fi=
les")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/ZhQK5b7Id5CuJZbQFQzBtZc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxh9HcACgkQAVBC80lX
0Gy7xAgAmmxE5wiWpWzlTueRN60hAi/njjm9WqT+Di1IAh854T6c0Q5GD75CyUZF
Kz4zWkaCFFBudI5jPQCOTP5xlw5IFrDYwJKQiPejt8rzJTYV0K31gQK2TA8aYZJA
ZYfDrp/ZykK9z5twrzCQNAVk6XBevV9No5kaV5qMB8XkOrOLzu5D0TyXv98w4qzJ
nyeeCRVW9eIsffaDuB8vLOjTqf2pbucKZssOvTfJFaFhDEYLLTs2qzbFbsTqQPWQ
LXDNfHTQ877SIZwwyGyA/qq7WxJDBLuK5NP62kB/isalYo3Zer/XleCaXJniyATd
/VqGvIV+NEoKNKrTbGdJYS2zuR7CBA==
=caVa
-----END PGP SIGNATURE-----

--Sig_/ZhQK5b7Id5CuJZbQFQzBtZc--
