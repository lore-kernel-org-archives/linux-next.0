From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: mfd tree build failure
Date: Wed, 14 Jan 2009 13:12:21 +0100
Message-ID: <20090114121220.GA2980@sortiz.org>
References: <20090112140318.e25cd2bf.sfr@canb.auug.org.au> <20090112100753.GA21301@fedora.yogi>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:51182 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753023AbZANMJv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Jan 2009 07:09:51 -0500
Content-Disposition: inline
In-Reply-To: <20090112100753.GA21301@fedora.yogi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Balaji Rao <balajirrao@openmoko.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Jan 12, 2009 at 03:37:55PM +0530, Balaji Rao wrote:
> On Mon, Jan 12, 2009 at 02:03:18PM +1100, Stephen Rothwell wrote:
> > Hi Samuel,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > ERROR: "__set_irq_handler" [drivers/mfd/pcf50633-core.ko] undefined!
> > ERROR: "handle_level_irq" [drivers/mfd/pcf50633-core.ko] undefined!
> > 
> > Immediate cause is clearly commit
> > f52046b14b1e1a8a02ae48d0c69d39c5e204644f ("mfd: PCF50633 core driver")
> > which introduces this code.  The above functions don't appear to be
> > exported to modules.
> > 
> > I have dropped the mfd tree for today.
> 
> Oh, sorry about this. I can actually do without this. Here's the patch.
> Sameo, can you please apply it ?
Applied to both my for-next and for-linus branches.
If Linus doesnt apply the patch, I'll resend a pull request tomorrow.

Cheers,
Samuel.
 
>     pcf50633: Remove references to non-exported functions
>     
>     Remove references to set_irq_type and handle_level_irq which are not
>     exported to modules.
>     
>     Signed-off-by: Balaji Rao <balajirrao@openmoko.org>
> 
> diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
> index 24508e2..ea9488e 100644
> --- a/drivers/mfd/pcf50633-core.c
> +++ b/drivers/mfd/pcf50633-core.c
> @@ -626,7 +626,6 @@ static int __devinit pcf50633_probe(struct i2c_client *client,
>  	}
>  
>  	if (client->irq) {
> -		set_irq_handler(client->irq, handle_level_irq);
>  		ret = request_irq(client->irq, pcf50633_irq,
>  				IRQF_TRIGGER_LOW, "pcf50633", pcf);
>  

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
