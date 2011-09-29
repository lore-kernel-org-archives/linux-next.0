From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH -next] x86 mrst: fix build error when X86_MRST is not
 enabled
Date: Thu, 29 Sep 2011 23:57:08 +0100
Message-ID: <20110929235708.1bbd1166@lxorguk.ukuu.org.uk>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
	<4E84D684.107@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:52561 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751620Ab1I2XAF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 19:00:05 -0400
In-Reply-To: <4E84D684.107@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86 maintainers <x86@kernel.org>

On Thu, 29 Sep 2011 13:35:16 -0700
Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix build when CONFIG_X86_INTEL_MID is enabled but
> CONFIG_X86_MRST is not enabled.  Fixes this build error:

This looks wrong. Unfortunately until we get kernel.org back its hard to
do much about it and see what is in all the trees.

> -#ifdef CONFIG_X86_INTEL_MID
> +#ifdef CONFIG_X86_MRST
>  
>  static inline enum mrst_cpu_type mrst_identify_cpu(void)
>  {
>  	return __mrst_cpu_chip;
>  }
>  
> -#else /* !CONFIG_X86_INTEL_MID */
> +#else /* !CONFIG_X86_MRST */
>  
>  #define mrst_identify_cpu()    (0)
>  
> -#endif /* !CONFIG_X86_INTEL_MID */
> +#endif /* !CONFIG_X86_MRST */

This breaks Medfield so NAK

The correct behaviour should be 

INTEL_MID defined -> mrst_cpu_chip has meaning
INTEL_MID not defined -> mrst_identify_chip is 0

your change makes it 0 for Medfield which means it will crash on boot.
