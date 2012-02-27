From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Sun, 26 Feb 2012 22:01:21 -0800
Message-ID: <4F4B1C31.7070808@zytor.com>
References: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:44000 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751594Ab2B0GC0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Feb 2012 01:02:26 -0500
In-Reply-To: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Cyrill Gorcunov <gorcunov@openvz.org>

On 02/26/2012 09:53 PM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in 
> arch/x86/syscalls/syscall_64.tbl between commit 
> arch/x86/syscalls/syscall_64.tbl ("x32: Add x32 system calls to 
> syscall/syscall_64.tbl") from the tip tree and commit "syscalls,
> x86: add __NR_kcmp syscall" from the akpm tree.
> 
> I fixed it up (see below) but did not know if this call should be
> marked "common".

It should be "common" (otherwise there would need to be an x32 variant
which would point to the compat version of the call, but in this case
even the i386 entry point goes straight to sys_kcmp.)

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
