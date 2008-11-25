From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 24 Nov 2008 22:48:51 -0500
Message-ID: <1227584931.7622.11.camel@localhost.localdomain>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:35592 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752963AbYKYDtz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 22:49:55 -0500
In-Reply-To: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Tue, 2008-11-25 at 14:21 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/boot/tty.c: Assembler messages:
> arch/x86/boot/tty.c:76: Error: bad register name `%dil'
> 
> I have no idea what caused this (maybe a compiler option?) so I have
> dropped the ftrace tree for today.
> 

Stephen,

Could you post a git branch that had this failure, so I can compile it
to see what happened?

Thanks,

-- Steve
