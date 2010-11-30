From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] cs5535-mfd: fix warning on x86-64 (v2)
Date: Tue, 30 Nov 2010 14:36:42 -0800
Message-ID: <4CF57C7A.5060905@oracle.com>
References: <20101129115257.9a78ad14.sfr@canb.auug.org.au>	<20101129204410.339805ef@queued.net>	<20101130102257.008fb652.randy.dunlap@oracle.com> <20101130135439.2e293d65@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:38736 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451Ab0K3Wh2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Nov 2010 17:37:28 -0500
In-Reply-To: <20101130135439.2e293d65@queued.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/30/10 13:54, Andres Salomon wrote:
> 
> ARRAY_SIZE() returns size_t; use %zu instead of %d so that we don't
> get warnings on x86-64.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Glad you used %zu instead of %zd.

> ---
>  drivers/mfd/cs5535-mfd.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
> index b141ca7..59ca6f1 100644
> --- a/drivers/mfd/cs5535-mfd.c
> +++ b/drivers/mfd/cs5535-mfd.c
> @@ -103,7 +103,7 @@ static int __devinit cs5535_mfd_probe(struct pci_dev *pdev,
>  		goto err_disable;
>  	}
>  
> -	dev_info(&pdev->dev, "%d devices registered.\n",
> +	dev_info(&pdev->dev, "%zu devices registered.\n",
>  			ARRAY_SIZE(cs5535_mfd_cells));
>  
>  	return 0;


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
