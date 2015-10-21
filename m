From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 20 Oct 2015 23:48:41 -0700
Message-ID: <20151020234841.d996737d.akpm@linux-foundation.org>
References: <20151021173438.08f16380@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51308 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbbJUGqB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2015 02:46:01 -0400
In-Reply-To: <20151021173438.08f16380@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>

On Wed, 21 Oct 2015 17:34:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> allnoconfig and others) failed like this:
> 
> In file included from init/main.c:50:0:
> include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
> 
> Caused by commit
> 
>   e4f28388eb72 ("mm: simplify reclaim path for MADV_FREE")
> 
> Discovered after the linux-next release.

argh, we broke nommu.

--- a/include/linux/rmap.h~mm-dont-split-thp-page-when-syscall-is-called-fix-6-fix
+++ a/include/linux/rmap.h
@@ -270,7 +270,7 @@ int rmap_walk(struct page *page, struct 
 
 static inline int page_referenced(struct page *page, int is_locked,
 				  struct mem_cgroup *memcg,
-				  unsigned long *vm_flags,
+				  unsigned long *vm_flags)
 {
 	*vm_flags = 0;
 	return 0;
