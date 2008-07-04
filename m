From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-0704: sparc64: build failure at arch/sparc64/kernel/sysfs.c
Date: Fri, 4 Jul 2008 16:20:32 +0400
Message-ID: <a4423d670807040520v7604782crd209d64aad9343ff__30575.8954528303$1215174099$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.233]:13510 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673AbYGDMUd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 08:20:33 -0400
Received: by wx-out-0506.google.com with SMTP id h29so509887wxd.4
        for <linux-next@vger.kernel.org>; Fri, 04 Jul 2008 05:20:32 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Andi Kleen <andi@firstfloor.org>, Greg Kroah-Hartman <gregkh@suse.de>, sparclinux@vger.kernel.org, Linux Kernel Mailing List <linux-kern>

Hi

cc1: warnings being treated as errors
arch/sparc64/kernel/sysfs.c:160: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:160: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:205: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:206: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:207: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:208: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:209: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:210: error: initialization from
incompatible pointer type
arch/sparc64/kernel/sysfs.c:211: error: initialization from
incompatible pointer type

I think it is connected to

commit 5b01a6a61c48d8e6ab4679d6e6208f5962d07b85
Author: Andi Kleen <andi@firstfloor.org>
Date:   Tue Jul 1 18:48:41 2008 +0200

    sysdev: Pass the attribute to the low level sysdev show/store function

    This allow to dynamically generate attributes and share show/store
    functions between attributes. Right now most attributes are generated
    by special macros and lots of duplicated code. With the attribute
    passed it's instead possible to attach some data to the attribute
    and then use that in shared low level functions to do different things.

    I need this for the dynamically generated bank attributes in the x86
    machine check code, but it'll allow some further cleanups.

    I converted all users in tree to the new show/store prototype. It's a single
    huge patch to avoid unbisectable sections.

    Runtime tested: x86-32, x86-64
    Compiled only: ia64, powerpc
    Not compile tested/only grep converted: sh, arm, avr32

    Signed-off-by: Andi Kleen <ak@linux.intel.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

diff --git a/arch/sparc64/kernel/sysfs.c b/arch/sparc64/kernel/sysfs.c
index e885034..b057bc1 100644
--- a/arch/sparc64/kernel/sysfs.c
+++ b/arch/sparc64/kernel/sysfs.c
@@ -14,7 +14,8 @@
 static DEFINE_PER_CPU(struct hv_mmu_statistics, mmu_stats)
__attribute__((aligned(64)));

 #define SHOW_MMUSTAT_ULONG(NAME) \
-static ssize_t show_##NAME(struct sys_device *dev, char *buf) \
+static ssize_t show_##NAME(struct sys_device *dev, \
+                       struct sysdev_attribute *attr, char *buf) \
 { \
        struct hv_mmu_statistics *p = &per_cpu(mmu_stats, dev->id); \
        return sprintf(buf, "%lu\n", p->NAME); \
