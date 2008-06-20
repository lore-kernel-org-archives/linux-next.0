From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Jun 2008 13:42:48 +0200
Message-ID: <20080620114247.GY20851@kernel.dk>
References: <20080620124235.24fbe33e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:13386 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbYFTLmu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 07:42:50 -0400
Content-Disposition: inline
In-Reply-To: <20080620124235.24fbe33e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, heiko.carstens@de.ibm.com

On Fri, Jun 20 2008, Stephen Rothwell wrote:
> Hi Martin,
> 
> Starting with next-20080613, the linux-next build (s390 defconfig s390x
> compiler) has failed with these errors:
> 
> In file included from /scratch/michael/kisskb-build/src/include/linux/spinlock.h:87,
>                  from /scratch/michael/kisskb-build/src/include/linux/smp.h:11,
>                  from /scratch/michael/kisskb-build/src/include/linux/kernel_stat.h:4,
>                  from /scratch/michael/kisskb-build/src/mm/memory.c:41:
> include2/asm/spinlock.h: In function '__raw_spin_lock':
> include2/asm/spinlock.h:69: error: implicit declaration of function 'smp_processor_id'
> 
> There are others as well, but I was concentrating on this.  Bisecting
> leads to commit 2448ad3d8e64a9b58acca34a3d010cfa0be88cc1 which is the
> merge of the block tree.  The block tree contains a commit
> (37e81b98dba08cce1d8eedb2bdaa58022bf31ee0 "Add generic helpers for arch
> IPI function calls") that adds an include of linux/spinlock.h to
> linux/smp.h. (asm-s390/spinlock.h includes linux/smp.h ...)
> 
> But the block tree itself is OK.  So something in the s390 tree is
> interacting with the above commit to cause the failure.  It is not
> immediately obvious to me what that is. (Or I may have screwed up the
> bisect :-))

Heiko was looking into this, I had forgotten about it. Heiko, did you
find an adequate solution to this?

-- 
Jens Axboe

