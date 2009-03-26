From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tracing tree build failure
Date: Thu, 26 Mar 2009 08:54:10 +0100
Message-ID: <20090326075410.GA31669@elte.hu>
References: <20090326121459.197d346a.sfr@canb.auug.org.au> <49CADC4F.2030002@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52466 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751408AbZCZHyi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 03:54:38 -0400
Content-Disposition: inline
In-Reply-To: <49CADC4F.2030002@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Masami Hiramatsu <mhiramat@redhat.com> wrote:

> Hi Stephen,
> 
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > arch/x86/kernel/kprobes.c: In function 'trampoline_handler':
> > arch/x86/kernel/kprobes.c:697: error: 'struct pt_regs' has no member named 'gs'
> > 
> > Caused by commit b9dad0d2955db059cd92c81c37ddcbef0abc8bf8 ("x86:
> > kretprobe-booster interrupt emulation code fix").  64bit appears to not
> > have a gs in its pt_regs.
> 
> Oh, that was fixed on linux-2.6-tip tree...
> 
> http://git.kernel.org/?p=linux/kernel/git/x86/linux-2.6-tip.git;a=commit;h=fee039a1d05c6e0f71b0fe270d847742a02d56c4

I have pushed out a new tree for linux-next, to pick up this fix.

	Ingo
