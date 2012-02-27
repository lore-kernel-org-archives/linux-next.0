From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Mon, 27 Feb 2012 10:05:45 +0400
Message-ID: <20120227060545.GD1904@moon>
References: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au>
 <20120227055725.GC1904@moon>
 <4F4B1C63.8050108@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:40588 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811Ab2B0GFt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 01:05:49 -0500
Content-Disposition: inline
In-Reply-To: <4F4B1C63.8050108@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>

On Sun, Feb 26, 2012 at 10:02:11PM -0800, H. Peter Anvin wrote:
> On 02/26/2012 09:57 PM, Cyrill Gorcunov wrote:
> > On Mon, Feb 27, 2012 at 04:53:56PM +1100, Stephen Rothwell wrote:
> >> Hi Andrew,
> >>
> >> Today's linux-next merge of the akpm tree got a conflict in
> >> arch/x86/syscalls/syscall_64.tbl between commit
> >> arch/x86/syscalls/syscall_64.tbl ("x32: Add x32 system calls to
> >> syscall/syscall_64.tbl") from the tip tree and commit "syscalls, x86: add
> >> __NR_kcmp syscall" from the akpm tree.
> >>
> >> I fixed it up (see below) but did not know if this call should be marked
> >> "common".
> > 
> > Hi Stephen, letme fetch both trees to figure out what this new column means.
> > Will ping back shortly. Thanks!
> > 
> 
> Hi Cyrill,
> 
> "common" means the same entry point is used for x86-64 and x32.
> 

Ah, I see. Thanks for explanation, Peter! So it should be a "common" then.

	Cyrill
