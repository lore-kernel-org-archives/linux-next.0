From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Fri, 1 Nov 2013 08:04:48 -0700
Message-ID: <20131101150448.GB18600@kroah.com>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
 <20131101143542.GC20005@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49001 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751897Ab3KAPCn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 11:02:43 -0400
Content-Disposition: inline
In-Reply-To: <20131101143542.GC20005@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

On Fri, Nov 01, 2013 at 10:35:42AM -0400, Tejun Heo wrote:
> Hello, Heiko.
> 
> On Fri, Nov 01, 2013 at 03:13:48PM +0100, Heiko Carstens wrote:
> > before your patch it was like this:
> > 
> > [pid  2888] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
> > [pid  2888] lseek(5, 0, SEEK_END)       = 4096
> > [pid  2888] lseek(5, 0, SEEK_SET)       = 0
> > [pid  2888] read(5, "ff:ff:ff:ff:ff:ff\n", 4096) = 18
> > [pid  2888] close(5)                    = 0
> > 
> > With your patch applied I get this:
> > 
> > [pid  2450] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
> > [pid  2450] lseek(5, 0, SEEK_END)       = -1 EINVAL (Invalid argument)
> > [pid  2450] lseek(5, 0, SEEK_SET)       = 0
> > [pid  2450] read(5, 0x557421e8, 4294967295) = -1 EINVAL (Invalid argument)
> > [pid  2450] close(5)                    = 0
> > 
> > So the problem is that lseek with SEEK_END doesn't work.
> > Afterwards the process tried to use the return value of lseek as number of
> > bytes to be read, which doesn't work ;)
> > 
> > This is a Fedora 17 like system on s390. It's a bit special since the kernel
> > is 64 bit and whole user space is 32 bit.
> 
> LOL, that's creative.  I guess we'll have to give up using
> seq_lseek().  Can you please test the following?
> 
> Thanks.
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 382db3c..79b5da2 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -800,7 +800,7 @@ EXPORT_SYMBOL_GPL(sysfs_notify);
>  const struct file_operations sysfs_file_operations = {
>  	.read		= seq_read,
>  	.write		= sysfs_write_file,
> -	.llseek		= seq_lseek,
> +	.llseek		= generic_file_llseek,

Does that mean that seq_lseek can't handle SEEK_END?  Shouldn't we fix
that instead?

thanks,

greg k-h
