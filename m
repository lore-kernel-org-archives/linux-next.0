From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Sat, 21 Jun 2008 10:07:02 +0200
Message-ID: <20080621080702.GA4841@osiris.ibm.com>
References: <20080620124235.24fbe33e.sfr@canb.auug.org.au> <20080620114247.GY20851@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.de.ibm.com ([195.212.29.151]:53814 "EHLO
	mtagate2.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375AbYFUIHU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Jun 2008 04:07:20 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id m5L873E5113562
	for <linux-next@vger.kernel.org>; Sat, 21 Jun 2008 08:07:03 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com [9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5L873lL2859050
	for <linux-next@vger.kernel.org>; Sat, 21 Jun 2008 10:07:03 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5L872jh003415
	for <linux-next@vger.kernel.org>; Sat, 21 Jun 2008 10:07:03 +0200
Content-Disposition: inline
In-Reply-To: <20080620114247.GY20851@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org

On Fri, Jun 20, 2008 at 01:42:48PM +0200, Jens Axboe wrote:
> On Fri, Jun 20 2008, Stephen Rothwell wrote:
> > Hi Martin,
> > 
> > Starting with next-20080613, the linux-next build (s390 defconfig s390x
> > compiler) has failed with these errors:
> > 
> > In file included from /scratch/michael/kisskb-build/src/include/linux/spinlock.h:87,
> >                  from /scratch/michael/kisskb-build/src/include/linux/smp.h:11,
> >                  from /scratch/michael/kisskb-build/src/include/linux/kernel_stat.h:4,
> >                  from /scratch/michael/kisskb-build/src/mm/memory.c:41:
> > include2/asm/spinlock.h: In function '__raw_spin_lock':
> > include2/asm/spinlock.h:69: error: implicit declaration of function 'smp_processor_id'
> > 
> > There are others as well, but I was concentrating on this.  Bisecting
> > leads to commit 2448ad3d8e64a9b58acca34a3d010cfa0be88cc1 which is the
> > merge of the block tree.  The block tree contains a commit
> > (37e81b98dba08cce1d8eedb2bdaa58022bf31ee0 "Add generic helpers for arch
> > IPI function calls") that adds an include of linux/spinlock.h to
> > linux/smp.h. (asm-s390/spinlock.h includes linux/smp.h ...)
> > 
> > But the block tree itself is OK.  So something in the s390 tree is
> > interacting with the above commit to cause the failure.  It is not
> > immediately obvious to me what that is. (Or I may have screwed up the
> > bisect :-))
> 
> Heiko was looking into this, I had forgotten about it. Heiko, did you
> find an adequate solution to this?

My only conclusion back then was that you shouldn't add the new
#include <linux/spinlock.h> to include <linux/smp.h> (see also Martin's mail).
