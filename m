From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Fri, 3 Jan 2014 17:09:24 +0100
Message-ID: <20140103160924.GC4219@osiris>
References: <20140103141943.GA4219@osiris>
 <CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
 <20140103153651.GB4219@osiris>
 <87ppo95azt.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:57745 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565AbaACQJ3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 11:09:29 -0500
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 3 Jan 2014 16:09:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0884E1B0806B
	for <linux-next@vger.kernel.org>; Fri,  3 Jan 2014 16:08:43 +0000 (GMT)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com [9.149.37.249])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s03G9E9Z44302422
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 16:09:14 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s03G9O9u022225
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 09:09:26 -0700
Content-Disposition: inline
In-Reply-To: <87ppo95azt.fsf@igel.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next <linux-next@vger.kernel.org>

On Fri, Jan 03, 2014 at 04:41:10PM +0100, Andreas Schwab wrote:
> Heiko Carstens <heiko.carstens@de.ibm.com> writes:
> 
> > There is also other code that relies on this: e.g. copy_mount_options() my be
> > called with KERNEL_DS.
> 
> With KERNEL_DS you can *only* access kernel memory, which is unpagable.
> If you want to access user memory, you _must_ use USER_DS.

I didn't say anything else. copy_mount_options() will be called with KERNEL_DS
from e.g. do_mount_root().

> > If DEBUG_PAGEALLOC is turned on, it would crash badly in kernel space
> > if it crosses page boundaries and touches an invalid page, even though
> > it should survive...
> 
> Accessing an invalid page in kernel space is _always_ a bug.

Even though the current futex check relies on working exception handling
for this case.

If the patch I posted gets merged as well, it really doesn't matter for me.

Martin and I discussed this today and we will change the s390 code so that
it will also survive very early USER_DS accesses (without valid current->mm)
since we also discovered a couple of other oddities in our code.

But theses changes would be too complex for -stable, imho.
