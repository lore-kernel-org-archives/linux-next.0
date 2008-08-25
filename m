From: Robert Richter <robert.richter@amd.com>
Subject: Re: linux-next: manual merge of the oprofile tree
Date: Mon, 25 Aug 2008 11:32:38 +0200
Message-ID: <20080825093237.GG14103@erda.amd.com>
References: <20080825190822.591685e5.sfr@canb.auug.org.au> <20080825091341.GB9114@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-dub.frontbridge.com ([213.199.154.16]:20507 "EHLO
	IE1EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530AbYHYJdj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 05:33:39 -0400
Content-Disposition: inline
In-Reply-To: <20080825091341.GB9114@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On 25.08.08 11:13:41, Ingo Molnar wrote:
> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Ingo,
> > 
> > Today's linux-next merge of the oprofile tree got a conflict in
> > arch/x86/kernel/apic_32.c between commit
> > 274cfe5912eebe9d4e1a4c451fe617289a181fcf ("x86: apic - rearrange
> > functions and comments") from the x86 tree and commits
> > 286f571837ba9d67625afd015366d79345abb414 ("x86: apic_*.c: add description
> > to AMD's extended LVT functions"),
> > 09691616850b3614dfb44790e1e1419b6a7f5d13 ("x86: apic: export symbols for
> > extended interrupt LVT functions") and
> > 6aa360e6c16c145edf1837690e0f7aaea6b86ef3 ("x86: apic: changing export
> > symbols to *_GPL") from the oprofile tree.
> > 
> > The former moved some code that was updated by the latter.  I fixed it 
> > up (see below) and can carry it.
> 
> thanks Stephen - conflict resolution looks good to me.

Looks good to me too.

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
email: robert.richter@amd.com
