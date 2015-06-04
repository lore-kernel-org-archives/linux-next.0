From: Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 4 Jun 2015 15:56:23 +0200
Message-ID: <20150604135623.GC19219@redhat.com>
References: <20150604222928.0d64b6b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50399 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752331AbbFDN4Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 09:56:25 -0400
Content-Disposition: inline
In-Reply-To: <20150604222928.0d64b6b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Thu, Jun 04, 2015 at 10:29:28PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> ./usr/include/linux/userfaultfd.h:14: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> Introduced by commit 2873f48b446c ("userfaultfd: uAPI").

Here's the fix:

===
>From 02b31b0a5e9dd5ddbcb4ad86f63fbcb0a2b5d8f2 Mon Sep 17 00:00:00 2001
From: Andrea Arcangeli <aarcange@redhat.com>
Date: Thu, 4 Jun 2015 14:54:40 +0200
Subject: [PATCH] userfaultfd: uAPI: add missing include/types.h

This will avoid the below warning:

./usr/include/linux/userfaultfd.h:14: found __[us]{8,16,32,64} type
without #include <linux/types.h>

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 include/uapi/linux/userfaultfd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
index 9a8cd56..09c2e2a 100644
--- a/include/uapi/linux/userfaultfd.h
+++ b/include/uapi/linux/userfaultfd.h
@@ -9,6 +9,8 @@
 #ifndef _LINUX_USERFAULTFD_H
 #define _LINUX_USERFAULTFD_H
 
+#include <linux/types.h>
+
 #define UFFD_API ((__u64)0xAA)
 /* FIXME: add "|UFFD_BIT_WP" to UFFD_API_BITS after implementing it */
 #define UFFD_API_BITS (UFFD_BIT_WRITE)
