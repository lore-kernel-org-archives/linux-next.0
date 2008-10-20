From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: linux-next: build failure
Date: Mon, 20 Oct 2008 12:33:29 -0400
Message-ID: <3aaafc130810200933s7299378eg6924089a58b9778a@mail.gmail.com>
References: <20081020230420.aa85f83b.sfr@canb.auug.org.au>
	 <20081020154857.GC24666@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.232]:12670 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084AbYJTQda (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 12:33:30 -0400
Received: by rv-out-0506.google.com with SMTP id k40so1946154rvb.1
        for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 09:33:29 -0700 (PDT)
In-Reply-To: <20081020154857.GC24666@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Christopher Harrer <charrer@alacritech.com>, Michael Miles <mmiles@alacritech.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linus@kroah.com

On Mon, Oct 20, 2008 at 11:48 AM, Greg KH <greg@kroah.com> wrote:
> On Mon, Oct 20, 2008 at 11:04:20PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>
>> In file included from drivers/staging/sxg/sxg.c:77:
>> drivers/staging/sxg/sxghif.h:859: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'Compilation'
>> drivers/staging/sxg/sxg.c: In function 'sxg_transmit_packet':
>> drivers/staging/sxg/sxg.c:1949: error: 'SXG_SGL_BUF_SIZE' undeclared (first use in this function)
>> drivers/staging/sxg/sxg.c:1958: error: implicit declaration of function 'SXG_SGL_BUFFER'
>> drivers/staging/sxg/sxg.c:1958: warning: assignment makes pointer from integer without a cast
>> drivers/staging/sxg/sxg.c: In function 'sxg_mcast_set_mask':
>> drivers/staging/sxg/sxg.c:2846: warning: format '%llx' expects type 'long long unsigned int', but argument 5 has type 'u64'
>>
>> I applied the following patch.
>
> Ah, doh, sorry, I should have caught that.  I'll go apply this to the
> tree, thanks.

Greg,

The slicoss driver also from Alacritech looks like it needs a depends
on X86 as well. Should the sxg and slicoss drivers from Alacritech be
doing things like this (sxg/sxghif.h:851, slicoss/slicoss.c:960):

#if defined(CONFIG_X86_64)

...

#else
    Stop Compilation;
#endif


>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
