From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 5 (XEN)
Date: Tue, 5 Aug 2008 19:30:34 -0700
Message-ID: <20080805193034.de32bf52.randy.dunlap@oracle.com>
References: <20080805175914.7649537f.sfr@canb.auug.org.au>
	<20080805180316.b85d5547.randy.dunlap@oracle.com>
	<4898FB2F.9060202@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:62286 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757036AbYHFCbD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 22:31:03 -0400
In-Reply-To: <4898FB2F.9060202@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jeremy@xensource.com, chrisw@sous-sol.org

On Tue, 05 Aug 2008 18:15:27 -0700 Jeremy Fitzhardinge wrote:

> Randy Dunlap wrote:
> > These warnings have been around for several days now.
> > Is there a patch available but not yet merged for linux-next?
> >
> >
> > linux-next-20080805/drivers/xen/balloon.c:599: warning: initialization from incompatible pointer type
> > linux-next-20080805/drivers/xen/balloon.c:600: warning: initialization from incompatible pointer type
> > linux-next-20080805/drivers/xen/balloon.c:601: warning: initialization from incompatible pointer type
> > linux-next-20080805/drivers/xen/balloon.c:602: warning: initialization from incompatible pointer type
> > linux-next-20080805/drivers/xen/balloon.c:605: warning: initialization from incompatible pointer type
> > linux-next-20080805/drivers/xen/balloon.c:635: warning: initialization from incompatible pointer type
> >   
> 
> I posted this patch the other day.  It's in tip.git, but I guess it 
> hasn't made it to next.
> 

Ack, looks good, fixes those warnings.
Thanks.


> 
> Subject: xen-balloon: fix up sysfs issues
> 
> 1. Set the class so it doesn't clash with the normal memory class
> 2. Fix up the sysfs show functions to match the new prototype
> 3. Clean up use of memparse
> 
> Signed-off-by: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
> Cc: viets@work.de
> Cc: Andi Kleen <andi@firstfloor.org>
> ---
>  drivers/xen/balloon.c |   27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> ===================================================================
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -60,7 +60,7 @@
>  
>  #define PAGES2KB(_p) ((_p)<<(PAGE_SHIFT-10))
>  
> -#define BALLOON_CLASS_NAME "memory"
> +#define BALLOON_CLASS_NAME "xen_memory"
>  
>  struct balloon_stats {
>  	/* We aim for 'current allocation' == 'target allocation'. */
> @@ -588,12 +587,13 @@
>  }
>  
>  
> -#define BALLOON_SHOW(name, format, args...)			\
> -	static ssize_t show_##name(struct sys_device *dev,	\
> -				   char *buf)			\
> -	{							\
> -		return sprintf(buf, format, ##args);		\
> -	}							\
> +#define BALLOON_SHOW(name, format, args...)				\
> +	static ssize_t show_##name(struct sys_device *dev,		\
> +				   struct sysdev_attribute *attr,	\
> +				   char *buf)				\
> +	{								\
> +		return sprintf(buf, format, ##args);			\
> +	}								\
>  	static SYSDEV_ATTR(name, S_IRUGO, show_##name, NULL)
>  
>  BALLOON_SHOW(current_kb, "%lu\n", PAGES2KB(balloon_stats.current_pages));
> @@ -604,7 +604,8 @@
>  	     (balloon_stats.hard_limit!=~0UL) ? PAGES2KB(balloon_stats.hard_limit) : 0);
>  BALLOON_SHOW(driver_kb, "%lu\n", PAGES2KB(balloon_stats.driver_pages));
>  
> -static ssize_t show_target_kb(struct sys_device *dev, char *buf)
> +static ssize_t show_target_kb(struct sys_device *dev, struct sysdev_attribute *attr,
> +			      char *buf)
>  {
>  	return sprintf(buf, "%lu\n", PAGES2KB(balloon_stats.target_pages));
>  }
> @@ -614,19 +615,14 @@
>  			       const char *buf,
>  			       size_t count)
>  {
> -	char memstring[64], *endchar;
> +	char *endchar;
>  	unsigned long long target_bytes;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
> -	if (count <= 1)
> -		return -EBADMSG; /* runt */
> -	if (count > sizeof(memstring))
> -		return -EFBIG;   /* too long */
> -	strcpy(memstring, buf);
> +	target_bytes = memparse(buf, &endchar);
>  
> -	target_bytes = memparse(memstring, &endchar);
>  	balloon_set_new_target(target_bytes >> PAGE_SHIFT);
>  
>  	return count;
> 
> 


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
