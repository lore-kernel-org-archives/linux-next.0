From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Fri, 23 Mar 2018 07:09:24 +0100
Message-ID: <20180323060924.jeppeix62c3wza6l@gmail.com>
References: <20180323132001.7da7f3c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180323132001.7da7f3c4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Claudio Scordino <claudio@evidence.eu.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/sched/cpufreq_schedutil.c
> 
> between commit:
> 
>   0953feed3400 ("cpufreq: schedutil: rate limits for SCHED_DEADLINE")

Rafael, could you please send that to the scheduler tree?

Thanks,

	Ingo
