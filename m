From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] sysfs: Don't use enums in inline function declaration.
Date: Wed, 05 May 2010 15:05:59 -0700
Message-ID: <4BE1EBC7.4040204@oracle.com>
References: <20100430163538.7253a9e0.sfr@canb.auug.org.au>	<20100430105016.40b51636.randy.dunlap@oracle.com>	<20100505091738.7ec27479.randy.dunlap@oracle.com>	<20100505162459.GA20296@suse.de> <m18w7y10cn.fsf_-_@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:38879 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145Ab0EEWGP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 18:06:15 -0400
In-Reply-To: <m18w7y10cn.fsf_-_@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ebiederm@xmission.com
Cc: Greg KH <gregkh@suse.de>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On 05/05/10 14:54, ebiederm@xmission.com wrote:
> 
> It appears gcc can't cope with using an enum that is only declared in
> an inline function declaration, that doesn't even use the variable
> that is so declared.
> 
> Avoid the silliness and replace the enum with an int, and make gcc
> happy.
> 
> Signed-off-by: Eric W. Biederman <ebiederm@aristanetworks.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, Eric.

> ---
>  include/linux/sysfs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index e58ca1c..17cbeb7 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -318,7 +318,7 @@ static inline void sysfs_put(struct sysfs_dirent *sd)
>  {
>  }
>  
> -static inline void sysfs_exit_ns(enum kobj_ns_type type, const void *tag)
> +static inline void sysfs_exit_ns(int type, const void *tag)
>  {
>  }
>  


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
