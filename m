From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc64 build failure
Date: Tue, 8 Jul 2008 19:08:37 +1000
Message-ID: <20080708190837.bcdcbbd6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56974 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbYGHJIk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 05:08:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Greg KH <greg@kroah.com>

Hi David,

Today's linux-next build (sparc64 defconfig) failed like this:

arch/sparc64/kernel/sysfs.c:160: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:160: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:205: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:206: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:207: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:208: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:209: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:210: warning: initialization from incompatible pointer type
arch/sparc64/kernel/sysfs.c:211: warning: initialization from incompatible pointer type
make[2]: *** [arch/sparc64/kernel/sysfs.o] Error 1

Caused by commit 5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass
the attribute to the low level sysdev show/store function") from the
driver-core tree.  I have applied the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 2b3ba8b78163527dade51c5c92ce52526abbb198 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jul 2008 19:03:49 +1000
Subject: [PATCH] sparc64: sysdev API change fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc64/kernel/sysfs.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc64/kernel/sysfs.c b/arch/sparc64/kernel/sysfs.c
index b057bc1..47478ce 100644
--- a/arch/sparc64/kernel/sysfs.c
+++ b/arch/sparc64/kernel/sysfs.c
@@ -136,13 +136,13 @@ static unsigned long write_mmustat_enable(unsigned long val)
 	return sun4v_mmustat_conf(ra, &orig_ra);
 }
 
-static ssize_t show_mmustat_enable(struct sys_device *s, char *buf)
+static ssize_t show_mmustat_enable(struct sys_device *s, struct sysdev_attribute *attr, char *buf)
 {
 	unsigned long val = run_on_cpu(s->id, read_mmustat_enable, 0);
 	return sprintf(buf, "%lx\n", val);
 }
 
-static ssize_t store_mmustat_enable(struct sys_device *s, const char *buf, size_t count)
+static ssize_t store_mmustat_enable(struct sys_device *s, struct sysdev_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long val, err;
 	int ret = sscanf(buf, "%ld", &val);
@@ -180,14 +180,14 @@ static void unregister_mmu_stats(struct sys_device *s)
 #endif
 
 #define SHOW_CPUDATA_ULONG_NAME(NAME, MEMBER) \
-static ssize_t show_##NAME(struct sys_device *dev, char *buf) \
+static ssize_t show_##NAME(struct sys_device *dev, struct sysdev_attribute *attr, char *buf) \
 { \
 	cpuinfo_sparc *c = &cpu_data(dev->id); \
 	return sprintf(buf, "%lu\n", c->MEMBER); \
 }
 
 #define SHOW_CPUDATA_UINT_NAME(NAME, MEMBER) \
-static ssize_t show_##NAME(struct sys_device *dev, char *buf) \
+static ssize_t show_##NAME(struct sys_device *dev, struct sysdev_attribute *attr, char *buf) \
 { \
 	cpuinfo_sparc *c = &cpu_data(dev->id); \
 	return sprintf(buf, "%u\n", c->MEMBER); \
-- 
1.5.6.2
