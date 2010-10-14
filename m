From: Feng Tang <feng.tang@intel.com>
Subject: Re: linux-next: Tree for October 13
Date: Thu, 14 Oct 2010 17:41:44 +0800
Message-ID: <20101014174144.324a0f6b@feng-vmt>
References: <20101013154522.7b087a20.sfr@canb.auug.org.au>
	<20101013173826.f4b911b4.akpm@linux-foundation.org>
	<4CB651A4.60205@zytor.com>
	<20101013174740.f48e4ec2.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:10050 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752277Ab0JNBug (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Oct 2010 21:50:36 -0400
In-Reply-To: <20101013174740.f48e4ec2.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

Hi Andrew,

On Thu, 14 Oct 2010 08:47:40 +0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 13 Oct 2010 17:41:08 -0700
> "H. Peter Anvin" <hpa@zytor.com> wrote:
> 
> > On 10/13/2010 05:38 PM, Andrew Morton wrote:
> > > On Wed, 13 Oct 2010 15:45:22 +1100
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > >> I have created today's linux-next tree at
> > >> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > 
> > > In an i386 allmodconfig build, compilation of
> > > arch/x86/kernel/early_printk_mrst.c is emitting a call to
> > > __this_fixmap_does_not_exist().  
> > 
> > Will look at it.  Do you happen to have toolchain versions?
> > 
> 
> gcc-4.1.0.  Which is actually an officially banned compiler version:
> 
>  # if __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1
>  #  error Your version of gcc miscompiles the __weak directive
> 
> lazyass here needs to find a new cross-compiler.

I just compiled with allmodconfig on X86_32 with gcc 4.4.3 (ubuntu 4.4.3-4ubuntu5)
and X86_64 with gcc 4.4.4 (Debian 4.4.4-1), haven't see the error yet.


Thanks,
Feng
