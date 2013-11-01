From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH driver-core-next] sysfs: use generic_file_llseek() for
 sysfs_file_operations
Date: Fri, 1 Nov 2013 10:19:13 -0700
Message-ID: <20131101171913.GA2241@kroah.com>
References: <20131031114358.GA5551@osiris>
 <20131031172506.GE11698@mtj.dyndns.org>
 <20131101141348.GA5411@osiris>
 <20131101143542.GC20005@htj.dyndns.org>
 <20131101150448.GB18600@kroah.com>
 <20131101150800.GE20005@htj.dyndns.org>
 <20131101161443.GA4593@kroah.com>
 <20131101171653.GA3669@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51799 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754253Ab3KARTO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 13:19:14 -0400
Content-Disposition: inline
In-Reply-To: <20131101171653.GA3669@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 01, 2013 at 01:16:53PM -0400, Tejun Heo wrote:
> Hey, Greg.
> 
> Here's proper patch with description and SOB.  I'll be traveling from
> tomorrow so I might not be responsive for some days.  Can you please
> apply it once Heiko confirms it fixes the issue?

Will do.

Heiko, let me know if this fixes your problem or not, thanks.

greg k-h
