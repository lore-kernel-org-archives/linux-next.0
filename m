From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Tue, 7 Jan 2014 09:47:25 +0100
Message-ID: <20140107084725.GA4576@osiris>
References: <20140103141943.GA4219@osiris>
 <CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
 <20140103153651.GB4219@osiris>
 <87ppo95azt.fsf@igel.home>
 <20140103160924.GC4219@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:50597 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbaAGIrf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2014 03:47:35 -0500
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Tue, 7 Jan 2014 08:47:30 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id B54E5219005E
	for <linux-next@vger.kernel.org>; Tue,  7 Jan 2014 08:47:26 +0000 (GMT)
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com [9.149.37.252])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s078lF2U30408716
	for <linux-next@vger.kernel.org>; Tue, 7 Jan 2014 08:47:15 GMT
Received: from d06av11.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s078lQgt031937
	for <linux-next@vger.kernel.org>; Tue, 7 Jan 2014 01:47:27 -0700
Content-Disposition: inline
In-Reply-To: <20140103160924.GC4219@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next <linux-next@vger.kernel.org>

On Fri, Jan 03, 2014 at 05:09:24PM +0100, Heiko Carstens wrote:
> On Fri, Jan 03, 2014 at 04:41:10PM +0100, Andreas Schwab wrote:
> > Heiko Carstens <heiko.carstens@de.ibm.com> writes:
> > 
> > > There is also other code that relies on this: e.g. copy_mount_options() my be
> > > called with KERNEL_DS.
> > 
> > With KERNEL_DS you can *only* access kernel memory, which is unpagable.
> > If you want to access user memory, you _must_ use USER_DS.
> 
> I didn't say anything else. copy_mount_options() will be called with KERNEL_DS
> from e.g. do_mount_root().

Just to be more precise: when sys_mount() gets called from kernel space (with
KERNEL_DS) it will call copy_mount_options() which in turn will call
exact_copy_from_user() which will usually copy a whole page, unless a fault
happens.
E.g. devtmpfsd() (drivers/base/devtmpfs.c) calls sys_mount() with mount options
being on the kernel stack. Now if these mount options are at the beginning of
the kernel stack, copy_mount_options() _will_ cross page boundaries and leave
the kernel stack. In case of DEBUG_PAGEALLOC it's not very unlikely that the
next page has an invalid mapping and a fault happens.

I'm not saying that the devtmpfsd() code is correct, however this code would
crash on m68k as well if it doesn't fixup it's instructions pointer for
exceptions in kernel space.
