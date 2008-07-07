From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Mon, 7 Jul 2008 14:51:38 +0200
Message-ID: <20080707125138.GA16569@uranus.ravnborg.org>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:39069 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751857AbYGGMuv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 08:50:51 -0400
Content-Disposition: inline
In-Reply-To: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

On Mon, Jul 07, 2008 at 06:40:38PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/cell/spu_base.c: In function '__spu_trap_data_seg':
> arch/powerpc/platforms/cell/spu_base.c:194: error: duplicate case value
> arch/powerpc/platforms/cell/spu_base.c:177: error: previously used here
> 
> This means that USER_REGION_ID (line 177) is the same as KERNEL_REGION_ID
> (line 194).
> 
> From include/asm-powerpc/pgtable-ppc64.h:
> 
> #define REGION_SHIFT            60UL
> #define REGION_MASK             (0xfUL << REGION_SHIFT)
> #define REGION_ID(ea)           (((unsigned long)(ea)) >> REGION_SHIFT)
> 
> #define VMALLOC_REGION_ID       (REGION_ID(VMALLOC_START))
> #define KERNEL_REGION_ID        (REGION_ID(PAGE_OFFSET))
> #define VMEMMAP_REGION_ID       (0xfUL)
> #define USER_REGION_ID          (0UL)
> 
> From include/asm-powerpc/page.h:
> 
> #define PAGE_OFFSET     ASM_CONST(CONFIG_PAGE_OFFSET)
> 
> From .config:
> 
> CONFIG_PAGE_OFFSET=0xffffffff
> 
> Not good.
> 
> From arch/powerpc/Kconfig (ADVANCED_OPTIONS is not set):
> 
> config PAGE_OFFSET_BOOL
>         bool "Set custom page offset address"
>         depends on ADVANCED_OPTIONS
> 
> config PAGE_OFFSET
>         hex "Virtual address of memory base" if PAGE_OFFSET_BOOL
>         default "0xc0000000"
> 
> if PPC64
> config PAGE_OFFSET
>         hex
>         default "0xc000000000000000"
> endif
> 
> Reverting commit 9ba4ff5059e1a26698786373c8c71321c37ef7f9 ("kconfig:
> normalize int/hex values") seems to have fixed it.
> 
> From .config:
> 
> CONFIG_PAGE_OFFSET=0xc000000000000000

I see what is wrong - we use a int to hold the value above
and it does not fit.

Will fix tonight or tomorrow.

	Sam
