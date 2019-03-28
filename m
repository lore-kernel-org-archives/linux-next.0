From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pidfd tree
Date: Thu, 28 Mar 2019 13:04:49 +1100
Message-ID: <20190328130449.1b6334b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//=5FdznmUlmW7Bpp8qftFJQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//=5FdznmUlmW7Bpp8qftFJQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

After merging the pidfd tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/pid.c: In function '__do_sys_pidfd_open':
kernel/pid.c:652:7: error: 'fd' redeclared as different kind of symbol
  long fd =3D -EINVAL;
       ^~
In file included from kernel/pid.c:40:
kernel/pid.c:649:46: note: previous definition of 'fd' was here
 SYSCALL_DEFINE4(pidfd_open, pid_t, pid, int, fd, int, pidfd,
                                         ~~~~~^~
include/linux/syscalls.h:117:27: note: in definition of macro '__SC_DECL'
 #define __SC_DECL(t, a) t a
                           ^
include/linux/syscalls.h:112:35: note: in expansion of macro '__MAP3'
 #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
                                   ^~~~~~
include/linux/syscalls.h:115:22: note: in expansion of macro '__MAP4'
 #define __MAP(n,...) __MAP##n(__VA_ARGS__)
                      ^~~~~
include/linux/syscalls.h:253:36: note: in expansion of macro '__MAP'
  static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
                                    ^~~~~
include/linux/syscalls.h:226:2: note: in expansion of macro '__SYSCALL_DEFI=
NEx'
  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
  ^~~~~~~~~~~~~~~~~
include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFIN=
Ex'
 #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                    ^~~~~~~~~~~~~~~
kernel/pid.c:649:1: note: in expansion of macro 'SYSCALL_DEFINE4'
 SYSCALL_DEFINE4(pidfd_open, pid_t, pid, int, fd, int, pidfd,
 ^~~~~~~~~~~~~~~
kernel/pid.c:663:7: error: 'procfd' undeclared (first use in this function)=
; did you mean 'pidfd'?
   if (procfd !=3D -1 || pidfd !=3D -1)
       ^~~~~~
       pidfd
kernel/pid.c:663:7: note: each undeclared identifier is reported only once =
for each function it appears in

Caused by commit

  9170fba40db0 ("pid: add pidfd_open()")

I have used the version of the pifd tree from next-20190327 for today.

Please do *not* use linux-next as a development tree (I have seen several
different version of this code over the past few days :-().  The rules
for linux-next included code include:
"
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch)."
--=20
Cheers,
Stephen Rothwell

--Sig_//=5FdznmUlmW7Bpp8qftFJQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlycK8EACgkQAVBC80lX
0Gz/Mwf/ft0Rk8vI7Foboq9hZ5mME9ACTbQsNk0x6104F/aQBEkPvryIsACJanv9
BZMeeoRmlFmQoVS6Oef7gidSDcvwNcm9xVygyoI0z37elPVZBN+ycvkhG32nz4I4
dt4jeWyWi73eMv0/OlqCFgHU29OW2OpcwBuTWQPjtBj/JPsGG85sYQXFIdn2HW1m
Zi8MO7PH/JMyBdgFrGTZei64ZqJkWSsNX3mAQlbwPeHsa2jiaMwqMz5fyU3k2nEl
5LnZIbV7mWPFFFYIFso87SzP9twmYIGY17IF30A1rl3EOQAlzvxjQYrLahhrL0zW
FHPm/F3MxUZQHCgl1muqNh2vlR+HTg==
=5XrG
-----END PGP SIGNATURE-----

--Sig_//=5FdznmUlmW7Bpp8qftFJQ--
