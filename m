From: David Miller <davem@davemloft.net>
Subject: Re: [ofa-general] [PATCH 2.6.30] RDMA/cxgb3: Remove modulo math.
Date: Wed, 11 Feb 2009 00:00:49 -0800 (PST)
Message-ID: <20090211.000049.193727089.davem@davemloft.net>
References: <adaeiy5ahza.fsf@cisco.com>
	<20090210.172347.189515015.davem@davemloft.net>
	<ada4oz1a188.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47067
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750920AbZBKIAz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 03:00:55 -0500
In-Reply-To: <ada4oz1a188.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdreier@cisco.com
Cc: randy.dunlap@oracle.com, linux-next@vger.kernel.org, general@lists.openfabrics.org, linux-kernel@vger.kernel.org

From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 10 Feb 2009 23:20:39 -0800

>  > unsigned long page_size[4];
>  > 
>  > int main(int argc)
>  > {
>  >         unsigned long long x = argc;
>  > 
>  >         return x % (1UL << (12 + page_size[argc]));
>  > }
>  > 
>  > I get a call to __umoddi3:
> 
> You're not testing the same thing.  The original code was:
> 
> 		wqe->recv.sgl[i].to = cpu_to_be64(((u32) wr->sg_list[i].addr) %
> 				(1UL << (12 + page_size[i])));
> 
> and it's not that easy to see with all the parentheses, but the
> expression being done is (u32) % (unsigned long).  So rather than
> unsigned long long in your program, you should have just done unsigned
> (u32 is unsigned int on all Linux architectures).  In that case gcc does
> not generate a call to any library function in all the versions I have
> handy, although gcc 4.1 does do a div instead of an and.  (And I don't
> think any 32-bit architectures require a library function for (unsigned)
> % (unsigned), so the code should be OK)
> 
> Your example shows that gcc is missing a strength reduction opportunity
> in not handling (u64) % (unsigned long) on 32 bit architectures, but I
> guess it is a more difficult optimization to do, since gcc has to know
> that it can simply zero the top 32 bits.

Indeed, I get the divide if I use "unsigned int" for "x".

I still think you should make this change, as many systems out
there are getting the expensive divide.

main:
	sethi	%hi(page_size), %g1
	or	%g1, %lo(page_size), %g1
	mov	%o0, %g3
	sll	%o0, 2, %g4
	ld	[%g1+%g4], %g2
	mov	1, %g1
	add	%g2, 12, %g2
	sll	%g1, %g2, %g1
	wr	%g0, %g0, %y
	nop
	nop
	nop
	udiv	%o0, %g1, %o0
	smul	%o0, %g1, %o0
	jmp	%o7+8
	 sub	%g3, %o0, %o0
