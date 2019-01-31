From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 31 Jan 2019 16:01:35 +1100
Message-ID: <20190131160135.4a8ae70b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_XKVVmyKvVxz5fOvB+koE+H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, James Morris <jmorris@namei.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>, Casey Schaufler <casey@schaufler-ca.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/_XKVVmyKvVxz5fOvB+koE+H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from arch/x86/include/asm/percpu.h:45,
                 from arch/x86/include/asm/current.h:6,
                 from include/linux/sched.h:12,
                 from include/linux/uaccess.h:5,
                 from fs/proc/base.c:51:
fs/proc/base.c: In function 'proc_smack_attr_dir_lookup':
include/linux/kernel.h:73:25: warning: passing argument 4 of 'proc_pident_l=
ookup' makes pointer from integer without a cast [-Wint-conversion]
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(=
arr))
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
fs/proc/base.c:2602:7: note: in expansion of macro 'ARRAY_SIZE'
       ARRAY_SIZE(LSM##_attr_dir_stuff)); \
       ^~~~~~~~~~
fs/proc/base.c:2615:1: note: in expansion of macro 'LSM_DIR_OPS'
 LSM_DIR_OPS(smack);
 ^~~~~~~~~~~
fs/proc/base.c:2454:31: note: expected 'const struct pid_entry *' but argum=
ent is of type 'long unsigned int'
       const struct pid_entry *end)
       ~~~~~~~~~~~~~~~~~~~~~~~~^~~

Introduced by commit

  f6e3521a4c5b ("proc: calculate end pointer for /proc/*/* lookup at compil=
e time")

interacting with commit

  6d9c939dbe4d ("procfs: add smack subdir to attrs")

from the security tree.

I have applied the following merge fix patch

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Jan 2019 15:56:56 +1100
Subject: [PATCH] proc: merge fix for proc_pident_lookup() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/proc/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 4ac7f32c1929..3daca4367d29 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2599,7 +2599,7 @@ static struct dentry *proc_##LSM##_attr_dir_lookup(st=
ruct inode *dir, \
 { \
 	return proc_pident_lookup(dir, dentry, \
 				  LSM##_attr_dir_stuff, \
-				  ARRAY_SIZE(LSM##_attr_dir_stuff)); \
+				  LSM##_attr_dir_stuff + ARRAY_SIZE(LSM##_attr_dir_stuff)); \
 } \
 \
 static const struct inode_operations proc_##LSM##_attr_dir_inode_ops =3D {=
 \
--=20
2.20.1

---
Cheers,
Stephen Rothwell

--Sig_/_XKVVmyKvVxz5fOvB+koE+H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSgS8ACgkQAVBC80lX
0GxDTgf+LDv04yPNNHI0yhLXV/diqjIIChuPWpdcxSpxeJ+t+wuwd40Kyfh05262
ijqCLsYOM7PHNch880MxlkS9hMx9xp1413piPHciVyG4aIY1nv3/aqL+B39HU3w1
01NyNSIriTCwy8OEAbMasgJQd1HLXQOZBXJSXv7m4BqbccKKfTMEcsoV9Zb0x8AF
eydYsECO/MJhldcqKAG8WL+pM4zV7RDBzeDhXKTk2M5NUdwZ7j+4McZUhiw5npBh
0+zLjqmNS09qpfTJZIze1Mgv0v2OTgcqez1lNmFubdlZL3N1VPl0l7Oguh64dQZE
KEfAPrhBkskhfrJVIym9k0YCbxZWJA==
=pNhc
-----END PGP SIGNATURE-----

--Sig_/_XKVVmyKvVxz5fOvB+koE+H--
