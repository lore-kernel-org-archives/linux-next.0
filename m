From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 18 Apr 2017 07:54:40 +0200
Message-ID: <20170418055440.GA31928@kroah.com>
References: <20170418153220.734e83f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37197 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753784AbdDRFyt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 01:54:49 -0400
Content-Disposition: inline
In-Reply-To: <20170418153220.734e83f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Apr 18, 2017 at 03:32:20PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> make[7]: *** No rule to make target 'drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/uds/uds_1.0/ia_css_uds.host.o', needed by 'drivers/staging/media/atomisp/pci/atomisp2/atomisp.o'.  Stop.
> 
> Caused by commit
> 
>   7afe8f84f793 ("atomisp: remove UDS kernel code")
> 
> I have used the staging tree from next-20170413 for today.

Ok, the 0-day bot reported something odd like this, with Alan's original
patches, but I couldn't reproduce it, and then when I applied them, the
0-day bot worked just fine.  But now you are having the same issue.

I'm totally confused, Alan, any ideas?

thanks,

greg k-h
