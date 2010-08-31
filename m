From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: kdump regression compared to v2.6.35
Date: Tue, 31 Aug 2010 11:22:40 +0200
Message-ID: <4C7CC9E0.20501@kernel.org>
References: <2044609874.1606211283216015254.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2044609874.1606211283216015254.JavaMail.root-k5qu2F3t005+R5eDjrG6zsCp5Q1pQRjfhaY/URYTgi6ny3qCrzbmXA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hello,

Thanks for verifyiing.  Can you please apply this patch on top and
check that those debug messages go away?

Thanks.

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c8183b2..7855429 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -196,7 +196,7 @@ typedef cpumask_var_t mayday_mask_t;
 	cpumask_test_and_set_cpu((cpu), (mask))
 #define mayday_clear_cpu(cpu, mask)		cpumask_clear_cpu((cpu), (mask))
 #define for_each_mayday_cpu(cpu, mask)		for_each_cpu((cpu), (mask))
-#define alloc_mayday_mask(maskp, gfp)		alloc_cpumask_var((maskp), (gfp))
+#define alloc_mayday_mask(maskp, gfp)		zalloc_cpumask_var((maskp), (gfp))
 #define free_mayday_mask(mask)			free_cpumask_var((mask))
 #else
 typedef unsigned long mayday_mask_t;
