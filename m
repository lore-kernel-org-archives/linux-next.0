From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Tue, 10 Apr 2018 09:05:39 +0200
Message-ID: <1542592.dfSYS5dp5n@aspire.rjw.lan>
References: <20180409112438.6832432f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409112438.6832432f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Monday, April 9, 2018 3:24:38 AM CEST Stephen Rothwell wrote:
> 
> --Sig_/QL=OZEguM./+7xhHdQruHaV
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> kernel/time/tick-sched.c: In function 'tick_nohz_idle_exit':
> kernel/time/tick-sched.c:1162:3: warning: 'now' may be used uninitialized i=
> n this function [-Wmaybe-uninitialized]
>    __tick_nohz_idle_restart_tick(ts, now);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/time/tick-sched.c:1146:10: note: 'now' was declared here
>   ktime_t now;
>           ^~~
> 
> This appears to be a false positive.
> 
> And another in the x86_64 allmodconfig build:
> 
> kernel/time/tick-sched.c: In function 'tick_nohz_idle_exit':
> kernel/time/tick-sched.c:538:2: warning: 'now' may be used uninitialized in=
>  this function [-Wmaybe-uninitialized]
>   update_ts_time_stats(smp_processor_id(), ts, now, NULL);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/time/tick-sched.c:1146:10: note: 'now' was declared here
>   ktime_t now;
>           ^~~
> 
> also looks like a false positive.

Yes, they are false positives AFAICS.

Cheers,
Rafael
