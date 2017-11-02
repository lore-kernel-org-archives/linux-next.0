From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the gpio tree with the tip tree
Date: Thu, 2 Nov 2017 19:26:32 +1100
Message-ID: <20171102192632.409d8138@canb.auug.org.au>
References: <20171102155952.56d90a49@canb.auug.org.au>
        <20171102080627.6lhlrfcucz7zsfch@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750907AbdKBI0f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 04:26:35 -0400
In-Reply-To: <20171102080627.6lhlrfcucz7zsfch@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Andi Kleen <ak@linux.intel.com>

Hi Peter,

On Thu, 2 Nov 2017 09:06:27 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 02, 2017 at 03:59:52PM +1100, Stephen Rothwell wrote:
> > diff --cc include/linux/bitops.h
> > index 15a5bcfcd0a2,9a874deee6e2..000000000000
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@@ -227,32 -227,30 +227,56 @@@ static inline unsigned long __ffs64(u6
> >   	return __ffs((unsigned long)word);
> >   }
> >   
> >  +/*
> >  + * clear_bit32 - Clear a bit in memory for u32 array
> >  + * @nr: Bit to clear
> >  + * @addr: u32 * address of bitmap
> >  + *
> >  + * Same as clear_bit, but avoids needing casts for u32 arrays.
> >  + */
> >  +
> >  +static __always_inline void clear_bit32(long nr, volatile u32 *addr)
> >  +{
> >  +	clear_bit(nr, (volatile unsigned long *)addr);
> >  +}
> >  +
> >  +/*
> >  + * set_bit32 - Set a bit in memory for u32 array
> >  + * @nr: Bit to clear
> >  + * @addr: u32 * address of bitmap
> >  + *
> >  + * Same as set_bit, but avoids needing casts for u32 arrays.
> >  + */
> >  +
> >  +static __always_inline void set_bit32(long nr, volatile u32 *addr)
> >  +{
> >  +	set_bit(nr, (volatile unsigned long *)addr);
> >  +}  
> 
> How is that not fundamentally broken for big-endian?

Yes, that went through my mind as well :-)

-- 
Cheers,
Stephen Rothwell
