From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: include/linux/mmzone.h:288: error: 'CONFIG_NR_CPUS'
 undeclared here (not in a function)
Date: Thu, 23 Oct 2008 16:38:10 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810231637400.18978@anakin>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
 <20081023122214.GA15805@x200.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756082AbYJWOiX@vger.kernel.org>
In-Reply-To: <20081023122214.GA15805@x200.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 23 Oct 2008, Alexey Dobriyan wrote:
> On avr32-debug-n-preempt-n:
> 
>   Using /src/linux-1 as source for kernel
>   GEN     /src/build/avr32-debug-n-preempt-n/Makefile
>   CHK     include/linux/version.h
>   CHK     include/linux/utsrelease.h
>   CC      arch/avr32/kernel/asm-offsets.s
> In file included from /src/linux-1/include/linux/gfp.h:4,
>                  from /src/linux-1/include/linux/mm.h:8,
>                  from /src/linux-1/arch/avr32/kernel/asm-offsets.c:7:
> /src/linux-1/include/linux/mmzone.h:288: error: 'CONFIG_NR_CPUS' undeclared here (not in a function)
> In file included from /src/linux-1/include/linux/topology.h:30,
>                  from /src/linux-1/include/linux/mmzone.h:763,
>                  from /src/linux-1/include/linux/gfp.h:4,
>                  from /src/linux-1/include/linux/mm.h:8,
>                  from /src/linux-1/arch/avr32/kernel/asm-offsets.c:7:
> /src/linux-1/include/linux/cpumask.h:117:5: warning: "CONFIG_NR_CPUS" is not defined
> /src/linux-1/include/linux/cpumask.h:164:5: warning: "CONFIG_NR_CPUS" is not defined
> /src/linux-1/include/linux/cpumask.h:238:5: warning: "CONFIG_NR_CPUS" is not defined
> In file included from /src/linux-1/include/linux/mm.h:15,
>                  from /src/linux-1/arch/avr32/kernel/asm-offsets.c:7:
> /src/linux-1/include/linux/mm_types.h:26:5: warning: "CONFIG_NR_CPUS" is not defined
> /src/linux-1/include/linux/mm_types.h:70:5: warning: "CONFIG_NR_CPUS" is not defined
> In file included from /src/linux-1/arch/avr32/include/asm/pgtable.h:14,
>                  from /src/linux-1/include/linux/mm.h:40,
>                  from /src/linux-1/arch/avr32/kernel/asm-offsets.c:7:
> /src/linux-1/include/linux/sched.h:354:5: warning: "CONFIG_NR_CPUS" is not defined
> In file included from /src/linux-1/arch/avr32/kernel/asm-offsets.c:7:
> /src/linux-1/include/linux/mm.h:922:5: warning: "CONFIG_NR_CPUS" is not defined
> make[2]: *** [arch/avr32/kernel/asm-offsets.s] Error 1
> make[1]: *** [prepare0] Error 2
> make: *** [sub-make] Error 2

Same on m68k: http://kisskb.ellerman.id.au/kisskb/buildresult/50671/

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
