From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 20 Jun 2014 09:53:53 -0700
Message-ID: <20140620165353.GA3433@kroah.com>
References: <20140620141807.45761bd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54556 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934855AbaFTQt7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2014 12:49:59 -0400
Content-Disposition: inline
In-Reply-To: <20140620141807.45761bd0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>

On Fri, Jun 20, 2014 at 02:18:07PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/board/board.c: In function 'find_by_address':
> drivers/staging/board/board.c:14:3: error: implicit declaration of function 'of_can_translate_address' [-Werror=implicit-function-declaration]
>    if (of_can_translate_address(dn)
>    ^
> 
> Caused by commit 382063d91e15 ("staging: board: Initial board staging
> support").
> 
> I have disabled that driver for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 20 Jun 2014 14:14:17 +1000
> Subject: [PATCH] staging: board: disable
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/board/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/board/Kconfig b/drivers/staging/board/Kconfig
> index 09d94b48c9c9..7eda0b8b7aab 100644
> --- a/drivers/staging/board/Kconfig
> +++ b/drivers/staging/board/Kconfig
> @@ -1,6 +1,7 @@
>  config STAGING_BOARD
>  	boolean "Staging Board Support"
>  	depends on OF_ADDRESS
> +	depends on BROKEN
>  	help
>  	  Select to enable per-board staging support code.
>  

Magnus, can you send me a proper patch for this to get the code back to
building condition?

thanks,

greg k-h
