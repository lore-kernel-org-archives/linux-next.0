From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build warning in the origin tree
Date: Wed, 1 Jul 2015 15:31:20 +0200
Message-ID: <CAMuHMdXqDHxyup0xiZDuOieqnOZ_eA6FjaW3fDJ+VorUKars-Q@mail.gmail.com>
References: <20150630135009.75cb607a@canb.auug.org.au>
	<alpine.DEB.2.11.1506300900450.12501@east.gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34287 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbbGANbV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2015 09:31:21 -0400
In-Reply-To: <alpine.DEB.2.11.1506300900450.12501@east.gentwo.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2015 at 4:01 PM, Christoph Lameter <cl@linux.com> wrote:
> On Tue, 30 Jun 2015, Stephen Rothwell wrote:
>> WARNING: mm/built-in.o(.text.unlikely+0xc22): Section mismatch in reference from the function .new_kmalloc_cache() to the variable .init.rodata:kmalloc_info
>> The function .new_kmalloc_cache() references
>> the variable __initconst kmalloc_info.
>> This is often because .new_kmalloc_cache lacks a __initconst
>> annotation or the annotation of kmalloc_info is wrong.
>>
>> Caused by commit a9730fca9946 ("Fix kmalloc slab creation sequence").
>
>
> Subject: Add __init attribute to new_kmalloc_cache
>
> Signed-off-by: Christoph Lameter <cl@linux.com>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

>
> Index: linux/mm/slab_common.c
> ===================================================================
> --- linux.orig/mm/slab_common.c
> +++ linux/mm/slab_common.c
> @@ -855,7 +855,7 @@ void __init setup_kmalloc_cache_index_ta
>         }
>  }
>
> -static void new_kmalloc_cache(int idx, unsigned long flags)
> +static void __init new_kmalloc_cache(int idx, unsigned long flags)
>  {
>         kmalloc_caches[idx] = create_kmalloc_cache(kmalloc_info[idx].name,
>                                         kmalloc_info[idx].size, flags);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
