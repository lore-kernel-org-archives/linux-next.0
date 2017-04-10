From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 10 Apr 2017 07:55:52 +0100
Message-ID: <20170410065552.44hidp2gpakyeawg@dell>
References: <20170404164453.677dc74a@canb.auug.org.au>
 <20170404081937.npgk3cwx7bv5igzg@dell>
 <20170404082156.yhepja5bveahlegr@dell>
 <1491309075.708.125.camel@linux.intel.com>
 <20170410121107.69b83963@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:36768 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751442AbdDJGzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2017 02:55:55 -0400
Received: by mail-wr0-f171.google.com with SMTP id c55so68350403wrc.3
        for <linux-next@vger.kernel.org>; Sun, 09 Apr 2017 23:55:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170410121107.69b83963@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 10 Apr 2017, Stephen Rothwell wrote:

> Hi all,
> 
> On Tue, 04 Apr 2017 15:31:15 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, 2017-04-04 at 09:21 +0100, Lee Jones wrote:
> > > On Tue, 04 Apr 2017, Lee Jones wrote:
> > >   
> > > > On Tue, 04 Apr 2017, Stephen Rothwell wrote:
> > > >   
> > > > > After merging the mfd tree, today's linux-next build (powerpc
> > > > > allyesconfig) failed like this:
> > > > > 
> > > > > /home/sfr/next/next/drivers/mfd/intel_soc_pmic_bxtwc.c:25:31:
> > > > > fatal error: asm/intel_pmc_ipc.h: No such file or directory
> > > > > 
> > > > > Caused by commit
> > > > > 
> > > > >   eb2a445f7d8f ("mfd: intel_soc_pmic: Fix a mess with compilation
> > > > > units")
> > > > > 
> > > > > I have reverted that commit for today.  
> > > > 
> > > > Andy,
> > > > 
> > > > I'm pulling this commit.  Despite you thinking the error is unrelated
> > > > to your patch, something is clearly wrong and I don't have time to
> > > > investigate.
> > > > 
> > > > Ball is in your court.  
> > > 
> > > Okay, I've had a *very* quick looks.  
> > 
> > > Seems as if you should be depending on INTEL_PMC_IPC.  
> > 
> > As a quick fix, yes. As a proper fix the PMC/SCU mess should be fixed in
> > a way to provide a header in include/platform_data/x86.
> > 
> > I will prepare v4.
> > Thanks.
> 
> Ping?

I guess this is still causing an issue in -next?

The patch has now been removed from mfd-next and the result pushed.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
