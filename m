From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Thu, 2 Aug 2018 18:31:10 +1000
Message-ID: <20180802183110.1e1ad25b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bf0ktMUeT2FxtmdDwzJUNjv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bf0ktMUeT2FxtmdDwzJUNjv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/fork.c

between commit:

  2c323017e381 ("blk-cgroup: clear the throttle queue on fork")

from the block tree and commit:

  f3ed47469a7b ("fs: fsnotify: account fsnotify metadata to kmemcg")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/fork.c
index f54c49573139,3913dd898bd4..000000000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -867,11 -867,9 +868,14 @@@ static struct task_struct *dup_task_str
  	tsk->fail_nth =3D 0;
  #endif
 =20
 +#ifdef CONFIG_BLK_CGROUP
 +	tsk->throttle_queue =3D NULL;
 +	tsk->use_memdelay =3D 0;
 +#endif
 +
+ #ifdef CONFIG_MEMCG
+ 	tsk->active_memcg =3D NULL;
+ #endif
  	return tsk;
 =20
  free_stack:

--Sig_/bf0ktMUeT2FxtmdDwzJUNjv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltiwU4ACgkQAVBC80lX
0GxH4Qf/cDtoOJbO6LJh1UVykrbIq2Qol0uQoLPQxf/frn+o0WqJFyqf3omyjETq
VjSS9s5wRUFIifIvztNvog6SbbwxH2VS5JgQlaVP6Nr1GpNXJMAJx795vslncC0l
RneBIdbvrVI4jIFdkmk6AV6nEbeJrGA1MH/Qm8t3RI4ZJuC4QE2aAOSvNLVJldXT
2+9rcFryNRh4p3Xnf50tsiQAGhxs2bnUCln6aelP/nyTBnRymiviZZ2QdGHP3lhy
Xf3/YiVabdwsU8u2DuTYGv6ctbi7q9bJtVpmru84chg31T61YgDUdMrUnQ+Fbc++
7Ggh0FEGXgl6jH0nx8wnpvJVWeQpSg==
=558s
-----END PGP SIGNATURE-----

--Sig_/bf0ktMUeT2FxtmdDwzJUNjv--
