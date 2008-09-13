From: Rui Sousa <rui.p.m.sousa@gmail.com>
Subject: Re: linux-next: tip-core build failure
Date: Sat, 13 Sep 2008 11:44:35 +0200
Message-ID: <200809131144.36507.rui.p.m.sousa@gmail.com>
References: <20080913111423.981554c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:10123 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752274AbYIMJor (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Sep 2008 05:44:47 -0400
Received: by nf-out-0910.google.com with SMTP id d3so671967nfc.21
        for <linux-next@vger.kernel.org>; Sat, 13 Sep 2008 02:44:43 -0700 (PDT)
In-Reply-To: <20080913111423.981554c3.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

On Saturday 13 September 2008 03:14, Stephen Rothwell wrote:
> Hi Ingo,
>
> Today's linux-next build (powerpc allnoconfig) failed like this:
>
> In file included from arch/powerpc/include/asm/system.h:8,
>                  from include/linux/list.h:7,
>                  from include/linux/signal.h:8,
>                  from arch/powerpc/kernel/asm-offsets.c:16:
> include/linux/irqflags.h:89:1: warning: "local_irq_save" redefined
> In file included from arch/powerpc/include/asm/irqflags.h:11,
>                  from include/linux/irqflags.h:55,
>                  from arch/powerpc/include/asm/system.h:8,
>                  from include/linux/list.h:7,
>                  from include/linux/signal.h:8,
>                  from arch/powerpc/kernel/asm-offsets.c:16:
> arch/powerpc/include/asm/hw_irq.h:115:1: warning: this is the location of
> the previous definition
>
> And it went downhill from there.
>
> Introduced by commit bd8fbdee6562ee526f3c2582a3b373ef195015dd ("lockdep:
> fix compilation when CONFIG_TRACE_IRQFLAGS_SUPPORT is not set") which I
> have reverted.

Ingo,

Do you agree that the original (in include/linux/irqflags.h):

#define raw_local_irq_disable()        local_irq_disable()

should be

#define local_irq_disable()		raw_local_irq_disable()        

and that architecture specific files should only define the raw_xxx() macros?
It seems I missed a bunch of need changes in the original patch, but if it's
the right way to go I can work on a patch to update the other archs too.

Thanks,
Rui
