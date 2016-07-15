From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 17:29:37 +0200
Message-ID: <20160715152937.GB3115@twins.programming.kicks-ass.net>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160715152436.GB2523@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jul 15, 2016 at 12:24:36PM -0300, Arnaldo Carvalho de Melo wrote:
> Seems ok, but I'll reinstate this:
> 
> #if BITS_PER_LONG != __BITS_PER_LONG
> #error Inconsistent word size. Check asm/bitsperlong.h
> #endif

Confuses me; why do we have two?

Why not then do:

#define BITS_PER_LONG __BITS_PER_LONG

and be done with it?
