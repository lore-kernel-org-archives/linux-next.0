From: vibi sreenivasan <vibi_sreenivasan@cms.com>
Subject: [PATCH linux-next] Changed arguments to show & store methods for
	struct sysdev_attribute in  kernel/sched.c
Date: Fri, 11 Jul 2008 16:52:25 +0530
Message-ID: <1215775345.2995.42.camel@localhost.localdomain>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailgw3.cms.com ([202.75.200.223]:58959 "EHLO ms4l.cms.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755494AbYGKLQV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 07:16:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

Hello,
From: Vibi sreenivasan <vibi_sreenivasan@cms.com>

FIXES THIS :

CC      kernel/sched.o
kernel/sched.c:7743: warning: initialization from incompatible pointer
type
kernel/sched.c:7743: warning: initialization from incompatible pointer
type
 
caused by mismatch of function prototype of show & store method in
struct sysdev_attribute

Signed-off-by: Vibi sreenivasan <vibi_sreenivasan@cms.com>


diff --git a/kernel/sched.c b/kernel/sched.c
index 96cee36..8e83460 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -7731,12 +7731,13 @@ static ssize_t sched_power_savings_store(const
char *buf, size_t count, int smt)
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
@@ -7745,12 +7746,13 @@ static SYSDEV_ATTR(sched_mc_power_savings, 0644,
sched_mc_power_savings_show,
 #endif
 
 #ifdef CONFIG_SCHED_SMT
-static ssize_t sched_smt_power_savings_show(struct sys_device *dev,
char *page)
+static ssize_t sched_smt_power_savings_show(struct sys_device *dev,
+			struct sysdev_attribute *attribute, char *page)
 {
 	return sprintf(page, "%u\n", sched_smt_power_savings);
 }
 static ssize_t sched_smt_power_savings_store(struct sys_device *dev,
-					     const char *buf, size_t count)
+		struct sysdev_attribute *attribute, const char *buf, size_t count)
 {
 	return sched_power_savings_store(buf, count, 1);
 }

Thanks & Regards
vibi sreenivasan
