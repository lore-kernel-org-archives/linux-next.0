From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 13 Jan 2016 17:18:30 +1100
Message-ID: <20160113171830.57bc8089@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44336 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750752AbcAMGSc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jan 2016 01:18:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, David Rientjes <rientjes@google.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/vmalloc.c: In function '__vunmap':
mm/vmalloc.c:1482:21: error: 'VM_VPAGES' undeclared (first use in this function)
   if (area->flags & VM_VPAGES)
                     ^

Caused by commit

  7ab2843f2735 ("mm, vmalloc: remove VM_VPAGES")

Yesterday, there was a previous commit (which seems to have been
removed)

  "tree wide: use kvfree() than conditional kfree()/vfree()"

that removed this use of the VM_VPAGES flag.

I have reverted this commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
