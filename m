From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Tue, 28 Nov 2017 23:31:19 +0000
Message-ID: <20171128233119.GA19925@flint.armlinux.org.uk>
References: <20171129101637.1e4c7af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56930 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdK1Xb3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Nov 2017 18:31:29 -0500
Content-Disposition: inline
In-Reply-To: <20171129101637.1e4c7af3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>

On Wed, Nov 29, 2017 at 10:16:37AM +1100, Stephen Rothwell wrote:
> Hi Russell,
> 
> After merging the arm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> arch/arm/vfp/vfphw.S: Assembler messages:
> arch/arm/vfp/vfphw.S:158: Warning: conditional infixes are deprecated in unified syntax
> arch/arm/vfp/vfphw.S:233: Warning: conditional infixes are deprecated in unified syntax
> arch/arm/kernel/entry-common.S: Assembler messages:
> arch/arm/kernel/entry-common.S:285: Warning: conditional infixes are deprecated in unified syntax
> arch/arm/kernel/entry-common.S:286: Warning: conditional infixes are deprecated in unified syntax
> arch/arm/kernel/entry-common.S:365: Warning: conditional infixes are deprecated in unified syntax
> 
> And many more similar.
> 
> Presumably introduced by commit
> 
>   cabcafe5d1a5 ("ARM: 8723/1: always assume the "unified" syntax for assembly code")

Well, I seem to be missing all results from the various kernel build
systems, so I've no idea what's going on with those - although kernelci
has sent me boot results with no build results... our test systems
seem to be unreliable.

Dropping Nicolas' commit, there's obviously something wrong with it
somewhere.  Nicolas, can you reproduce these problems?

-- 
Russell King
ARM architecture Linux Kernel maintainer
