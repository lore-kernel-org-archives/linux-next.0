From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: nfs+tcp boot failures on linuxnext-20180924 from switch
 tcp_clock_ns to CLOCK_TAI
Date: Wed, 26 Sep 2018 19:18:28 -0700
Message-ID: <2185d09d-90e1-81ef-7c7f-346eeb951bf4@gmail.com>
References: <30e76d01dd08c2d9127072ad28c5a99afc5daabf.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30e76d01dd08c2d9127072ad28c5a99afc5daabf.camel@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>, Vinicius Costa Gomes <vinicius.gomes@intel.com>
List-Id: linux-next.vger.kernel.org



On 09/26/2018 06:15 PM, Leonard Crestez wrote:
> Hello,
>  
> It seems that after commit 72b0094f9182 ("tcp: switch tcp_clock_ns() to
> CLOCK_TAI base") some systems that use nfs over tcp fail to boot. The
> last line printed in the log is from systemd:
>  
> [    7.232579] systemd[1]: System time before build time, advancing clock.
>  
> Superficially it looks like very large clock discontinuities now break
> TCP. Maybe boottime could avoid such issues?
>  
> I didn't find similar reports anywhere else. The machines I’m seeing
> this are all 32bit arm imx (this shouldn’t matter) and it seems their
> RTC isn’t properly setup so they boot with realtime set to unix zero,
> then a ~50 years jump happens when systemd starts up. This is the
> likely trigger for this issue.
>  

Thanks for the report.

It is annoying, because SCM_TXTIME and net/sched/sch_etf.c are using CLOCK_TAI,
so it means that if we convert TCP (and net/sched/sch_fq.c) back to ktime_get_ns(),
we will have to differentiate in skbs the clock base.

This has been discussed in the past (When ETF was merged in 4.19) and we chose
to use a common clock base.
