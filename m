From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dynamic_debug: use printk(KERN_WARNING..) in stub
 function
Date: Tue, 1 May 2012 09:44:36 -0400
Message-ID: <20120501134436.GA31954@kroah.com>
References: <1335871392-2222-1-git-send-email-jim.cromie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:42596 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756657Ab2EANom (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 May 2012 09:44:42 -0400
Received: by ghrr11 with SMTP id r11so1938820ghr.19
        for <linux-next@vger.kernel.org>; Tue, 01 May 2012 06:44:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1335871392-2222-1-git-send-email-jim.cromie@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Roland Dreier <roland@purestorage.com>, Jason Baron <jbaron@redhat.com>, Joe Perches <joe@perches.com>

On Tue, May 01, 2012 at 05:23:12AM -0600, Jim Cromie wrote:
> drivers/infiniband/ulp/srp/ib_srp.c #defines pr_fmt() PFX fmt, but PFX
> is not #defined until after <linux/*> headers are included.
> 
> This results in a bad expansion of the pr_warn() in the stub function.
> 
> 2084c2084
> <   printk("<4>" PFX "dyndbg supported only in " "CONFIG_DYNAMIC_DEBUG builds\n")
> ---
> >   printk("<4>" "guano" "dyndbg supported only in " "CONFIG_DYNAMIC_DEBUG builds\n")
> (END)
> 
> While that use-case is less than ideal, it will probably happen again,
> and its easy to avoid by using raw printk().

Thanks, now applied.

greg k-h
