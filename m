From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: fastboot tree build warning
Date: Thu, 4 Sep 2008 12:04:25 +0200
Message-ID: <20080904100425.GA25428@elte.hu>
References: <20080903173448.55f2745b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:33708 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753296AbYIDKE6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Sep 2008 06:04:58 -0400
Content-Disposition: inline
In-Reply-To: <20080903173448.55f2745b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arjan van de Ven <arjan@linux.intel.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Arjan,
>=20
> The linux-next build produces the following warning:
>=20
> init/do_mounts_md.c: In function 'md_run_setup':
> init/do_mounts_md.c:282: warning: ISO C90 forbids mixed declarations =
and code
>=20
> Introduced by commit b52c36a95ed8026b6925fe8595ebcab6921ae62d ("fastb=
oot:
> make the raid autodetect code wait for all devices to init").

i have this already fixed via the commit below - not yet pushed into th=
e=20
auto branches.

	Ingo

------------------>
=46rom 606bd348acae9dc99f7f01a4cb3a416c7c753e9d Mon Sep 17 00:00:00 200=
1
=46rom: Ingo Molnar <mingo@elte.hu>
Date: Mon, 18 Aug 2008 12:54:00 +0200
Subject: [PATCH] warning: fix init do_mounts_md c
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit

fix warning:

  init/do_mounts_md.c: In function =E2=80=98md_run_setup=E2=80=99:
  init/do_mounts_md.c:282: warning: ISO C90 forbids mixed declarations =
and code

also, use the opportunity to put the RAID autodetection code
into a separate function - this also solves a checkpatch style warning.

No code changed:

md5:
   aa36a35faef371b05f1974ad583bdbbd  do_mounts_md.o.before.asm
   aa36a35faef371b05f1974ad583bdbbd  do_mounts_md.o.after.asm

Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 init/do_mounts_md.c |   36 +++++++++++++++++++++---------------
 1 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/init/do_mounts_md.c b/init/do_mounts_md.c
index 1ec5c41..c0dfd3c 100644
--- a/init/do_mounts_md.c
+++ b/init/do_mounts_md.c
@@ -264,26 +264,32 @@ static int __init raid_setup(char *str)
 __setup("raid=3D", raid_setup);
 __setup("md=3D", md_setup);
=20
+static void autodetect_raid(void)
+{
+	int fd;
+
+	/*
+	 * Since we don't want to detect and use half a raid array, we need t=
o
+	 * wait for the known devices to complete their probing
+	 */
+	printk(KERN_INFO "md: Waiting for all devices to be available before =
autodetect\n");
+	printk(KERN_INFO "md: If you don't use raid, use raid=3Dnoautodetect\=
n");
+	while (driver_probe_done() < 0)
+		msleep(100);
+	fd =3D sys_open("/dev/md0", 0, 0);
+	if (fd >=3D 0) {
+		sys_ioctl(fd, RAID_AUTORUN, raid_autopart);
+		sys_close(fd);
+	}
+}
+
 void __init md_run_setup(void)
 {
 	create_dev("/dev/md0", MKDEV(MD_MAJOR, 0));
=20
 	if (raid_noautodetect)
 		printk(KERN_INFO "md: Skipping autodetection of RAID arrays. (raid=3D=
noautodetect)\n");
-	else {
-		/*=20
-		 * Since we don't want to detect and use half a raid array, we need =
to
-		 * wait for the known devices to complete their probing
-		 */
-		printk(KERN_INFO "md: Waiting for all devices to be available before=
 autodetect\n");
-		printk(KERN_INFO "md: If you don't use raid, use raid=3Dnoautodetect=
\n");
-		while (driver_probe_done() < 0)
-			msleep(100);
-		int fd =3D sys_open("/dev/md0", 0, 0);
-		if (fd >=3D 0) {
-			sys_ioctl(fd, RAID_AUTORUN, raid_autopart);
-			sys_close(fd);
-		}
-	}
+	else
+		autodetect_raid();
 	md_setup_drive();
 }
