From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the y2038 tree
Date: Thu, 4 Oct 2018 16:11:07 +1000
Message-ID: <20181004161107.77a010e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NPqEHNtiszlU=iS=46dhNPd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NPqEHNtiszlU=iS=46dhNPd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  kernel/signal.c

between commit:

  49c39f8464a9 ("y2038: signal: Change rt_sigtimedwait to use __kernel_time=
spec")

from the y2038 tree and commit:

  ae7795bc6187 ("signal: Distinguish between kernel_siginfo and siginfo")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/signal.c
index 0ff8305a26eb,1c2dd117fee0..000000000000
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@@ -3081,8 -3131,8 +3131,8 @@@ int copy_siginfo_from_user32(struct ker
   *  @info: if non-null, the signal's siginfo is returned here
   *  @ts: upper bound on process time suspension
   */
- static int do_sigtimedwait(const sigset_t *which, siginfo_t *info,
+ static int do_sigtimedwait(const sigset_t *which, kernel_siginfo_t *info,
 -		    const struct timespec *ts)
 +		    const struct timespec64 *ts)
  {
  	ktime_t *to =3D NULL, timeout =3D KTIME_MAX;
  	struct task_struct *tsk =3D current;
@@@ -3145,8 -3194,8 +3195,8 @@@ SYSCALL_DEFINE4(rt_sigtimedwait, const=20
  		size_t, sigsetsize)
  {
  	sigset_t these;
 -	struct timespec ts;
 +	struct timespec64 ts;
- 	siginfo_t info;
+ 	kernel_siginfo_t info;
  	int ret;
 =20
  	/* XXX: Don't preclude handling different sized sigset_t's.  */
@@@ -3174,11 -3223,11 +3224,11 @@@
  #ifdef CONFIG_COMPAT
  COMPAT_SYSCALL_DEFINE4(rt_sigtimedwait, compat_sigset_t __user *, uthese,
  		struct compat_siginfo __user *, uinfo,
 -		struct compat_timespec __user *, uts, compat_size_t, sigsetsize)
 +		struct old_timespec32 __user *, uts, compat_size_t, sigsetsize)
  {
  	sigset_t s;
 -	struct timespec t;
 +	struct timespec64 t;
- 	siginfo_t info;
+ 	kernel_siginfo_t info;
  	long ret;
 =20
  	if (sigsetsize !=3D sizeof(sigset_t))

--Sig_/NPqEHNtiszlU=iS=46dhNPd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1rvsACgkQAVBC80lX
0GwZkQf/QPk6jfKbdZtgzLZFIaZU+7sUL9B8QWWxE/q0W7FXd8VFiWcJekxyKio3
g2Z9PN5dtOs1aFfaqocWvEbcqcAFXxcAqCNzoFikcF2Di4moYURoXH1AJTbjjxom
TBBhUG8YbFg3HH5e77nC51S0z6023ItZ/N5FAbBMAe1uSHfJ+6q2cx4tthHwxxi5
+OtRp/zZxy+NjxekGYBgbo4Sk1dOYdtrc72ayTYCkGqjRPxk+dyEzJVABKiI6EkY
I21sQg4CqIEoI/EKFFS3fal8HcoEMUhmrQgFN5m04kAhaoidaIGBawr244gcWCUP
L+P5HEaqJqk5zO98OZ8dn3e4iFjeZg==
=WUI+
-----END PGP SIGNATURE-----

--Sig_/NPqEHNtiszlU=iS=46dhNPd--
