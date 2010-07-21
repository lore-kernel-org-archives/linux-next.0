From: mark gross <markgross@thegnar.org>
Subject: Re: linux-next: manual merge of the suspend tree with the wireless
 tree
Date: Wed, 21 Jul 2010 15:15:16 -0700
Message-ID: <20100721221516.GC2610@gvim.org>
References: <20100721132006.ff026db8.sfr@canb.auug.org.au>
Reply-To: markgross@thegnar.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:64036 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab0GUWPV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2010 18:15:21 -0400
Content-Disposition: inline
In-Reply-To: <20100721132006.ff026db8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, mark gross <markgross@thegnar.org>, "John W. Linville" <linville@tuxdriver.com>

On Wed, Jul 21, 2010 at 01:20:06PM +1000, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the suspend tree got a conflict in
> drivers/net/wireless/ipw2x00/ipw2100.c between commit
> d267be307a3345ef06889511cad2aa1fecc83db7 ("ipw2100: mark
> ipw2100_pm_qos_req static") from the wireless tree and commit
> 82f682514a5df89ffb3890627eebf0897b7a84ec ("pm_qos: Get rid of the
> allocation in pm_qos_add_request()") from the suspend tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/net/wireless/ipw2x00/ipw2100.c
> index 5bbff4c,7f0d98b..0000000
> --- a/drivers/net/wireless/ipw2x00/ipw2100.c
> +++ b/drivers/net/wireless/ipw2x00/ipw2100.c
> @@@ -174,7 -174,7 +174,7 @@@ that only one external action is invoke
>   #define DRV_DESCRIPTION	"Intel(R) PRO/Wireless 2100 Network Driver"
>   #define DRV_COPYRIGHT	"Copyright(c) 2003-2006 Intel Corporation"
>   
> - static struct pm_qos_request_list *ipw2100_pm_qos_req;
>  -struct pm_qos_request_list ipw2100_pm_qos_req;
> ++static struct pm_qos_request_list ipw2100_pm_qos_req

It should be static.  Thanks
--mgross

>   
>   /* Debugging stuff */
>   #ifdef CONFIG_IPW2100_DEBUG
