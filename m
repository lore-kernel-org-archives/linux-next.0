From: Masami Hiramatsu <mhiramat@redhat.com>
Subject: Re: linux-next: tracing tree build failure
Date: Wed, 25 Mar 2009 21:37:19 -0400
Message-ID: <49CADC4F.2030002@redhat.com>
References: <20090326121459.197d346a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:47463 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752799AbZCZBhC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 21:37:02 -0400
In-Reply-To: <20090326121459.197d346a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/kernel/kprobes.c: In function 'trampoline_handler':
> arch/x86/kernel/kprobes.c:697: error: 'struct pt_regs' has no member named 'gs'
> 
> Caused by commit b9dad0d2955db059cd92c81c37ddcbef0abc8bf8 ("x86:
> kretprobe-booster interrupt emulation code fix").  64bit appears to not
> have a gs in its pt_regs.

Oh, that was fixed on linux-2.6-tip tree...

http://git.kernel.org/?p=linux/kernel/git/x86/linux-2.6-tip.git;a=commit;h=fee039a1d05c6e0f71b0fe270d847742a02d56c4

> 
> I have used the version of this tree that was in next-20090325 for today.

-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America) Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com
