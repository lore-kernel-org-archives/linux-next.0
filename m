From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the random tree
Date: Fri, 29 Jun 2018 16:06:10 +1000
Message-ID: <20180629160610.5abd17c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uW3YB7B95BxXcRBkn=3QYaN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: linux-next.vger.kernel.org

--Sig_/uW3YB7B95BxXcRBkn=3QYaN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Theodore,

After merging the random tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/mmzone.h:10:0,
                 from include/linux/gfp.h:6,
                 from include/linux/umh.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/char/random.c:242:
drivers/char/random.c: In function 'random_ioctl':
drivers/char/random.c:1973:32: error: 'random_wait' undeclared (first use i=
n this function); did you mean 'random_write'?
    wake_up_interruptible_poll(&random_wait, POLLIN);
                                ^
include/linux/wait.h:216:12: note: in definition of macro 'wake_up_interrup=
tible_poll'
  __wake_up(x, TASK_INTERRUPTIBLE, 1, poll_to_key(m))
            ^
drivers/char/random.c:1973:32: note: each undeclared identifier is reported=
 only once for each function it appears in
    wake_up_interruptible_poll(&random_wait, POLLIN);
                                ^
include/linux/wait.h:216:12: note: in definition of macro 'wake_up_interrup=
tible_poll'
  __wake_up(x, TASK_INTERRUPTIBLE, 1, poll_to_key(m))
            ^

Caused by commit

  e4f3df9712bb ("random: Wake up writers when random pools are zapped")

interacting with commit

  a11e1d432b51 ("Revert changes to convert to ->poll_mask() and aio IOCB_CM=
D_POLL")

from Linus' tree.

I took a stab and applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Jun 2018 15:43:01 +1000
Subject: [PATCH] random: fix up for revert of poll_mask changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 00db7aed3204..d686aa2a129b 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1970,7 +1970,7 @@ static long random_ioctl(struct file *f, unsigned int=
 cmd, unsigned long arg)
 		input_pool.entropy_count =3D 0;
 		blocking_pool.entropy_count =3D 0;
 		if (random_write_wakeup_bits) {
-			wake_up_interruptible_poll(&random_wait, POLLIN);
+			wake_up_interruptible_poll(&random_write_wait, POLLIN);
 			kill_fasync(&fasync, SIGIO, POLL_OUT);
 		}
 		return 0;
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/uW3YB7B95BxXcRBkn=3QYaN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1zFIACgkQAVBC80lX
0GwHvAf+L2N9Iey4ayCFP/sBek5BrbC6Lvb/E1zhzIs3+m1rX1xK5X2V5JMDO98k
zVIxKR4EuUzWup5KpsF2vbAj/BTsLjBPOQ2/sXFpGisI0sMNYTucKj/VKc5ciOSX
Y88HUUVQdJItTkiFGX1GQOk7jDVfXMoc1Jb7zu/1GoICSea+OyAB381POGKkLCOx
ak2pWfQKs/jScFcl14DnTZDeQiaOO/ISHIjWPgC40xO6UCgBWMi2TYRl7JRBQ6NP
9WjYEJi342f+D+Pc4Gr7Zs6MPFiZ5oJs6AEhGSbcV+wIoSI4ZGmjS+BZSIpbPqp4
U5Je2g4pWXPv7Nq6SG25ex5y8yPbIQ==
=36uH
-----END PGP SIGNATURE-----

--Sig_/uW3YB7B95BxXcRBkn=3QYaN--
