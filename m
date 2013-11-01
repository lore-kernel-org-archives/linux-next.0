From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH driver-core-next] sysfs: use generic_file_llseek() for
 sysfs_file_operations
Date: Fri, 1 Nov 2013 19:40:36 +0100
Message-ID: <20131101184036.GA3597@osiris>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
 <20131101143542.GC20005@htj.dyndns.org>
 <20131101150448.GB18600@kroah.com>
 <20131101150800.GE20005@htj.dyndns.org>
 <20131101161443.GA4593@kroah.com>
 <20131101171653.GA3669@htj.dyndns.org>
 <20131101171913.GA2241@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:58429 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752328Ab3KASl4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 14:41:56 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 1 Nov 2013 18:41:55 -0000
Content-Disposition: inline
In-Reply-To: <20131101171913.GA2241@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 01, 2013 at 10:19:13AM -0700, Greg Kroah-Hartman wrote:
> On Fri, Nov 01, 2013 at 01:16:53PM -0400, Tejun Heo wrote:
> > Hey, Greg.
> > 
> > Here's proper patch with description and SOB.  I'll be traveling from
> > tomorrow so I might not be responsive for some days.  Can you please
> > apply it once Heiko confirms it fixes the issue?
> 
> Will do.
> 
> Heiko, let me know if this fixes your problem or not, thanks.

Yes it does fix the problem. strace output looks like before:

[pid  2495] open("/sys/class/net/eth0/broadcast", O_RDONLY) = 5
[pid  2495] lseek(5, 0, SEEK_END)       = 4096
[pid  2495] lseek(5, 0, SEEK_SET)       = 0
[pid  2495] read(5, "ff:ff:ff:ff:ff:ff\n", 4096) = 18
[pid  2495] close(5)                    = 0

Tested-by: Heiko Carstens <heiko.carstens@de.ibm.com>
