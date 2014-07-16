From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Wed, 16 Jul 2014 18:26:41 +1000
Message-ID: <20140716182641.5c27a6be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X.xWKbuojvcQs2Oy1sP19u0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>
List-Id: linux-next.vger.kernel.org

--Sig_/X.xWKbuojvcQs2Oy1sP19u0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/memcontrol.c:5269:12: error: 'CFTYPE_INSANE' undeclared here (not in a f=
unction)
   .flags =3D CFTYPE_INSANE,
            ^

Caused by commit 8fa6a8baeffc ("memcg: deprecate memory.force_empty
knob") interacting with commits a8ddc8215e1a ("cgroup: distinguish the
default and legacy hierarchies when handling cftypes") and 05ebb6e60f04
("cgroup: make CFTYPE_ONLY_ON_DFL and CFTYPE_NO_ internal to cgroup
core") from the cgroup tree.

I applied the following fix up patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Jul 2014 18:20:59 +1000
Subject: [PATCH] memcg-deprecate-memoryforce_empty-knob-fix2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/memcontrol.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8fa6602a32cd..e1c9699b157b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5266,7 +5266,6 @@ static struct cftype mem_cgroup_files[] =3D {
 	},
 	{
 		.name =3D "force_empty",
-		.flags =3D CFTYPE_INSANE,
 		.write =3D mem_cgroup_force_empty_write,
 	},
 	{
--=20
2.0.1


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/X.xWKbuojvcQs2Oy1sP19u0
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTxjdGAAoJEMDTa8Ir7ZwVJpUP/2KobO/E/Cnn5Vn4P+a2bC8P
EdBUhOKCiAhvefzbrYyw/FL8Dfx42SEj2QMhnigoJzlpSHsOqGS/kTV/755qkgEX
lC4/BpUjrDJnWjZXCGrzJQTVAnQX6HW52v8m5UqTjZL/5D842EBF9f9vfnfJ80Qv
MzQ+4lDOANQl2xLxQnHyEbpOQerfjLVvAlRPuKWT5wca/aFVxCAgGv61zTR8iKxH
88HQKuvljMDpFH0mAqDEIhdams/gyAolvBHXJ5eWJsit+WK4NtecW518ONgBx2SZ
EM02mYFNwuX/tOPekWhKw7u7wJV87NwAY2tNWQW4jRJnJzAWyCfSWqWcHZOx67y5
f7+4LEfOuRCV+Ck9c2CRs2xp4EQrbJVFm7DlTM9/Zi/865lmS2hq0ceZ6OGYthxq
AaSrcMTFDD0eeSCr8VQH3l76wtaPcZuhaJhL+3M9F/EBlhulRK4+8BipPdZ8QvqJ
fbStMUlDXinWyiYJMvCQdcxqDlwRtPADwW3ieqCFKM8xlFBGefNJEqeIMshH7znr
a2AQL/YCz9z4wtVzyhS1I66PFSnQviqRYLKGIcjxh/7undg8adz4lhDP9FuoGxbt
6nJrLRczQTqWombpjs3JF5LAEz/9he3FstY3pVNrQKE6DoxgJWmFg6/aZfpjEi2O
DEdBcypQUkkxG2YZLrsn
=Y0U2
-----END PGP SIGNATURE-----

--Sig_/X.xWKbuojvcQs2Oy1sP19u0--
