From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Fri, 23 Mar 2018 22:09:20 +0100
Message-ID: <6072268.CPFKWgAbKZ@aspire.rjw.lan>
References: <20180323132001.7da7f3c4@canb.auug.org.au> <20180323060924.jeppeix62c3wza6l@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323060924.jeppeix62c3wza6l@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Claudio Scordino <claudio@evidence.eu.com>
List-Id: linux-next.vger.kernel.org

On Friday, March 23, 2018 7:09:24 AM CET Ingo Molnar wrote:
> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   kernel/sched/cpufreq_schedutil.c
> > 
> > between commit:
> > 
> >   0953feed3400 ("cpufreq: schedutil: rate limits for SCHED_DEADLINE")
> 
> Rafael, could you please send that to the scheduler tree?

You can apply from

https://patchwork.kernel.org/patch/10278127/

and I will drop it from my tree.

Thanks!
