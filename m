From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Tue, 28 Nov 2017 18:38:31 -0500 (EST)
Message-ID: <nycvar.YSQ.7.76.1711281838080.5925@knanqh.ubzr>
References: <20171129101637.1e4c7af3@canb.auug.org.au> <20171128233119.GA19925@flint.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34343 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753347AbdK1Xie (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Nov 2017 18:38:34 -0500
Received: by mail-qk0-f194.google.com with SMTP id d66so2224378qkg.1
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2017 15:38:33 -0800 (PST)
In-Reply-To: <20171128233119.GA19925@flint.armlinux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>

On Tue, 28 Nov 2017, Russell King wrote:

> On Wed, Nov 29, 2017 at 10:16:37AM +1100, Stephen Rothwell wrote:
> > Hi Russell,
> > 
> > After merging the arm tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > 
> > arch/arm/vfp/vfphw.S: Assembler messages:
> > arch/arm/vfp/vfphw.S:158: Warning: conditional infixes are deprecated in unified syntax
> > arch/arm/vfp/vfphw.S:233: Warning: conditional infixes are deprecated in unified syntax
> > arch/arm/kernel/entry-common.S: Assembler messages:
> > arch/arm/kernel/entry-common.S:285: Warning: conditional infixes are deprecated in unified syntax
> > arch/arm/kernel/entry-common.S:286: Warning: conditional infixes are deprecated in unified syntax
> > arch/arm/kernel/entry-common.S:365: Warning: conditional infixes are deprecated in unified syntax
> > 
> > And many more similar.
> > 
> > Presumably introduced by commit
> > 
> >   cabcafe5d1a5 ("ARM: 8723/1: always assume the "unified" syntax for assembly code")
> 
> Well, I seem to be missing all results from the various kernel build
> systems, so I've no idea what's going on with those - although kernelci
> has sent me boot results with no build results... our test systems
> seem to be unreliable.
> 
> Dropping Nicolas' commit, there's obviously something wrong with it
> somewhere.  Nicolas, can you reproduce these problems?

I'll investigate right away.


Nicolas
