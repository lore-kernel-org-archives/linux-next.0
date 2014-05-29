From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Thu, 29 May 2014 11:18:44 -0700
Message-ID: <20140529181844.GA12492@kroah.com>
References: <20140529190129.6d3272fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55813 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932640AbaE2SPK (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2014 14:15:10 -0400
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 96A8F21214
	for <linux-next@vger.kernel.org>; Thu, 29 May 2014 14:15:08 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140529190129.6d3272fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

On Thu, May 29, 2014 at 07:01:29PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> drivers/usb/core/hub.c: In function 'port_event':
> drivers/usb/core/hub.c:4853:2: error: implicit declaration of function 'hub_handle_remote_wakeup' [-Werror=implicit-function-declaration]
> 
> Caused by commits af376a461cf0 ("usb: refactor port handling in
> hub_events()") and 7e73be227b15 ("usb: hub_handle_remote_wakeup()
> depends on CONFIG_PM_RUNTIME=y") This build has CONFIG_PM not set ...
> 
> I have added this fix patch for today (there is probably a better way):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 May 2014 18:55:06 +1000
> Subject: [PATCH] usb: hub_handle_remote_wakeup() only exists for CONFIG_PM=y
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/core/hub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 5672752bfd2c..879b66e13370 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3977,6 +3977,12 @@ EXPORT_SYMBOL_GPL(usb_disable_ltm);
>  void usb_enable_ltm(struct usb_device *udev) { }
>  EXPORT_SYMBOL_GPL(usb_enable_ltm);
>  
> +static int hub_handle_remote_wakeup(struct usb_hub *hub, unsigned int port,
> +		u16 portstatus, u16 portchange)
> +{
> +	return 0;
> +}
> +
>  #endif	/* CONFIG_PM */
>  
>  

Dan, any objection to me taking this patch?

thanks,

greg k-h
