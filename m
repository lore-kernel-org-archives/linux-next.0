From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] cs5535-mfd: fix warning on x86-64
Date: Tue, 30 Nov 2010 10:22:57 -0800
Message-ID: <20101130102257.008fb652.randy.dunlap@oracle.com>
References: <20101129115257.9a78ad14.sfr@canb.auug.org.au>
	<20101129204410.339805ef@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27452 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab0K3TXt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Nov 2010 14:23:49 -0500
In-Reply-To: <20101129204410.339805ef@queued.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 29 Nov 2010 20:44:10 -0800 Andres Salomon wrote:

> On Mon, 29 Nov 2010 11:52:57 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Samuel,
> > 
> > After merging the mfd tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/mfd/cs5535-mfd.c: In function 'cs5535_mfd_probe':
> > drivers/mfd/cs5535-mfd.c:106: warning: format '%d' expects type
> > 'int', but argument 3 has type 'long unsigned int'
> > 
> 
> Ick, ARRAY_SIZE is unsigned int on x86, unsigned long on x86-64.  The
> patch below fixes this.
> 

No, it's a sizeof(), so it should be printed with %zd.
That works on x86_64 or i386.

> 
> 
> 
> From: Andres Salomon <dilinger@queued.net>
> 
> ARRAY_SIZE() returns unsigned long on x86-64 (rather than unsigned int);
> cast it to the desired type to shut gcc up.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>
> ---
>  drivers/mfd/cs5535-mfd.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
> index b141ca7..e6f7ebc 100644
> --- a/drivers/mfd/cs5535-mfd.c
> +++ b/drivers/mfd/cs5535-mfd.c
> @@ -103,8 +103,8 @@ static int __devinit cs5535_mfd_probe(struct pci_dev *pdev,
>  		goto err_disable;
>  	}
>  
> -	dev_info(&pdev->dev, "%d devices registered.\n",
> -			ARRAY_SIZE(cs5535_mfd_cells));
> +	dev_info(&pdev->dev, "%u devices registered.\n",
> +			(unsigned int) ARRAY_SIZE(cs5535_mfd_cells));
>  
>  	return 0;
>  
> -- 
> 1.7.2.3
> 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
