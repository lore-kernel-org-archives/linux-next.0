From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Thu, 6 Dec 2018 17:21:28 +1100
Message-ID: <20181206172128.71293ced@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2iD5IIBb4V8tL44Zu29DhN3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2iD5IIBb4V8tL44Zu29DhN3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

In file included from arch/powerpc/include/asm/local.h:144,
                 from include/linux/genhd.h:20,
                 from block/genhd.c:7:
block/genhd.c: In function 'part_inc_in_flight':
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:31:40: note: in definition of macro 'local_inc'
 #define local_inc(l) atomic_long_inc(&(l)->a)
                                        ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:56:13: note: in expansion of macro 'per_cpu_ptr'
  local_inc(&per_cpu_ptr(part->dkstats, cpu)->in_flight[rw]);
             ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:31:40: note: in definition of macro 'local_inc'
 #define local_inc(l) atomic_long_inc(&(l)->a)
                                        ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:56:13: note: in expansion of macro 'per_cpu_ptr'
  local_inc(&per_cpu_ptr(part->dkstats, cpu)->in_flight[rw]);
             ^~~~~~~~~~~
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:31:40: note: in definition of macro 'local_inc'
 #define local_inc(l) atomic_long_inc(&(l)->a)
                                        ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:58:14: note: in expansion of macro 'per_cpu_ptr'
   local_inc(&per_cpu_ptr(part_to_disk(part)->part0.dkstats, cpu)->in_fligh=
t[rw]);
              ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:31:40: note: in definition of macro 'local_inc'
 #define local_inc(l) atomic_long_inc(&(l)->a)
                                        ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:58:14: note: in expansion of macro 'per_cpu_ptr'
   local_inc(&per_cpu_ptr(part_to_disk(part)->part0.dkstats, cpu)->in_fligh=
t[rw]);
              ^~~~~~~~~~~
block/genhd.c: In function 'part_dec_in_flight':
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:32:40: note: in definition of macro 'local_dec'
 #define local_dec(l) atomic_long_dec(&(l)->a)
                                        ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:69:13: note: in expansion of macro 'per_cpu_ptr'
  local_dec(&per_cpu_ptr(part->dkstats, cpu)->in_flight[rw]);
             ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:32:40: note: in definition of macro 'local_dec'
 #define local_dec(l) atomic_long_dec(&(l)->a)
                                        ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:69:13: note: in expansion of macro 'per_cpu_ptr'
  local_dec(&per_cpu_ptr(part->dkstats, cpu)->in_flight[rw]);
             ^~~~~~~~~~~
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:32:40: note: in definition of macro 'local_dec'
 #define local_dec(l) atomic_long_dec(&(l)->a)
                                        ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:71:14: note: in expansion of macro 'per_cpu_ptr'
   local_dec(&per_cpu_ptr(part_to_disk(part)->part0.dkstats, cpu)->in_fligh=
t[rw]);
              ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:32:40: note: in definition of macro 'local_dec'
 #define local_dec(l) atomic_long_dec(&(l)->a)
                                        ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:71:14: note: in expansion of macro 'per_cpu_ptr'
   local_dec(&per_cpu_ptr(part_to_disk(part)->part0.dkstats, cpu)->in_fligh=
t[rw]);
              ^~~~~~~~~~~
block/genhd.c: In function 'part_in_flight':
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:85:27: note: in expansion of macro 'per_cpu_ptr'
   inflight +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[0])=
 +
                           ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:85:27: note: in expansion of macro 'per_cpu_ptr'
   inflight +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[0])=
 +
                           ^~~~~~~~~~~
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:86:17: note: in expansion of macro 'per_cpu_ptr'
     local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[1]);
                 ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:86:17: note: in expansion of macro 'per_cpu_ptr'
     local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[1]);
                 ^~~~~~~~~~~
block/genhd.c: In function 'part_in_flight_rw':
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:107:30: note: in expansion of macro 'per_cpu_ptr'
   inflight[0] +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[=
0]);
                              ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:107:30: note: in expansion of macro 'per_cpu_ptr'
   inflight[0] +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[=
0]);
                              ^~~~~~~~~~~
include/linux/percpu-defs.h:219:52: error: invalid operands to binary + (ha=
ve 'struct disk_stats' and 'int')
  const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL; \
                                              ~~~~~ ^
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:259:2: note: in expansion of macro '__verify_pc=
pu_ptr'
  __verify_pcpu_ptr(__p);      \
  ^~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:108:30: note: in expansion of macro 'per_cpu_ptr'
   inflight[1] +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[=
1]);
                              ^~~~~~~~~~~
include/linux/percpu-defs.h:260:10: error: invalid type argument of unary '=
*' (have 'struct disk_stats')
  (typeof(*(__p)) __kernel __force *)(__p);   \
          ^~~~~~
include/asm-generic/local.h:29:42: note: in definition of macro 'local_read'
 #define local_read(l) atomic_long_read(&(l)->a)
                                          ^
include/linux/percpu-defs.h:263:47: note: in expansion of macro 'VERIFY_PER=
CPU_PTR'
 #define per_cpu_ptr(ptr, cpu) ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                               ^~~~~~~~~~~~~~~~~
block/genhd.c:108:30: note: in expansion of macro 'per_cpu_ptr'
   inflight[1] +=3D local_read(&per_cpu_ptr(part->dkstats, cpu)->in_flight[=
1]);
                              ^~~~~~~~~~~

Caused by commit

  3a657cf59109 ("block: switch to per-cpu in-flight counters")

This build does not have CONFIG_SMP set and part->dkstats is not a
pointer in this case.

I have reverted the device-mapper tree changes for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/2iD5IIBb4V8tL44Zu29DhN3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIv+gACgkQAVBC80lX
0GzxcQgAokWkGRcssRyDFC6ojyPb9RygJfoGmKSTgnXkGxaevXEeN35HhECJbeiX
KgjCohj2orE/S6I629cKxyuOgH3XP3hOkXtvHO8mRaJdE+dMDKEI23IC2ZckJn13
u9iqciCWLY12y9fTYuB8pdQnG6Ra981E+T4aIRH9YOIEDcfPcSHNCcZxKU/kQnCn
dZobFbOZSLFIa0TW2ejO+UfE73brbegg1dkqnsuo0PIwIvVSINQHssxJAdvWLbTp
47UqGcy0gboFot0jR0xNqGqWehDDkB0kODtyU8Bw2dwssDU8mgW2pAm26HQ/y5eP
8NHE/O8BFVbuKjgoZ+Te7xJnagWTnA==
=UQX8
-----END PGP SIGNATURE-----

--Sig_/2iD5IIBb4V8tL44Zu29DhN3--
