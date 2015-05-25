From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the userns tree
Date: Mon, 25 May 2015 20:39:00 +1000
Message-ID: <20150525203900.4a68a227@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B/jxBlfW6ZZa1hZqs4qeWma"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58514 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751846AbbEYKjQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 06:39:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--Sig_/B/jxBlfW6ZZa1hZqs4qeWma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

After merging the userns tree, today's linux-next build (powerpc allnoconfi=
g)
failed like this:

In file included from include/linux/kobject.h:21:0,
                 from include/linux/device.h:17,
                 from arch/powerpc/include/asm/io.h:27,
                 from arch/powerpc/include/asm/pgtable-ppc32.h:9,
                 from arch/powerpc/include/asm/pgtable.h:19,
                 from include/linux/mm.h:53,
                 from include/linux/pid_namespace.h:6,
                 from include/linux/ptrace.h:8,
                 from arch/powerpc/mm/fault.c:24:
include/linux/sysfs.h: In function 'sysfs_remove_mount_point':
include/linux/sysfs.h:314:2: error: 'return' with a value, in function retu=
rning void [-Werror]
  return 0;
  ^

and many more :-(

Caused by commit f7e299595408 ("sysfs: Add support for permanently
empty directories to serve as mount points.").

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2015 20:20:44 +1000
Subject: [PATCH] sysfs: void functions do not return values

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/sysfs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 3e7e41acc451..9f65758311a4 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -311,7 +311,6 @@ static inline int sysfs_create_mount_point(struct kobje=
ct *parent_kobj,
 static inline void sysfs_remove_mount_point(struct kobject *parent_kobj,
 					    const char *name)
 {
-	return 0;
 }
=20
 static inline int sysfs_create_file_ns(struct kobject *kobj,
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/B/jxBlfW6ZZa1hZqs4qeWma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYvvRAAoJEMDTa8Ir7ZwVkdQP/RPfYRNCppC2yqajmZbP0Ufz
LKJIVdgeDwo+SQUF3ZTYfZcyqegqNeJyKgSueWMfch3PHFu1w+fIIDWTDuSgLRAE
+uchoE3cDSQldqaqBpbDwNRH1i6i/u8A7koCqY5KvoAV2TXLkjRb225/fOdTnkl5
yNX2uAIzEIA+5CEZeuzIEMQXaE/UVHlvsafG3d1QhCpU/SGzVkrvtPxHcstFcHzw
i9WYYqK5ioK2dMbGQdZ3W6a6/L8h5vvtHQSAerbhOc8+UgjhG06Yt2nWKJY96iSH
s0pKLth170vM3+xsfsNzZtdjyiOJC8AFGLymainrlc6D/iFcu18NiApmMZRyfL/+
XDMTo+5CHcc3Nb9AQqe5zoHZDjyvGLNlswzzDbuwwRyOMSUOeqRRrGuuMrQ/pPWK
jYpgWHtmJjCQl4AKSnpSHQMe2/NVCIZbuPrWTE+Mh5uvviH3bv+KsOcSHjjbIitk
CShIr8tpr0pfzbXBloF5JuTOnMQtKZ9Ceyp/+bTVU4vG5oO+vFi1rRBF5SxNGS25
UomkHYMKRylE9psWSL0w59knmPia1Fl6HUttno9YIalp62On85AH7CSEkXNPKMB1
mb00v+9i9prXqJBgd9DULu46aWgzfKfqDYW1FHG4rPmZyDPsLdpqsnJ9ElyF7HwJ
/PsAjMDDq8B2ObQpj9Uj
=3WVJ
-----END PGP SIGNATURE-----

--Sig_/B/jxBlfW6ZZa1hZqs4qeWma--
