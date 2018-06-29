From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 29 Jun 2018 17:49:46 +1000
Message-ID: <20180629174946.1b4f40ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kC6n6m0sbVYWzVTz_IMJyL+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kC6n6m0sbVYWzVTz_IMJyL+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/kernel.h:10:0,
                 from include/linux/list.h:9,
                 from include/linux/preempt.h:11,
                 from include/linux/spinlock.h:51,
                 from include/linux/seqlock.h:36,
                 from include/linux/time.h:6,
                 from fs/proc/inode.c:9:
fs/proc/inode.c: In function 'proc_init_kmemcache':
include/linux/compiler.h:339:38: error: call to '__compiletime_assert_110' =
declared with attribute error: BUILD_BUG_ON failed: sizeof(struct proc_dir_=
entry) >=3D SIZEOF_PDE
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:319:4: note: in definition of macro '__compiletime=
_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler.h:339:2: note: in expansion of macro '_compiletime_a=
ssert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_a=
ssert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:69:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^~~~~~~~~~~~~~~~
fs/proc/inode.c:110:2: note: in expansion of macro 'BUILD_BUG_ON'
  BUILD_BUG_ON(sizeof(struct proc_dir_entry) >=3D SIZEOF_PDE);
  ^~~~~~~~~~~~

Caused by commit

  527ae8759f10 ("proc: fixup PDE allocation bloat")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kC6n6m0sbVYWzVTz_IMJyL+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls15JoACgkQAVBC80lX
0Gy4UQf/ZmPl9OWfJxZMfy995TKmvAjaa7Qkzxy522Ov4X7v8WnKi/RA4vQJ3RAo
T3s5KDwLRFRgWHFFVQZjv+Bc2VjQOAQzhqyWiG1YNsV/K6hY5U8T5zXhl0YQBF3t
9gyt98yZuQ5lQA7G+Q5vM03Gz9JptuRQ162ahBZmMajqKxYRVYxbFd5hIxTCCyc2
qzBg6HGnbSqBNPJJ8zTflaZo6UpbqHjEWjBRPrBnWhfIhKzWuKEz6ZX9PYBM79kk
fcG2m4RVqtwpscTH65XX0I1qhUqjSuHDFZZhxg8b//IVuu5HJjK59K2VFXcVow/A
hJHfGBlh40DHuFOiz+kr8WGh2Ypl/A==
=rHHR
-----END PGP SIGNATURE-----

--Sig_/kC6n6m0sbVYWzVTz_IMJyL+--
