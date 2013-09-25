From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the cgroup
 tree
Date: Wed, 25 Sep 2013 13:57:43 +1000
Message-ID: <20130925135743.643c9e7d8eb61a8cc83c1841@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__25_Sep_2013_13_57_43_+1000_iNwemi+RCzEfaT8Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__25_Sep_2013_13_57_43_+1000_iNwemi+RCzEfaT8Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
mm/memcontrol.c between commit b86278359484 ("memcg: stop using css id")
from the cgroup tree and commit 4c34cae8f277 ("revert "memcg: get rid of
soft-limit tree infrastructure"") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/memcontrol.c
index 65a46ef,7dda769..0000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -5979,6 -6196,9 +6209,8 @@@ static void __mem_cgroup_free(struct me
  	int node;
  	size_t size =3D memcg_size();
 =20
+ 	mem_cgroup_remove_from_trees(memcg);
 -	free_css_id(&mem_cgroup_subsys, &memcg->css);
+=20
  	for_each_node(node)
  		free_mem_cgroup_per_zone_info(memcg, node);
 =20

--Signature=_Wed__25_Sep_2013_13_57_43_+1000_iNwemi+RCzEfaT8Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBCAAGBQJSQl88AAoJEECxmPOUX5FEay4P/2LtKrwPfAQaSLYA7w6SJ18B
zV+9p49ORaIIuqbFfGzF+8ScTyGlgX+xKnJsewSoGPC+PkibzFwMbFVPG6gqGtrS
lldbZrfYatj9RgYMXIv6KM50Kt+KmWyUbBzOiZS0qMQz109SAFY/Pj+q/Utlntoy
yPOoyjUOg2qma+H4O9n0rBNCqOLNQD0WY8wIS+qa/EgQuS5Y+AbuAE7fj1xRfyCB
JQT9wjvjo/ya05n6G/S//fHhSWpMAmvbo7TR9wU9qHeyrhEEldRH1S+8ZhLFjvWG
Y3CXqf2sCqAY2Wc2Sf91oQcNChpx7s/9VXLaa22tIxOO4XFVgmxdi9Rp4QugB4Hu
AcFWa7T6zmdjz3ztoUGxCXPrTaRgNsPvtA6X9m2xTMZ0yTxbhZf46u2ZYDrh1/85
+qAimbRRjf62mB6Vtv9JBQJWrNL7Cta5dSwfuRWRGPtCwj3BMmJBsktgUd2IywQN
pP9m6JuhvDWnF9/77lgoQLui+WBIpUwfI7NbgKeXD1LTbo2OnbteMqLMeuMOed5z
5AGU5IB5cuCbPTsEJVzFtnZRIPTPSEKNWlthvoWAPuJnUs/AD+3hnd7uf7+Ym4GR
xYnjcqYc+yvb+f7p61XIX9wOqONXM2vkujzOEKhTfHCM/DiSrH0w3stjKiQEznUN
u0Ru0hi+1jyL5OA8/P03
=STVj
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Sep_2013_13_57_43_+1000_iNwemi+RCzEfaT8Z--
