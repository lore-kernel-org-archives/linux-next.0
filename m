From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the input-mt tree with the
 input-current tree
Date: Thu, 5 Jul 2012 10:19:05 -0700
Message-ID: <20120705171904.GA31383@core.coreip.homeip.net>
References: <20120705135220.9f8f95082833a0d6fadeb136@canb.auug.org.au>
 <CAGS+omDab9mOOf6pCryRTyLvYA66h0XjqmFPc-vrAo4hkfGN0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:44036 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab2GERTN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jul 2012 13:19:13 -0400
Content-Disposition: inline
In-Reply-To: <CAGS+omDab9mOOf6pCryRTyLvYA66h0XjqmFPc-vrAo4hkfGN0A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Henrik Rydberg <rydberg@euromail.se>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

Hi Henrik,

On Thu, Jul 05, 2012 at 11:57:14AM +0800, Daniel Kurtz wrote:
> On Thu, Jul 5, 2012 at 11:52 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Henrik,
> >
> > Today's linux-next merge of the input-mt tree got a conflict in
> > drivers/input/touchscreen/atmel_mxt_ts.c between commit 9b7e31bbf4bb
> > ("Input: request threaded-only IRQs with IRQF_ONESHOT") from the
> > input-current tree and commit c2ef9a1a248b ("Input: atmel_mxt_ts - use
> > client name for irq") from the input-mt tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Looks good to me. Don't know if you need it for a merge, but:
> 
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> 

Hmm, maybe it is time I pull your tree?

Thanks.

-- 
Dmitry
