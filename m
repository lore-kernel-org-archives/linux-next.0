From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] arch/*/io.h: Add ioremap_uc() to all architectures
Date: Wed, 29 Jul 2015 13:09:11 +1000
Message-ID: <20150729130911.21f1dc72@canb.auug.org.au>
References: <1438107727-12287-1-git-send-email-mcgrof@do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34222 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752493AbbG2DJO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 23:09:14 -0400
In-Reply-To: <1438107727-12287-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: mingo@elte.hu, akpm@linux-foundation.org, bp@suse.de, tglx@linutronix.de, hpa@zytor.com, peterz@infradead.org, dan.j.williams@intel.com, linux-next@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org, benh@kernel.crashing.org, "Luis R. Rodriguez" <mcgrof@suse.com>

Hi Luis,

On Tue, 28 Jul 2015 11:22:07 -0700 "Luis R. Rodriguez" <mcgrof@do-not-panic.com> wrote:
>
> From: "Luis R. Rodriguez" <mcgrof@suse.com>
> 
> This adds ioremap_uc() only for architectures that do not
> include asm-generic.h/io.h as that already provides a default
> definition for them for both cases where you have CONFIG_MMU
> and you do not, and because of this, the number of architectures
> this patch address is less than the architectures that the
> ioremap_wt() patch addressed, "arch/*/io.h: Add ioremap_wt() to all
> architectures").
> 
> In order to reduce the number of architectures we have to
> modify when adding new architecture IO APIs we'll have to review
> the architectures in this patch, see why they can't add
> asm-generic.h/io.h or issues that would be created by doing
> so and then spread a consistent inclusion of this header
> towards the end of their own header. For instance arch/metag
> includes the asm-generic/io.h *before* the ioremap*()
> definitions, this should be the other way around but only
> once we have guard wrappers for the non-MMU case also for
> asm-generic/io.h.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
> ---
>  arch/avr32/include/asm/io.h   | 1 +
>  arch/frv/include/asm/io.h     | 1 +
>  arch/m32r/include/asm/io.h    | 1 +
>  arch/m68k/include/asm/io_mm.h | 1 +
>  arch/mn10300/include/asm/io.h | 1 +
>  arch/powerpc/include/asm/io.h | 1 +
>  arch/sh/include/asm/io.h      | 1 +
>  arch/tile/include/asm/io.h    | 1 +
>  8 files changed, 8 insertions(+)

I have added this to linux-next today instead of reverting the other 2
patches.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
