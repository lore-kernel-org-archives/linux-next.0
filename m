From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pidfd tree with the y2038 tree
Date: Mon, 21 Jan 2019 14:39:51 +1100
Message-ID: <20190121143951.68956db3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+vw5IVO+J3zmlwmwG4kuzgA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/+vw5IVO+J3zmlwmwG4kuzgA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got conflicts in:

  arch/x86/entry/syscalls/syscall_32.tbl
  include/uapi/asm-generic/unistd.h

between commit:

  10a9a4dd92e6 ("arch: add split IPC system calls where needed")
  b1788424aa2e ("y2038: add 64-bit time_t syscalls to all 32-bit architectu=
res")

from the y2038 tree and commit:

  3d2991bc7a67 ("signal: add pidfd_send_signal() syscall")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index b21ddeeb43cb,6804c1e84b36..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -396,36 -396,6 +396,37 @@@
  382	i386	pkey_free		sys_pkey_free			__ia32_sys_pkey_free
  383	i386	statx			sys_statx			__ia32_sys_statx
  384	i386	arch_prctl		sys_arch_prctl			__ia32_compat_sys_arch_prctl
 -385	i386	io_pgetevents		sys_io_pgetevents		__ia32_compat_sys_io_pgetevents
 +385	i386	io_pgetevents		sys_io_pgetevents_time32	__ia32_compat_sys_io_pge=
tevents
  386	i386	rseq			sys_rseq			__ia32_sys_rseq
+ 387	i386	pidfd_send_signal	sys_pidfd_send_signal		__ia32_sys_pidfd_send_s=
ignal
 +# room for arch specific syscalls
 +393	i386	semget			sys_semget    			__ia32_sys_semget
 +394	i386	semctl			sys_semctl    			__ia32_compat_sys_semctl
 +395	i386	shmget			sys_shmget    			__ia32_sys_shmget
 +396	i386	shmctl			sys_shmctl    			__ia32_compat_sys_shmctl
 +397	i386	shmat			sys_shmat     			__ia32_compat_sys_shmat
 +398	i386	shmdt			sys_shmdt     			__ia32_sys_shmdt
 +399	i386	msgget			sys_msgget    			__ia32_sys_msgget
 +400	i386	msgsnd			sys_msgsnd    			__ia32_compat_sys_msgsnd
 +401	i386	msgrcv			sys_msgrcv    			__ia32_compat_sys_msgrcv
 +402	i386	msgctl			sys_msgctl    			__ia32_compat_sys_msgctl
 +403	i386	clock_gettime64		sys_clock_gettime		__ia32_sys_clock_gettime
 +404	i386	clock_settime64		sys_clock_settime		__ia32_sys_clock_settime
 +405	i386	clock_adjtime64		sys_clock_adjtime		__ia32_sys_clock_adjtime
 +406	i386	clock_getres_time64	sys_clock_getres		__ia32_sys_clock_getres
 +407	i386	clock_nanosleep_time64	sys_clock_nanosleep		__ia32_sys_clock_nan=
osleep
 +408	i386	timer_gettime64		sys_timer_gettime		__ia32_sys_timer_gettime
 +409	i386	timer_settime64		sys_timer_settime		__ia32_sys_timer_settime
 +410	i386	timerfd_gettime64	sys_timerfd_gettime		__ia32_sys_timerfd_gettime
 +411	i386	timerfd_settime64	sys_timerfd_settime		__ia32_sys_timerfd_settime
 +412	i386	utimensat_time64	sys_utimensat			__ia32_sys_utimensat
 +413	i386	pselect6_time64		sys_pselect6			__ia32_compat_sys_pselect6_time64
 +414	i386	ppoll_time64		sys_ppoll			__ia32_compat_sys_ppoll_time64
 +416	i386	io_pgetevents_time64	sys_io_pgetevents		__ia32_sys_io_pgetevents
 +417	i386	recvmmsg_time64		sys_recvmmsg			__ia32_compat_sys_recvmmsg_time64
 +418	i386	mq_timedsend_time64	sys_mq_timedsend		__ia32_sys_mq_timedsend
 +419	i386	mq_timedreceiv_time64	sys_mq_timedreceive		__ia32_sys_mq_timedre=
ceive
 +420	i386	semtimedop_time64	sys_semtimedop			__ia32_sys_semtimedop
 +421	i386	rt_sigtimedwait_time64	sys_rt_sigtimedwait		__ia32_compat_sys_rt=
_sigtimedwait_time64
 +422	i386	futex_time64		sys_futex			__ia32_sys_futex
 +423	i386	sched_rr_get_interval_time64	sys_sched_rr_get_interval	__ia32_sy=
s_sched_rr_get_interval
diff --cc include/uapi/asm-generic/unistd.h
index b8626863a90f,b77538af7aca..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -740,52 -740,11 +740,54 @@@ __SC_COMP_3264(__NR_io_pgetevents, sys_
  __SYSCALL(__NR_rseq, sys_rseq)
  #define __NR_kexec_file_load 294
  __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
- /* 295 through 402 are unassigned to sync up with generic numbers */
+ #define __NR_pidfd_send_signal 295
+ __SYSCALL(__NR_pidfd_send_signal, sys_pidfd_send_signal)
++/* 296 through 402 are unassigned to sync up with generic numbers */
 +#if __BITS_PER_LONG =3D=3D 32
 +#define __NR_clock_gettime64 403
 +__SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 +#define __NR_clock_settime64 404
 +__SYSCALL(__NR_clock_settime64, sys_clock_settime)
 +#define __NR_clock_adjtime64 405
 +__SYSCALL(__NR_clock_adjtime64, sys_clock_adjtime)
 +#define __NR_clock_getres_time64 406
 +__SYSCALL(__NR_clock_getres_time64, sys_clock_getres)
 +#define __NR_clock_nanosleep_time64 407
 +__SYSCALL(__NR_clock_nanosleep_time64, sys_clock_nanosleep)
 +#define __NR_timer_gettime64 408
 +__SYSCALL(__NR_timer_gettime64, sys_timer_gettime)
 +#define __NR_timer_settime64 409
 +__SYSCALL(__NR_timer_settime64, sys_timer_settime)
 +#define __NR_timerfd_gettime64 410
 +__SYSCALL(__NR_timerfd_gettime64, sys_timerfd_gettime)
 +#define __NR_timerfd_settime64 411
 +__SYSCALL(__NR_timerfd_settime64, sys_timerfd_settime)
 +#define __NR_utimensat_time64 412
 +__SYSCALL(__NR_utimensat_time64, sys_utimensat)
 +#define __NR_pselect6_time64 413
 +__SC_COMP(__NR_pselect6_time64, sys_pselect6, compat_sys_pselect6_time64)
 +#define __NR_ppoll_time64 414
 +__SC_COMP(__NR_ppoll_time64, sys_ppoll, compat_sys_ppoll_time64)
 +#define __NR_io_pgetevents_time64 416
 +__SYSCALL(__NR_io_pgetevents_time64, sys_io_pgetevents)
 +#define __NR_recvmmsg_time64 417
 +__SC_COMP(__NR_recvmmsg_time64, sys_recvmmsg, compat_sys_recvmmsg_time64)
 +#define __NR_mq_timedsend_time64 418
 +__SYSCALL(__NR_mq_timedsend_time64, sys_mq_timedsend)
 +#define __NR_mq_timedreceiv_time64 419
 +__SYSCALL(__NR_mq_timedreceiv_time64, sys_mq_timedreceive)
 +#define __NR_semtimedop_time64 420
 +__SYSCALL(__NR_semtimedop_time64, sys_semtimedop)
 +#define __NR_rt_sigtimedwait_time64 421
 +__SC_COMP(__NR_rt_sigtimedwait_time64, sys_rt_sigtimedwait, compat_sys_rt=
_sigtimedwait_time64)
 +#define __NR_futex_time64 422
 +__SYSCALL(__NR_futex_time64, sys_futex)
 +#define __NR_sched_rr_get_interval_time64 423
 +__SYSCALL(__NR_sched_rr_get_interval_time64, sys_sched_rr_get_interval)
 +#endif
 =20
  #undef __NR_syscalls
 -#define __NR_syscalls 296
 +#define __NR_syscalls 424
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/+vw5IVO+J3zmlwmwG4kuzgA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxFPwcACgkQAVBC80lX
0Gwrogf/dpwcOW4YHjlY0K9aqkICLHpXQMKOpAaXQen+uNqi/7+EDDledmfcWa+D
5iWu0xQy2fXeNQTYCrzKTikdGfL3s+ZA9H3ztZhd2zp96m5REKDycUT/FFBdx8MC
5RADpibIbz0h2WfO6dNpnpr9/t2mtxacMNU34pzwNri7TebUw6kCVqXmIVWmglaK
fndJ1BAUsLxUdzv9S+D1d/5OF50EgWAiNLynUoln+EBlFm97ex2gmpzHb+CNIFo1
aGUHGuzi8vzoOAI7yftC/wAGatuBB/wcNL2RFT16o1gie/Sgg/CZ7UxrhBq6UDXJ
w/Au5FRImaB5AIm1/9h+6QYC54XibQ==
=ScSY
-----END PGP SIGNATURE-----

--Sig_/+vw5IVO+J3zmlwmwG4kuzgA--
