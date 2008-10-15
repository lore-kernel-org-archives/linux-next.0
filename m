From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 12:01:57 +0100
Message-ID: <20081015110157.GA24363@rakim.wolfsonmicro.main>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au> <20081015093319.GA19403@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58680 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751667AbYJOLB7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 07:01:59 -0400
Content-Disposition: inline
In-Reply-To: <20081015093319.GA19403@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Wed, Oct 15, 2008 at 11:33:19AM +0200, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> hm:

>  Author:     Mark Brown <broonie@opensource.wolfsonmicro.com>
>  AuthorDate: Fri Oct 10 15:58:14 2008 +0100
>  Commit:     Liam Girdwood <lrg@slimlogic.co.uk>
>  CommitDate: Mon Oct 13 21:51:56 2008 +0100

> if a patch is merged as agressively as that, it should at minimum be 
> tested a bit.

It has been tested (I've got some systems here that rely on the WM8350
fairly heavily) - what was missing was cross platform testing on
architectures that don't define NO_IRQ.  The code is rather older than
the dates indicate due to some rearrangement of the patch series, though
obviously out of tree stuff has to be taken with a grain of salt.

Anyway, I've posted a patch removing the use of NO_IRQ from the driver
(as <1224066054-24401-1-git-send-email-broonie@opensource.wolfsonmicro.com>)
which should hopefully be merged shortly.
