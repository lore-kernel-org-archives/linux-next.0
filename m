From: Mike Turquette <mturquette@linaro.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Wed, 04 Mar 2015 16:15:03 -0800
Message-ID: <20150305001503.11109.69241@quantum>
References: <20150227140855.74020ea4@canb.auug.org.au> <54F0AC6A.6070707@codeaurora.org>
 <CAMuHMdWyWCa3bA4Z_4mnyqL-7kJ_de8UiRGiwR6U1-QDjwEcQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:45259 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803AbbCEAPY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2015 19:15:24 -0500
Received: by igjz20 with SMTP id z20so41540597igj.4
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2015 16:15:23 -0800 (PST)
In-Reply-To: <CAMuHMdWyWCa3bA4Z_4mnyqL-7kJ_de8UiRGiwR6U1-QDjwEcQQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Quoting Geert Uytterhoeven (2015-03-04 01:56:42)
> On Fri, Feb 27, 2015 at 6:42 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > The problem is the patch was written before struct clk_core moved into
> > the clk.c file and then applied after it moved. So before the move the
> > order of includes would cause the struct definition to be before the
> > place where the tracepoint macros were expanded. The fix is to move the
> > tracepoint include after the struct clk_core definition:
> >
> > -----8<----
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 9aee501b8284..392477033990 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -22,9 +22,6 @@
> >  #include <linux/init.h>
> >  #include <linux/sched.h>
> >
> > -#define CREATE_TRACE_POINTS
> > -#include <trace/events/clk.h>
> > -
> >  #include "clk.h"
> >
> >  static DEFINE_SPINLOCK(enable_lock);
> > @@ -80,6 +77,9 @@ struct clk_core {
> >         struct kref             ref;
> >  };
> >
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/clk.h>
> > +
> >  struct clk {
> >         struct clk_core *core;
> >         const char *dev_id;
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I've rolled this into the offending commit.

Regards,
Mike

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
