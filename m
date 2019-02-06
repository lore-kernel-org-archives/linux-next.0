From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the compiler-attributes
 tree
Date: Thu, 7 Feb 2019 08:30:57 +1100
Message-ID: <20190207083057.05b40e61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hjvuW_iBqyef=vyrnfbgAh2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hjvuW_iBqyef=vyrnfbgAh2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

After merging the compiler-attributes tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

In file included from arch/arm/crypto/aes-neonbs-glue.c:17:
include/linux/module.h:138:7: error: section of alias 'cleanup_module' must=
 match section of its target
  void cleanup_module(void) __exit __attribute__((alias(#exitfn)));
       ^~~~~~~~~~~~~~
arch/arm/crypto/aes-neonbs-glue.c:433:1: note: in expansion of macro 'modul=
e_exit'
 module_exit(aes_exit);
 ^~~~~~~~~~~

Caused by commit

  b31ca3fcca36 ("include/linux/module.h: mark init/cleanup_module aliases a=
s __init/exit")

I have used the compiler-attributes tree from next-20190206 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hjvuW_iBqyef=vyrnfbgAh2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbUhEACgkQAVBC80lX
0Gx53wf7B4zCxw5ht8kqQLvI+WQWkDANF4kDEsUCGoHAU7W1iW0T5CJSeVYAMA6L
hAYfWWltoDmh9LAINyfkiV+ik6y4b0i4GHs/mUWFZruPV0UDl8k4gZiRBAlKQn56
Og2BIyom8iSS4qdkb//N0QpzIehAgsoOq54BAGDBBV+yz1vEGlqutnbJVqU2aObW
4GPQ1hn6pGWtxP16ix3flZ6pmDkzk6lclOEUxvPoTXlp3+uhw0HInim1BYooU88v
1W0jHfqdlJe7dhHYca3vcFUoGWKFxoFenZdc9LLQTddX5HtmKBu395DZp9RxrxCW
xSNJmgMZRHAiuZUtPg/6cYHEX81i4A==
=Nvsz
-----END PGP SIGNATURE-----

--Sig_/hjvuW_iBqyef=vyrnfbgAh2--
