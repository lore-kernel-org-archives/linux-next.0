From: Tejun Heo <tj@kernel.org>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Fri, 1 Nov 2013 10:35:42 -0400
Message-ID: <20131101143542.GC20005@htj.dyndns.org>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:51931 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132Ab3KAOfq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 10:35:46 -0400
Received: by mail-qc0-f172.google.com with SMTP id c9so2497728qcz.31
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2013 07:35:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20131101141348.GA5411@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

Hello, Heiko.

On Fri, Nov 01, 2013 at 03:13:48PM +0100, Heiko Carstens wrote:
> before your patch it was like this:
> 
> [pid  2888] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
> [pid  2888] lseek(5, 0, SEEK_END)       = 4096
> [pid  2888] lseek(5, 0, SEEK_SET)       = 0
> [pid  2888] read(5, "ff:ff:ff:ff:ff:ff\n", 4096) = 18
> [pid  2888] close(5)                    = 0
> 
> With your patch applied I get this:
> 
> [pid  2450] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
> [pid  2450] lseek(5, 0, SEEK_END)       = -1 EINVAL (Invalid argument)
> [pid  2450] lseek(5, 0, SEEK_SET)       = 0
> [pid  2450] read(5, 0x557421e8, 4294967295) = -1 EINVAL (Invalid argument)
> [pid  2450] close(5)                    = 0
> 
> So the problem is that lseek with SEEK_END doesn't work.
> Afterwards the process tried to use the return value of lseek as number of
> bytes to be read, which doesn't work ;)
> 
> This is a Fedora 17 like system on s390. It's a bit special since the kernel
> is 64 bit and whole user space is 32 bit.

LOL, that's creative.  I guess we'll have to give up using
seq_lseek().  Can you please test the following?

Thanks.

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 382db3c..79b5da2 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -800,7 +800,7 @@ EXPORT_SYMBOL_GPL(sysfs_notify);
 const struct file_operations sysfs_file_operations = {
 	.read		= seq_read,
 	.write		= sysfs_write_file,
-	.llseek		= seq_lseek,
+	.llseek		= generic_file_llseek,
 	.open		= sysfs_open_file,
 	.release	= sysfs_release,
 	.poll		= sysfs_poll,

-- 
tejun
