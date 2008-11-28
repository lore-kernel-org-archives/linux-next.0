From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: proc tree build failure
Date: Fri, 28 Nov 2008 11:05:55 +0300
Message-ID: <20081128080555.GC3495@x200.localdomain>
References: <20081124181559.3896a756.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.170]:22560 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842AbYK1ICD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 03:02:03 -0500
Received: by ug-out-1314.google.com with SMTP id 39so1895036ugf.37
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 00:01:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081124181559.3896a756.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>, Ingo Molnar <mingo@elte.hu>

On Mon, Nov 24, 2008 at 06:15:59PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (sparc64 allmodconfig) failed like this:
> 
> fs/proc/base.c:362: undefined reference to `save_stack_trace_tsk'
> 
> It has been failing like this for some time.
> 
> Caused by commit 788ff43b53179f3af8677d59c87104aff1f75bde ("proc:
> add /proc/*/stack") which has been fixed up for MIPS, but needs another
> fix for Sparc.

David, can you implement save_stack_trace_tsk() for sparc64? I have no idea
how to do it or is it doable at all.
