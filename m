From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 1 Mar 2016 20:40:01 +1100
Message-ID: <20160301204001.5594bed3@canb.auug.org.au>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58802 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752076AbcCAJkJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 04:40:09 -0500
In-Reply-To: <20160301070750.GA6636@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>

Hi Ingo,

On Tue, 1 Mar 2016 08:07:50 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> > This build is done with a PowerPC hosted cross compiler with no glibc.  
> 
> Ugh, what a rare and weird way to build an x86 kernel, and you made linux-next 
> dependent on it?

It is just the fastest hardware I currently have access to (you remember
who I work for, right? ;-)).  I have always done at least part of the
linux-next building (daily, or overnight) on PowerPC hardware and this
is only the 2nd or third time in over 8 years that it has found an
issue like this.

> > I assume that some things here need to be built with HOSTCC?  
> 
> I suspect that's the culprit.

Good, hopefully it is not too hard to fix.

-- 
Cheers,
Stephen Rothwell
