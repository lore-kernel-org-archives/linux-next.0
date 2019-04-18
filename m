From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf-next tree
Date: Thu, 18 Apr 2019 11:57:48 +1000
Message-ID: <20190418115748.0b0aefdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Uey02cAE9AV_yMzV/uuoi04"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Uey02cAE9AV_yMzV/uuoi04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (powerpc perf)
failed like this:

In file included from xsk.c:32:
libbpf_util.h:49:3: error: #warning Architecture missing native barrier fun=
ctions in libbpf_util.h. [-Werror=3Dcpp]
 # warning Architecture missing native barrier functions in libbpf_util.h.
   ^~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  b7e3a28019c9 ("libbpf: remove dependency on barrier.h in xsk.h")

I have applied the following patch for today ... please fix this.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Apr 2019 11:54:56 +1000
Subject: [PATCH] suppress warning in tools/lib/bpf/libbpf_util.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/lib/bpf/libbpf_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf_util.h b/tools/lib/bpf/libbpf_util.h
index 172b707e007b..a54eb2cdbdd6 100644
--- a/tools/lib/bpf/libbpf_util.h
+++ b/tools/lib/bpf/libbpf_util.h
@@ -46,7 +46,7 @@ do {				\
 # define libbpf_smp_mb() asm volatile("dmb ish" : : : "memory")
 # define libbpf_smp_rwmb() libbpf_smp_mb()
 #else
-# warning Architecture missing native barrier functions in libbpf_util.h.
+//# warning Architecture missing native barrier functions in libbpf_util.h.
 # define libbpf_smp_rmb() __sync_synchronize()
 # define libbpf_smp_wmb() __sync_synchronize()
 # define libbpf_smp_mb() __sync_synchronize()
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Uey02cAE9AV_yMzV/uuoi04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly32ZwACgkQAVBC80lX
0GwnQAf+IUy3PBBmu9rOY+hoEog4+s52xXFZ7p67Cn6Vh7n+VrZbhPl1NhyHjtEj
tms/einrmeJrRF4sFrkk6S79CWrfkZjH54SOTsj4KQaw1Us47zNiQIDFMZWIh5Fh
nCVen72GKjPoy8xXdk1IiQj9a2fb5gCyrnOUDNcqx04LITM4JKpSkCYNCYFODmKQ
3O4UEYUdEr98KDoYfb5XIkA6brL3+T0oJHObwSPAuUwwwPSKiBpWoKk5su9jximg
pLNwHVnFQqfHPZHknQ4bP6Q3f7P5V4U7uLuJFXpOg/738oQhvnHY0Usd+Jnkj/pd
ARlTMmW+1Elriz4fBS7XY4/VnMuXpQ==
=xoS5
-----END PGP SIGNATURE-----

--Sig_/Uey02cAE9AV_yMzV/uuoi04--
