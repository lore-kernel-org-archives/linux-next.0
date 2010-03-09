From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH] i2c: update for semaphore to mutex conversion of
 devices
Date: Tue, 9 Mar 2010 09:25:08 +0100
Message-ID: <20100309092508.02b7b2e8@hyperion.delvare>
References: <20100309102828.18351564.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:60538 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752490Ab0CIIZL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Mar 2010 03:25:11 -0500
In-Reply-To: <20100309102828.18351564.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Tue, 9 Mar 2010 10:28:28 +1100, Stephen Rothwell wrote:
> I have been carrying this patch in linux-next for some time and now
> mainline needs it.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/i2c/i2c-smbus.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 333527c..52aa775 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -27,6 +27,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-smbus.h>
> +#include <linux/mutex.h>
>  
>  struct i2c_smbus_alert {
>  	unsigned int		alert_edge_triggered:1;
> @@ -55,7 +56,7 @@ static int smbus_do_alert(struct device *dev, void *addrp)
>  	 * Drivers should either disable alerts, or provide at least
>  	 * a minimal handler.  Lock so client->driver won't change.
>  	 */
> -	down(&dev->sem);
> +	device_lock(dev);
>  	if (client->driver) {
>  		if (client->driver->alert)
>  			client->driver->alert(client, data->flag);
> @@ -63,7 +64,7 @@ static int smbus_do_alert(struct device *dev, void *addrp)
>  			dev_warn(&client->dev, "no driver alert()!\n");
>  	} else
>  		dev_dbg(&client->dev, "alert with no driver\n");
> -	up(&dev->sem);
> +	device_unlock(dev);
>  
>  	/* Stop iterating after we find the device */
>  	return -EBUSY;

Thanks for the reminder Stephen. I was only waiting for device_lock()
to become usable in mainline. Now that it happened, I will take the
patch above in my i2c tree, and send it to Linus in my next batch.

-- 
Jean Delvare
