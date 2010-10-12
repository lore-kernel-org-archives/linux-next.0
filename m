From: Matt Fleming <matt@console-pimps.org>
Subject: Re: linux-next: manual merge of the oprofile tree with the tip tree
Date: Tue, 12 Oct 2010 13:51:26 +0100
Message-ID: <20101012125126.GE12335@console-pimps.org>
References: <20101012131828.5fedf1bf.sfr@canb.auug.org.au> <20101012060327.GA13409@console-pimps.org> <20101012232349.938f83c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101012232349.938f83c0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Robert Richter <robert.richter@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Helsley <matthltc@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 12, 2010 at 11:23:49PM +1100, Stephen Rothwell wrote:
> Hi Matt,
> 
> On Tue, 12 Oct 2010 07:03:27 +0100 Matt Fleming <matt@console-pimps.org> wrote:
> >
> > >  		return 0;
> > >  
> > >  	pevent = perf_event_create_kernel_counter(&counter_config[event].attr,
> > > -						  cpu, -1,
> > > +						  cpu, NULL1,
> > >  						  op_overflow_handler);
> > 
> > Is that a typo? Shouldn't that be NULL, and not NULL1?
> 
> Yes, its a typo in my patch :-( .  I will fix it for tomorrow. Sorry about that.

Not a problem! Thanks
