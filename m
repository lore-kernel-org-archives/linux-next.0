From: Tejun Heo <tj@kernel.org>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Fri, 1 Nov 2013 11:08:00 -0400
Message-ID: <20131101150800.GE20005@htj.dyndns.org>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
 <20131101143542.GC20005@htj.dyndns.org>
 <20131101150448.GB18600@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:44066 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732Ab3KAPIF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 11:08:05 -0400
Received: by mail-qa0-f43.google.com with SMTP id i13so680469qae.9
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2013 08:08:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20131101150448.GB18600@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

Hello, Greg.

On Fri, Nov 01, 2013 at 08:04:48AM -0700, Greg Kroah-Hartman wrote:
> > @@ -800,7 +800,7 @@ EXPORT_SYMBOL_GPL(sysfs_notify);
> >  const struct file_operations sysfs_file_operations = {
> >  	.read		= seq_read,
> >  	.write		= sysfs_write_file,
> > -	.llseek		= seq_lseek,
> > +	.llseek		= generic_file_llseek,
> 
> Does that mean that seq_lseek can't handle SEEK_END?  Shouldn't we fix
> that instead?

As the files are dynamic, seq_file has no way of knowing whether the
file is gonna end at all.  It's perfectly valid to have an infinite
file.  The only benefits of using seq_lseek() instead of
generic_file_llseek() are

* Early failure.  For whatever reason, traversing to certain file
  position should fail, seq_lseek() will report such failure on
  seek(2) instead of the following read/write operations.

* EOF detection.  While SEEK_END is not supported, SEEK_SET/CUR +
  large offset can be used to detect eof - eof at the time of the last
  seek anyway as the file size may change dynamically.

I don't think either would matter for sysfs or for prospect kernfs
users and sticking with genefic_file_llseek() should be fine.

Thanks.

-- 
tejun
