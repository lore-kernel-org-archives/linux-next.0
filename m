From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Fri, 18 Dec 2015 17:43:41 +0100
Message-ID: <20151218164341.GB3541@piout.net>
References: <20151217160344.096b4a9e@canb.auug.org.au>
 <20151217112154.GE13078@piout.net>
 <5674268E.508@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5674268E.508@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sasha.levin@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 18/12/2015 at 10:30:22 -0500, Sasha Levin wrote :
> On 12/17/2015 06:21 AM, Alexandre Belloni wrote:
> > On 17/12/2015 at 16:03:44 +1100, Stephen Rothwell wrote :
> >> > Hi Alexandre,
> >> > 
> >> > After merging the rtc tree, today's linux-next build (arm
> >> > multi_v7_defconfig) failed like this:
> >> > 
> >> > drivers/built-in.o: In function `rtc_time64_to_tm':
> >> > sunxi_sid.c:(.text+0x366e54): undefined reference to `__aeabi_ldivmod'
> >> > sunxi_sid.c:(.text+0x366e6c): undefined reference to `__aeabi_ldivmod'
> >> > 
> >> > Caused by commit
> >> > 
> >> >   bfad4c280be0 ("rtc: fix overflow and incorrect calculation in rtc_time64_to_tm")
> >> > 
> >> > I have used the rtc tree from next-20151216 for today.
> >> > 
> > Well, the kbuild test robot didn't complain at the time so I assumed
> > that it was ok to take the patch but indeed, there are more division
> > further in the function.
> 
> Yeah, I'm not sure what happened here. Compiler optimizations?
> 
> > Sasha, I think I prefer having 32 bit platforms fail on the 21st of
> > January 11761191 rather than adding more uses of do_div in the function.
> > I'll have a look at the performance impact on 32 bit platforms.
> 
> I'm really fine with just adding a WARN_ON() and aborting if it's the year
> 11761191 :)
> 

One simple way to solve it for 64bit platforms is to define days as
unsigned long. Maybe throw a comment that it will fail for 32bit
platforms in January 11761191 ;).

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
