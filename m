From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] cpufreq: provide cpufreq_get stub
Date: Tue, 6 Oct 2009 11:02:11 -0700
Message-ID: <20091006110211.139b91e5.randy.dunlap@oracle.com>
References: <20091006165220.b5cb1c44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:25004 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932881AbZJFSL3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2009 14:11:29 -0400
In-Reply-To: <20091006165220.b5cb1c44.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Avi Kivity <avi@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

When CONFIG_CPU_FREQ is disabled, cpufreq_get() needs a stub.
Used by kvm (although it looks like a bit of the kvm code could
be omitted when CONFIG_CPU_FREQ is disabled).

arch/x86/built-in.o: In function `kvm_arch_init':
(.text+0x10de7): undefined reference to `cpufreq_get'
 
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/cpufreq.h |    7 +++++++
 1 file changed, 7 insertions(+)

--- linux-next-20091006.orig/include/linux/cpufreq.h
+++ linux-next-20091006/include/linux/cpufreq.h
@@ -291,8 +291,15 @@ struct global_attr {
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
 int cpufreq_update_policy(unsigned int cpu);
 
+#ifdef CONFIG_CPU_FREQ
 /* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
 unsigned int cpufreq_get(unsigned int cpu);
+#else
+static inline unsigned int cpufreq_get(unsigned int cpu)
+{
+	return 0;
+}
+#endif
 
 /* query the last known CPU freq (in kHz). If zero, cpufreq couldn't detect it */
 #ifdef CONFIG_CPU_FREQ
---
~Randy
