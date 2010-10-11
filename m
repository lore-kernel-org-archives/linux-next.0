From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warning after merge of the final tree (tip
 tree related)
Date: Mon, 11 Oct 2010 12:00:17 -0700
Message-ID: <4CB35EC1.5040909@zytor.com>
References: <20101011160429.81483d01.sfr@canb.auug.org.au> <4CB344C6.5040408@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:60067 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752037Ab0JKTCF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Oct 2010 15:02:05 -0400
In-Reply-To: <4CB344C6.5040408@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/11/2010 10:09 AM, Yinghai Lu wrote:
> 
> make all functions in memblock.c without __init to carry __init_memblock.
> 
>  
> -static phys_addr_t __init memblock_find_region(phys_addr_t start, phys_addr_t end,
> +static phys_addr_t __init_memblock memblock_find_region(phys_addr_t start, phys_addr_t end,
>  					  phys_addr_t size, phys_addr_t align)
>  
> -static int memblock_search(struct memblock_type *type, phys_addr_t addr)
> +static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
>  

Your patch description doesn't match what your patch does.  Please write
a correct description.

	-hpa
