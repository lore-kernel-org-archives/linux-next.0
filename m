From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] gigaset: fix build failure
Date: Wed, 17 Mar 2010 14:35:14 -0700
Message-ID: <4BA14B12.4030900@oracle.com>
References: <20100317211231.569B140118@xenon.ts.pxnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-9
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:52948 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308Ab0CQVgj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2010 17:36:39 -0400
In-Reply-To: <20100317211231.569B140118@xenon.ts.pxnet.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tilman Schmidt <tilman@imap.cc>
Cc: Karsten Keil <isdn@linux-pingi.de>, David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Hansjoerg Lipp <hjlipp@web.de>, isdn4linux <isdn4linux@listserv.isdn4linux.de>, i4ldeveloper <i4ldeveloper@listserv.isdn4linux.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org

On 03/17/10 10:37, Tilman Schmidt wrote:
> Update the dummy LL interface to the LL interface change
> introduced by commit daab433c03c15fd642c71c94eb51bdd3f32602c8.
> This fixes the build failure occurring after that commit when
> enabling ISDN_DRV_GIGASET but neither ISDN_I4L nor ISDN_CAPI.
> 
> Impact: bugfix
> Signed-off-by: Tilman Schmidt <tilman@imap.cc>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  drivers/isdn/gigaset/dummyll.c |   14 +++++++++++---
>  1 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/isdn/gigaset/dummyll.c b/drivers/isdn/gigaset/dummyll.c
> index 5b27c99..bd0b1ea 100644
> --- a/drivers/isdn/gigaset/dummyll.c
> +++ b/drivers/isdn/gigaset/dummyll.c
> @@ -57,12 +57,20 @@ void gigaset_isdn_stop(struct cardstate *cs)
>  {
>  }
>  
> -int gigaset_isdn_register(struct cardstate *cs, const char *isdnid)
> +int gigaset_isdn_regdev(struct cardstate *cs, const char *isdnid)
>  {
> -	pr_info("no ISDN subsystem interface\n");
>  	return 1;
>  }
>  
> -void gigaset_isdn_unregister(struct cardstate *cs)
> +void gigaset_isdn_unregdev(struct cardstate *cs)
> +{
> +}
> +
> +void gigaset_isdn_regdrv(void)
> +{
> +	pr_info("no ISDN subsystem interface\n");
> +}
> +
> +void gigaset_isdn_unregdrv(void)
>  {
>  }


-- 
~Randy
