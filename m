From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 00:24:09 -0500
Message-ID: <1227590649.7622.24.camel@localhost.localdomain>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	 <1227584931.7622.11.camel@localhost.localdomain>
	 <20081125151345.3f0ed493.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37501 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750838AbYKYFZG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 00:25:06 -0500
In-Reply-To: <20081125151345.3f0ed493.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Tue, 2008-11-25 at 15:13 +1100, Stephen Rothwell wrote:
> Hi Steve,
> 
> On Mon, 24 Nov 2008 22:48:51 -0500 Steven Rostedt <srostedt@redhat.com> wrote:
> >
> > Could you post a git branch that had this failure, so I can compile it
> > to see what happened?
> 
> ssh://master.kernel.org/~sfr/ftrace master
> 
> to get the failure, I did:
> 
> make ARCH=x86_64 allmodconfig
> make ARCH=x86_64 arch/x86/boot/tty.o
> 
> My machine is Debian sid.
> 
> $ gcc --version
> gcc (Debian 4.3.2-1) 4.3.2
> $ ld --version
> GNU ld (GNU Binutils for Debian) 2.18.0.20080103
> 
> The original failure was with a gcc 4.3.2 cross compiled for a powerpc
> host and a binutils 2.19.
> 
> You can see which trees are merged by looking for commits by me.

I traced it down to this.

It compiles without -Os.

But I leave -Os in...

Doing a make arch/x86/boot/tty.i  I get this:

static int kbd_pending(void)
{
 u8 pending;
 asm volatile("int $0x16; setnz %0"
       : "=rm" (pending)
       : "a" (0x0100));
 return pending;
}

void kbd_flush(void)
{
 for (;;) {
  if (__builtin_constant_p((!kbd_pending())) ? !!(!kbd_pending()) :
({ int ______r; static struct ftrace_branch_data
__attribute__((__aligned__(4)))
__attribute__((section("_ftrace_branch"))) ______f = { .func =
__func__, .file = "arch/x86/boot/tty.c", .line = 85, }; ______r = !!(!
kbd_pending()); if (______r) ______f.hit++; else ______f.miss++;
______r; }))
   break;
  getchar();
 }
}


By removing the "static" and "__attribute__((section...))" which is
needed to remove static. It compiles.

It also compiles if I only remove the "if (______r) ______f.hit++; else
______f.miss++;

There's something buggy with gcc where it can not handle -Os and this
combination of having this static variable in the if statement.

-- Steve
