From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG -next] sysfs change breaks userspace
Date: Fri, 1 Nov 2013 15:13:48 +0100
Message-ID: <20131101141348.GA5411@osiris>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:57621 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753318Ab3KAONz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 10:13:55 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 1 Nov 2013 14:13:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id A3461219005E
	for <linux-next@vger.kernel.org>; Fri,  1 Nov 2013 14:13:49 +0000 (GMT)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com [9.149.37.249])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rA1EDbvg66650222
	for <linux-next@vger.kernel.org>; Fri, 1 Nov 2013 14:13:37 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rA1EDmDI009497
	for <linux-next@vger.kernel.org>; Fri, 1 Nov 2013 08:13:49 -0600
Content-Disposition: inline
In-Reply-To: <20131031172506.GE11698@mtj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

On Thu, Oct 31, 2013 at 01:25:06PM -0400, Tejun Heo wrote:
> Hello, Heiko.
> 
> On Thu, Oct 31, 2013 at 12:43:58PM +0100, Heiko Carstens wrote:
> > Hi Tejun,
> > 
> > I just tried out linux-next and my network doesn't come up anymore.
> > Userspace fails like this:
> > 
> > network[2211]: Bringing up interface eth0:  sysfs read broadcast value: Invalid argument
> > 
> > I bisected that down to:
> > 
> > commit 13c589d5b0ac654d9da7e490a2dd548e6b86b4a5
> > Author: Tejun Heo <tj@kernel.org>
> > Date:   Tue Oct 1 17:42:02 2013 -0400
> > 
> >     sysfs: use seq_file when reading regular files
> 
> Heh, intereting.  The content doesn't change over multiple show
> invocations, so the behavior shouldn't change at all for the attribute
> and seq_file handles seeking and partial reads correctly.  No idea
> what could go wrong there.  It probably was reading
> /sys/devices/BLAHBLAH/net/NETIF/broadcast file.  Can you please locate
> the file and do "ls -l" and "cat" on it?  If that looks normal, can
> you please strace the network interface config program / script /
> whatever?  BTW, what are you running on the system?

Ok, here we go:

before your patch it was like this:

[pid  2888] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
[pid  2888] lseek(5, 0, SEEK_END)       = 4096
[pid  2888] lseek(5, 0, SEEK_SET)       = 0
[pid  2888] read(5, "ff:ff:ff:ff:ff:ff\n", 4096) = 18
[pid  2888] close(5)                    = 0

With your patch applied I get this:

[pid  2450] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
[pid  2450] lseek(5, 0, SEEK_END)       = -1 EINVAL (Invalid argument)
[pid  2450] lseek(5, 0, SEEK_SET)       = 0
[pid  2450] read(5, 0x557421e8, 4294967295) = -1 EINVAL (Invalid argument)
[pid  2450] close(5)                    = 0

So the problem is that lseek with SEEK_END doesn't work.
Afterwards the process tried to use the return value of lseek as number of
bytes to be read, which doesn't work ;)

This is a Fedora 17 like system on s390. It's a bit special since the kernel
is 64 bit and whole user space is 32 bit.
