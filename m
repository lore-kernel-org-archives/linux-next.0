From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: Tree for October 13
Date: Wed, 13 Oct 2010 17:41:08 -0700
Message-ID: <4CB651A4.60205@zytor.com>
References: <20101013154522.7b087a20.sfr@canb.auug.org.au> <20101013173826.f4b911b4.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49018 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784Ab0JNAla (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Oct 2010 20:41:30 -0400
In-Reply-To: <20101013173826.f4b911b4.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Feng Tang <feng.tang@intel.com>

On 10/13/2010 05:38 PM, Andrew Morton wrote:
> On Wed, 13 Oct 2010 15:45:22 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> I have created today's linux-next tree at
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> In an i386 allmodconfig build, compilation of
> arch/x86/kernel/early_printk_mrst.c is emitting a call to
> __this_fixmap_does_not_exist().  

Will look at it.  Do you happen to have toolchain versions?

	-hpa
