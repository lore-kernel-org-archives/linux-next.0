From: Dave <kilroyd@googlemail.com>
Subject: Re: linux-next: wireless tree build failure
Date: Fri, 13 Feb 2009 18:24:30 +0000
Message-ID: <4995BADE.60700@gmail.com>
References: <20090212193517.3f393726.sfr@canb.auug.org.au> <20090212161639.GA4091@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.188]:18895 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186AbZBMSYk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 13:24:40 -0500
Received: by mu-out-0910.google.com with SMTP id i10so567332mue.1
        for <linux-next@vger.kernel.org>; Fri, 13 Feb 2009 10:24:37 -0800 (PST)
In-Reply-To: <20090212161639.GA4091@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Kilroy <kilroyd@googlemail.com>

John W. Linville wrote:
> On Thu, Feb 12, 2009 at 07:35:17PM +1100, Stephen Rothwell wrote:
>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>
>> net/built-in.o: In function `michael_mic':
>> (.opd+0x3ba78): multiple definition of `michael_mic'
>> drivers/built-in.o:(.opd+0x552a8): first defined here
>> net/built-in.o: In function `michael_mic':
>> net/mac80211/michael.c:58: multiple definition of `.michael_mic'
>> drivers/built-in.o:drivers/net/wireless/orinoco/mic.c:49: first defined here
>>
>> Immediate cause is commit 84875201dd1150dc2c16780b944fe501d588ffba
>> ("orinoco: Move MIC helpers into new file").
> 
> I'll fix this up with a patch like below...
> 
> John

I guess it only worked for me because I'm building modules.

Anyway, the fix needs to be slightly different:

> diff --git a/drivers/net/wireless/orinoco/mic.c b/drivers/net/wireless/orinoco/mic.c
> index c39d9ea..8cdac75 100644
> --- a/drivers/net/wireless/orinoco/mic.c
> +++ b/drivers/net/wireless/orinoco/mic.c
> @@ -16,18 +16,18 @@
>  /********************************************************************/
>  int orinoco_mic_init(struct orinoco_private *priv)
>  {
> -	priv->tx_tfm_mic = crypto_alloc_hash("michael_mic", 0, 0);
> +	priv->tx_tfm_mic = crypto_alloc_hash("orinoco_mic", 0, 0);

That wants to remain as michael_mic, so we get the right crypto alg.

>  	if (IS_ERR(priv->tx_tfm_mic)) {
>  		printk(KERN_DEBUG "orinoco_mic_init: could not allocate "
> -		       "crypto API michael_mic\n");
> +		       "crypto API orinoco_mic\n");

Since we're referring to the crypto alg, I suggest this stay the same.

>  		priv->tx_tfm_mic = NULL;
>  		return -ENOMEM;
>  	}
>  
> -	priv->rx_tfm_mic = crypto_alloc_hash("michael_mic", 0, 0);
> +	priv->rx_tfm_mic = crypto_alloc_hash("orinoco_mic", 0, 0);

Ditto 1.

>  	if (IS_ERR(priv->rx_tfm_mic)) {
>  		printk(KERN_DEBUG "orinoco_mic_init: could not allocate "
> -		       "crypto API michael_mic\n");
> +		       "crypto API orinoco_mic\n");

Ditto 2.

The rest is fine.



Regards,

Dave.
