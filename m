From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Wed, 4 Mar 2015 10:56:42 +0100
Message-ID: <CAMuHMdWyWCa3bA4Z_4mnyqL-7kJ_de8UiRGiwR6U1-QDjwEcQQ@mail.gmail.com>
References: <20150227140855.74020ea4@canb.auug.org.au>
	<54F0AC6A.6070707@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F0AC6A.6070707@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 27, 2015 at 6:42 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> The problem is the patch was written before struct clk_core moved into
> the clk.c file and then applied after it moved. So before the move the
> order of includes would cause the struct definition to be before the
> place where the tracepoint macros were expanded. The fix is to move the
> tracepoint include after the struct clk_core definition:
>
> -----8<----
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9aee501b8284..392477033990 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -22,9 +22,6 @@
>  #include <linux/init.h>
>  #include <linux/sched.h>
>
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/clk.h>
> -
>  #include "clk.h"
>
>  static DEFINE_SPINLOCK(enable_lock);
> @@ -80,6 +77,9 @@ struct clk_core {
>         struct kref             ref;
>  };
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/clk.h>
> +
>  struct clk {
>         struct clk_core *core;
>         const char *dev_id;

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
