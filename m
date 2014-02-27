From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH -next] xtensa: Export __invalidate_icache_range
Date: Thu, 27 Feb 2014 10:40:15 -0800
Message-ID: <CAGXu5jL4vb+x1XA2qDbzCpsQCFh9KLehZBzYUiZ_vs=uqBGH-Q@mail.gmail.com>
References: <1393508474-16710-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393508474-16710-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 27, 2014 at 5:41 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> When modular code calls flush_icache_range():
>
>     ERROR: "__invalidate_icache_range" [drivers/misc/lkdtm.ko] undefined!
>     make[1]: *** [__modpost] Error 1
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Ah, good catch!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> http://kisskb.ellerman.id.au/kisskb/buildresult/10663772/
>
>  arch/xtensa/kernel/xtensa_ksyms.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/xtensa/kernel/xtensa_ksyms.c b/arch/xtensa/kernel/xtensa_ksyms.c
> index 80b33ed51f31..88eab32be29e 100644
> --- a/arch/xtensa/kernel/xtensa_ksyms.c
> +++ b/arch/xtensa/kernel/xtensa_ksyms.c
> @@ -105,6 +105,7 @@ EXPORT_SYMBOL(csum_partial_copy_generic);
>   * Architecture-specific symbols
>   */
>  EXPORT_SYMBOL(__xtensa_copy_user);
> +EXPORT_SYMBOL(__invalidate_icache_range);
>
>  /*
>   * Kernel hacking ...
> --
> 1.7.9.5
>



-- 
Kees Cook
Chrome OS Security
