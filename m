From: Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: kexec load failure introduced by "x86,
	memblock: Replace e820_/_early string with memblock_"
Date: Sun, 26 Sep 2010 22:58:45 -0700
Message-ID: <4CA03295.2060809@kernel.org>
References: <870873343.2003871285555329846.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <870873343.2003871285555329846.JavaMail.root-k5qu2F3t005+R5eDjrG6zsCp5Q1pQRjfhaY/URYTgi6ny3qCrzbmXA@public.gmane.org>
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
Cc: linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Please check this one on top of tip or next.

Thanks

Yinghai

[PATCH] x86, memblock: Fix crashkernel allocation

Cai Qian found that crashkernel is broken with x86 memblock changes
1. crashkernel=128M@32M always reported that range is used, even first kernel is small
   no one use that range
2. always get following report when using "kexec -p"
	Could not find a free area of memory of a000 bytes...
	locate_hole failed

The root cause is that generic memblock_find_in_range() will try to get range from top_down.
But crashkernel do need from low and specified range.

Let's limit the target range with rash_base + crash_size to make sure that
We get range from bottom.

Reported-and-Bisected-by: CAI Qian <caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---
 arch/x86/kernel/setup.c |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

Index: linux-2.6/arch/x86/kernel/setup.c
===================================================================
--- linux-2.6.orig/arch/x86/kernel/setup.c
+++ linux-2.6/arch/x86/kernel/setup.c
@@ -516,19 +516,28 @@ static void __init reserve_crashkernel(v
 
 	/* 0 means: find the address automatically */
 	if (crash_base <= 0) {
+		unsigned long long start = 0;
 		const unsigned long long alignment = 16<<20;	/* 16M */
 
-		crash_base = memblock_find_in_range(alignment, ULONG_MAX, crash_size,
-				 alignment);
-		if (crash_base == MEMBLOCK_ERROR) {
+		crash_base = alignment;
+		while (crash_base < 0xffffffff) {
+			start = memblock_find_in_range(crash_base,
+				crash_base + crash_size, crash_size, alignment);
+
+			if (start == crash_base)
+				break;
+
+			crash_base += alignment;
+		}
+		if (start != crash_base) {
 			pr_info("crashkernel reservation failed - No suitable area found.\n");
 			return;
 		}
 	} else {
 		unsigned long long start;
 
-		start = memblock_find_in_range(crash_base, ULONG_MAX, crash_size,
-				 1<<20);
+		start = memblock_find_in_range(crash_base,
+				 crash_base + crash_size, crash_size, 1<<20);
 		if (start != crash_base) {
 			pr_info("crashkernel reservation failed - memory is in use.\n");
 			return;
