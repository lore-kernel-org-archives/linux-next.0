From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jul 21
Date: Fri, 30 Sep 2016 09:14:56 +1000
Message-ID: <20160930091456.0aacbbef@canb.auug.org.au>
References: <20160721165631.6508756a@canb.auug.org.au>
        <CAP=VYLoa6C1uFtuqEhqTw6fdjGrNhFCQyUv3FNNkOWH2m2kTDw@mail.gmail.com>
        <20160929193442.GA16617@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752328AbcI2XO7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 19:14:59 -0400
In-Reply-To: <20160929193442.GA16617@gate.crashing.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

Hi Segher,

[Adding more cc's]

On Thu, 29 Sep 2016 14:34:42 -0500 Segher Boessenkool <segher@kernel.crashing.org> wrote:
>
> On Thu, Jul 21, 2016 at 07:52:43PM -0400, Paul Gortmaker wrote:
> > A new i386-allmodconfig fail showed up relating to VDSO:
> > 
> > I tried to reproduce it locally with x86-64 build host and could
> > not, so I wonder if it is a missing HOSTCC vs. CC since next
> > coverage is power host...
> > 
> >   VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
> > Error: input is not a shared object
> > make[4]: *** [arch/x86/entry/vdso/vdso-image-32.c] Error 1
> > make[3]: *** [arch/x86/entry/vdso] Error 2
> > make[2]: *** [arch/x86/entry] Error 2  
> 
> This is caused by building on a BE (better-endian) host.  See patch.
> 
> 
> Segher
> 
> 
> ===
> From 7f098efa4d184ab1216c6cf8214c44a3abe50a14 Mon Sep 17 00:00:00 2001
> Message-Id: <7f098efa4d184ab1216c6cf8214c44a3abe50a14.1475177310.git.segher@kernel.crashing.org>
> From: Segher Boessenkool <segher@kernel.crashing.org>
> Date: Thu, 29 Sep 2016 11:51:00 +0000
> Subject: [PATCH] x86: Fix building on BE
> 
> We need to call GET_LE to read hdr->e_type.
> 

Fixes: 57f90c3dfc75 ("x86/vdso: Error out if the vDSO isn't a valid DSO")

> Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>

57f90c3dfc75 was merged as part of the last merge window, so this is a
fix for Linus' tree.

> ---
>  arch/x86/entry/vdso/vdso2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
> index 4f74119..3dab75f 100644
> --- a/arch/x86/entry/vdso/vdso2c.h
> +++ b/arch/x86/entry/vdso/vdso2c.h
> @@ -22,7 +22,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
>  
>  	ELF(Phdr) *pt = (ELF(Phdr) *)(raw_addr + GET_LE(&hdr->e_phoff));
>  
> -	if (hdr->e_type != ET_DYN)
> +	if (GET_LE(&hdr->e_type) != ET_DYN)
>  		fail("input is not a shared object\n");
>  
>  	/* Walk the segment table. */
> -- 
> 1.9.3

-- 
Cheers,
Stephen Rothwell
