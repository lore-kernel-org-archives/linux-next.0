From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 3 Dec 2018 18:00:37 +1100
Message-ID: <20181203180037.0a54279b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hcrQ6VYBsCI2iAv9yWDouQ/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hcrQ6VYBsCI2iAv9yWDouQ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc_le perf)
failed like this:

bench/numa.c:37:10: fatal error: linux/numa.h: No such file or directory
 #include <linux/numa.h>
          ^~~~~~~~~~~~~~

Caused by patches

  "mm: replace all open encodings for NUMA_NO_NODE"
  "mm-replace-all-open-encodings-for-numa_no_node-fix"

For linux/numa.h to be generally availble to the tools builds, it must
be copied into tools/include/linux ...

I have done that copy for today:

=46rom 6dabc11d5513510d0ec0a6b0a4aa8b9051b71516 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 3 Dec 2018 17:57:27 +1100
Subject: [PATCH] linux/numa.h is now needed for the perf build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/include/linux/numa.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 tools/include/linux/numa.h

diff --git a/tools/include/linux/numa.h b/tools/include/linux/numa.h
new file mode 100644
index 000000000000..110b0e5d0fb0
--- /dev/null
+++ b/tools/include/linux/numa.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_NUMA_H
+#define _LINUX_NUMA_H
+
+
+#ifdef CONFIG_NODES_SHIFT
+#define NODES_SHIFT     CONFIG_NODES_SHIFT
+#else
+#define NODES_SHIFT     0
+#endif
+
+#define MAX_NUMNODES    (1 << NODES_SHIFT)
+
+#define	NUMA_NO_NODE	(-1)
+
+#endif /* _LINUX_NUMA_H */
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/hcrQ6VYBsCI2iAv9yWDouQ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwE1JUACgkQAVBC80lX
0Gx3uwf/XtKl7r506aQV9Qv4NBzNtutKEKY4JSEbstSzqJHuC0w8ZztfXtk1VIuo
YYMk0m+HHxpjB7fysyspszX3YsQgY/mVyVup8sRF1kqwg4TSxjfNQOcRL2ntJuYu
w8uJKCuhSjBjNHS1GY5EZd1PT8DknHsmMwKJhMu5QKI7zxIrnoGaAd/TH7OpH83i
eCDFMZkjfOup29vpY27yRzSri21D46BOtmQKSrXFU2HC5w3P9JHQObKm4K3AiLzU
VFv7USgo5aq9DCx75/8Vpg/MXZ6583hBw94wkBT5wGfdwGaTcdUDfmPUTdsoNqeW
Y6D/tln0loDaK1PDjyisBmJmTM2xBQ==
=VCno
-----END PGP SIGNATURE-----

--Sig_/hcrQ6VYBsCI2iAv9yWDouQ/--
