From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 16:00:14 -0700
Message-ID: <20150716160014.52ea5ad371eaf2b2f42f3842@linux-foundation.org>
References: <20150716152600.0ec446c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37143 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754864AbbGPXAP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 19:00:15 -0400
In-Reply-To: <20150716152600.0ec446c2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, 16 Jul 2015 15:26:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> lib/genalloc.c: In function 'gen_pool_get':
> /scratch/sfr/next/lib/genalloc.c:599:6: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type
>   p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match, name);
>       ^
> In file included from /scratch/sfr/next/include/linux/node.h:17:0,
>                  from /scratch/sfr/next/include/linux/cpu.h:16,
>                  from /scratch/sfr/next/include/linux/of_device.h:4,
>                  from /scratch/sfr/next/lib/genalloc.c:37:
> /scratch/sfr/next/include/linux/device.h:620:14: note: expected 'void *' but argument is of type 'const char *'
>  extern void *devres_find(struct device *dev, dr_release_t release,
>               ^
> 
> Caused by commit
> 
>   e89a70fd54f2 ("genalloc: add support of multiple gen_pools per device")

urgh.  devres_find()'s `void *match' argument should always have been const.

I started to fix that but the fix spreads like a virus - by the time I had a
700 line diff I gave up.

So I guess we cast away the constness at the caller, like all the other
callers do :(

--- a/lib/genalloc.c~genalloc-add-support-of-multiple-gen_pools-per-device-fix
+++ a/lib/genalloc.c
@@ -596,7 +596,8 @@ struct gen_pool *gen_pool_get(struct dev
 {
 	struct gen_pool **p;
 
-	p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match, name);
+	p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match,
+			(void *)name);
 	if (!p)
 		return NULL;
 	return *p;
_
