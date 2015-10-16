From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Fri, 16 Oct 2015 12:27:04 +1100
Message-ID: <20151016122704.4320da9e@canb.auug.org.au>
References: <20151015132602.7816b658@canb.auug.org.au>
	<7853704.H00KElTCBt@wuerfel>
	<20151015120407.GA31945@lst.de>
	<5895082.5iDhc8pylg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42659 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222AbbJPB1I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 21:27:08 -0400
In-Reply-To: <5895082.5iDhc8pylg@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Arnd,

On Thu, 15 Oct 2015 14:28:20 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> diff --git a/include/asm-generic/io-64-nonatomic-hi-lo.h b/include/asm-generic/io-64-nonatomic-hi-lo.h
> new file mode 100644
> index 000000000000..32b73abce1b0
> --- /dev/null
> +++ b/include/asm-generic/io-64-nonatomic-hi-lo.h
> @@ -0,0 +1,2 @@
> +/* XXX: delete asm-generic/io-64-nonatomic-hi-lo.h after converting new users */
> +#include <linux/io-64-nonatomic-hi-lo.h>

Turns out you need the same for io-64-nonatomic-lo-hi.h as well ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
