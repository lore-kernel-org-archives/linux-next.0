From: vibi sreenivasan <vibi_sreenivasan@cms.com>
Subject: FIX for "kernel/sched.c:7743: warning: initialization from
	incompatible pointer type"
Date: Thu, 10 Jul 2008 14:54:22 +0530
Message-ID: <1215681862.2956.46.camel@localhost.localdomain>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailgw3.cms.com ([202.75.200.223]:60936 "EHLO ms4l.cms.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752317AbYGJJSM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 05:18:12 -0400
Received: from localhost (mailgw3.cms.com [127.0.0.1])
	by ms4l.cms.com (Postfix) with ESMTP id 34EA411C009
	for <linux-next@vger.kernel.org>; Thu, 10 Jul 2008 14:54:54 +0530 (IST)
Received: from [172.19.23.13] (unknown [172.19.23.13])
	by ms4l.cms.com (Postfix) with ESMTP id 845B911C002
	for <linux-next@vger.kernel.org>; Thu, 10 Jul 2008 14:54:52 +0530 (IST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

hello,
i have tried compiling linux-next tree by git clone 1 hour before (using
git for first time). I tried compiling like this
make mrproper
make i386_defconfig
make bzImage

& got kernel/sched.c:7743: warning: initialization from incompatible
pointer type

i have seen that

SYSDEV_ATTR macro expects function pointer with prototype 
ssize_t (*show)(struct sys_device *, struct sysdev_attribute *, char *);
ssize_t (*store)(struct sys_device *, struct sysdev_attribute *,
			 const char *, size_t);
but actual function omits 2nd argument.
--- linux-next/kernel/sched.c	2008-07-10 12:08:18.000000000 +0530
+++ linux-next-fix/kernel/sched.c	2008-07-10 14:07:05.000000000 +0530
@@ -7731,12 +7731,13 @@ static ssize_t sched_power_savings_store
 }
 
 #ifdef CONFIG_SCHED_MC
-static ssize_t sched_mc_power_savings_show(struct sys_device *dev, char
*page)
+static ssize_t sched_mc_power_savings_show(struct sys_device *dev,
+			struct sysdev_attribute *attribute, char *page)
 {
 	return sprintf(page, "%u\n", sched_mc_power_savings);
 }
 static ssize_t sched_mc_power_savings_store(struct sys_device *dev,
-					    const char *buf, size_t count)
+		struct sysdev_attribute *attribute,const char *buf, size_t count)
 {
 	return sched_power_savings_store(buf, count, 0);
 }

PLEASE REVIEW THIS & PARDON ME IF I HAVE WASTED UR TIME ,I AM NOT
EXPERIENCED AS YOU ALL.
Thanks & Regards
vibi sreenivasan
