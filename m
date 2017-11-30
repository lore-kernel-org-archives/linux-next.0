From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 30 Nov 2017 14:46:53 +1100
Message-ID: <20171130144653.1e2e7fab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752684AbdK3Dq4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Nov 2017 22:46:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

mm/list_lru.c: In function 'list_lru_del':
mm/list_lru.c:141:2: error: implicit declaration of function 'prefetchw' [-Werror=implicit-function-declaration]
  prefetchw(item->prev);
  ^

Caused by commit

  9b4516980e87 ("mm/list_lru.c: prefetch neighboring list entries before acquiring lock")

Missing include of linux/prefetch.h?

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
