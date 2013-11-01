From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Fri, 1 Nov 2013 09:14:43 -0700
Message-ID: <20131101161443.GA4593@kroah.com>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
 <20131101143542.GC20005@htj.dyndns.org>
 <20131101150448.GB18600@kroah.com>
 <20131101150800.GE20005@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50261 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754376Ab3KAQOo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 12:14:44 -0400
Content-Disposition: inline
In-Reply-To: <20131101150800.GE20005@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

On Fri, Nov 01, 2013 at 11:08:00AM -0400, Tejun Heo wrote:
> Hello, Greg.
> 
> On Fri, Nov 01, 2013 at 08:04:48AM -0700, Greg Kroah-Hartman wrote:
> > > @@ -800,7 +800,7 @@ EXPORT_SYMBOL_GPL(sysfs_notify);
> > >  const struct file_operations sysfs_file_operations = {
> > >  	.read		= seq_read,
> > >  	.write		= sysfs_write_file,
> > > -	.llseek		= seq_lseek,
> > > +	.llseek		= generic_file_llseek,
> > 
> > Does that mean that seq_lseek can't handle SEEK_END?  Shouldn't we fix
> > that instead?
> 
> As the files are dynamic, seq_file has no way of knowing whether the
> file is gonna end at all.  It's perfectly valid to have an infinite
> file.  The only benefits of using seq_lseek() instead of
> generic_file_llseek() are
> 
> * Early failure.  For whatever reason, traversing to certain file
>   position should fail, seq_lseek() will report such failure on
>   seek(2) instead of the following read/write operations.
> 
> * EOF detection.  While SEEK_END is not supported, SEEK_SET/CUR +
>   large offset can be used to detect eof - eof at the time of the last
>   seek anyway as the file size may change dynamically.
> 
> I don't think either would matter for sysfs or for prospect kernfs
> users and sticking with genefic_file_llseek() should be fine.

Ok, you are right, that makes sense as sysfs files do have an end,
although it seems odd that userspace would care to try to find it and
not just do a seek to the start of the file.

Fun userspace oddities, just when you thought you had seen it all...

thanks,

greg k-h
