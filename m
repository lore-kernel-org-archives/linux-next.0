From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Thu, 28 Mar 2019 02:57:33 +0100
Message-ID: <20190328015733.GI21724@piout.net>
References: <20190328122300.02fc46c4@canb.auug.org.au>
 <CACPK8Xdx5TtG=7ZTgRg_V=obawreGrTG-aA2gESjpxcQY-wOBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACPK8Xdx5TtG=7ZTgRg_V=obawreGrTG-aA2gESjpxcQY-wOBg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 28/03/2019 01:36:21+0000, Joel Stanley wrote:
> On Thu, 28 Mar 2019 at 01:23, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> >
> > drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_read_time':
> > drivers/rtc/rtc-aspeed.c:26:16: warning: unused variable 'flags' [-Wunused-variable]
> >   unsigned long flags;
> >                 ^~~~~
> > drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_set_time':
> > drivers/rtc/rtc-aspeed.c:57:16: warning: unused variable 'flags' [-Wunused-variable]
> >   unsigned long flags;
> >                 ^~~~~
> >
> > Introduced by commit
> >
> >   7f4d485413fb ("rtc: Add ASPEED RTC driver")
> 
> Alexandre, it looks like v3 went in instead of v4. Do you need me to
> send a follow up?
> 

I didn't get any v4, I'll fix it up in the tree.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
