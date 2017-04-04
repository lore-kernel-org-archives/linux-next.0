From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 04 Apr 2017 15:31:15 +0300
Message-ID: <1491309075.708.125.camel@linux.intel.com>
References: <20170404164453.677dc74a@canb.auug.org.au>
         <20170404081937.npgk3cwx7bv5igzg@dell>
         <20170404082156.yhepja5bveahlegr@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404082156.yhepja5bveahlegr@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2017-04-04 at 09:21 +0100, Lee Jones wrote:
> On Tue, 04 Apr 2017, Lee Jones wrote:
> 
> > On Tue, 04 Apr 2017, Stephen Rothwell wrote:
> > 
> > > Hi Lee,
> > > 
> > > After merging the mfd tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > /home/sfr/next/next/drivers/mfd/intel_soc_pmic_bxtwc.c:25:31:
> > > fatal error: asm/intel_pmc_ipc.h: No such file or directory
> > > 
> > > Caused by commit
> > > 
> > >   eb2a445f7d8f ("mfd: intel_soc_pmic: Fix a mess with compilation
> > > units")
> > > 
> > > I have reverted that commit for today.
> > 
> > Andy,
> > 
> > I'm pulling this commit.  Despite you thinking the error is
> > unrelated
> > to your patch, something is clearly wrong and I don't have time to
> > investigate.
> > 
> > Ball is in your court.
> 
> Okay, I've had a *very* quick looks.

> Seems as if you should be depending on INTEL_PMC_IPC.

As a quick fix, yes. As a proper fix the PMC/SCU mess should be fixed in
a way to provide a header in include/platform_data/x86.

I will prepare v4.
Thanks.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
