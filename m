From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next:  rr_cpumask tree build failure
Date: Mon, 29 Dec 2008 08:31:38 -0800
Message-ID: <4958FB6A.1060909@sgi.com>
References: <20081230025557.89d2565e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:46599 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751560AbYL2Qbm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 11:31:42 -0500
In-Reply-To: <20081230025557.89d2565e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> drivers/base/cpu.c: In function 'print_cpus_kernel_max':
> drivers/base/cpu.c:136: error: 'CONFIG_NR_CPUS' undeclared (first use in this function)
> 
> Caused by commit e057d7aea9d8f2a46cd440d8bfb72245d4e72d79 ("cpumask: add
> sysfs displays for configured and disabled cpu maps") from the rr_cpumask
> tree.  Powerpc (at least) does not define CONFIG_NR_CPUS for a non SMP
> build.
> 
> I have reverted that commit for today.

Hi Stephen,

This was my fault.  I thought that:

	cpumask: make CONFIG_NR_CPUS always valid.
	From: Rusty Russell <rusty@rustcorp.com.au>

was already present upstream.  This would be the better fix, but as a short
term fix, you can use the following patch.

Thanks,
Mike
---
 drivers/base/cpu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6-for-ingo.orig/drivers/base/cpu.c
+++ linux-2.6-for-ingo/drivers/base/cpu.c
@@ -133,7 +133,7 @@ print_cpus_func(present);
  */
 static ssize_t print_cpus_kernel_max(struct sysdev_class *class, char *buf)
 {
-	int n = snprintf(buf, PAGE_SIZE-2, "%d\n", CONFIG_NR_CPUS - 1);
+	int n = snprintf(buf, PAGE_SIZE-2, "%d\n", NR_CPUS - 1);
 	return n;
 }
 static SYSDEV_CLASS_ATTR(kernel_max, 0444, print_cpus_kernel_max, NULL);
