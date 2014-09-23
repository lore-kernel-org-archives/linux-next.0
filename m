From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tiny tree with the tip tree
Date: Tue, 23 Sep 2014 07:43:28 +0200
Message-ID: <20140923054328.GA28790@gmail.com>
References: <20140923143232.5ffff46e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:62447 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753189AbaIWFne (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Sep 2014 01:43:34 -0400
Content-Disposition: inline
In-Reply-To: <20140923143232.5ffff46e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Triplett <josh@joshtriplett.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Josh,
> 
> Today's linux-next merge of the tiny tree got conflicts in
> arch/x86/kernel/process_32.c and arch/x86/kernel/process_64.c between
> commits dc56c0f9b870 ("x86, fpu: Shift "fpu_counter = 0" from
> copy_thread() to arch_dup_task_struct()") and 6f46b3aef003 ("x86:
> copy_thread: Don't nullify ->ptrace_bps twice") from the tip tree and
> commits a1cf09f93e66 ("x86: process: Unify 32-bit and 64-bit
> copy_thread I/O bitmap handling") and e4a191d1e05b ("x86: Support
> compiling out userspace I/O (iopl and ioperm)") from the tiny tree.

Why are such changes in the 'tiny' tree? These are sensitive 
arch/x86 files, and any unification and compilation-out support 
patches need to go through the proper review channels and be 
merged upstream via the x86 tree if accepted...

In particular the graticious sprinking of #ifdef 
CONFIG_X86_IOPORTs around x86 code looks ugly.

Josh, don't do that, this route is really unacceptable. Please 
resubmit the latest patches and remove these from linux-next.

Thanks,

	Ingo
