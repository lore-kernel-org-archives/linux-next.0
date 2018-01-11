From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Thu, 11 Jan 2018 18:50:30 +0100
Message-ID: <20180111175030.GA27093@kroah.com>
References: <20180110071830.6c7ccd1f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34689 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934484AbeAKRub (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Jan 2018 12:50:31 -0500
Content-Disposition: inline
In-Reply-To: <20180110071830.6c7ccd1f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 10, 2018 at 07:18:30AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Commits
> 
>   97c6166001ef ("Staging: rtlwifi: Remove unused variable and the code")
>   357f862bd214 ("staging: comedi: adv_pci1760: fix typo in comments")
>   23cb746b5e9d ("staging: rtl8192u: Replace mdelay with msleep in rtl8192_usb_probe")
>   beac4303532f ("Staging: vt6656: Fix unnecessary 'out of memory' message")
> 
> are missing a Signed-off-by from their committer.

Crap, this has been a long month, sorry about that.  I'll go work on
getting that git hook in place to prevent this from happening again...

greg k-h
