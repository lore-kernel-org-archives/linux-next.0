From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (input
 tree related)
Date: Sat, 21 Aug 2010 00:39:27 -0700
Message-ID: <20100821073927.GA2160@core.coreip.homeip.net>
References: <20100820131224.02f7cb9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:56342 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348Ab0HUHje (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Aug 2010 03:39:34 -0400
Content-Disposition: inline
In-Reply-To: <20100820131224.02f7cb9f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jason Wessel <jason.wessel@windriver.com>, Greg Kroah-Hartman <gregkh@suse.de>

Hi Stephen,

On Fri, Aug 20, 2010 at 01:12:24PM +1000, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> In file included from drivers/gpu/drm/i915/i915_irq.c:29:
> include/linux/sysrq.h:45: error: expected declaration specifiers or '...' before 'bool'
> 
> Caused by commit a821bafce37b26499e2bfbf2e6b96b0636efc014 ("Input: sysrq
> - drop tty argument form handle_sysrq()") from the input tree which
> (despite not mentioning this) changed an "int" argument to "bool" but
> neglected to include linux/types.h.
> 
> I added this patch for today:

Thank you very much for the patch. I folded it into original patch to
avoid build failures in case someone needs to bisect.

-- 
Dmitry
