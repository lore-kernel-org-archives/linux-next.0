From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 12:56:37 -0300
Message-ID: <20160715155637.GD2523@redhat.com>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com>
 <20160715152937.GB3115@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160715152937.GB3115@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-next.vger.kernel.org

Em Fri, Jul 15, 2016 at 05:29:37PM +0200, Peter Zijlstra escreveu:
> On Fri, Jul 15, 2016 at 12:24:36PM -0300, Arnaldo Carvalho de Melo wrote:
> > Seems ok, but I'll reinstate this:
> > 
> > #if BITS_PER_LONG != __BITS_PER_LONG
> > #error Inconsistent word size. Check asm/bitsperlong.h
> > #endif
> 
> Confuses me; why do we have two?
> 
> Why not then do:
> 
> #define BITS_PER_LONG __BITS_PER_LONG
> 
> and be done with it?

Well, I just kept existing kernel practice, it uses __BITS_PER_LONG in
uapi files and BITS_PER_LONG elsewhere, since we copy stuff from the
kernel and check when it drifts using diff, I kept it like that so that
automation could point us when the tools/ copy drifted from the original
file.

- Arnaldo
