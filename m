From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Tue, 25 Sep 2012 15:41:36 -0700
Message-ID: <20120925224136.GA6366@kroah.com>
References: <20120925003644.aa90318c8f407539b08db48e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57573 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751309Ab2IYWli (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Sep 2012 18:41:38 -0400
Content-Disposition: inline
In-Reply-To: <20120925003644.aa90318c8f407539b08db48e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaeden Amero <jaeden.amero@ni.com>, Alan Cox <alan@linux.intel.com>

On Tue, Sep 25, 2012 at 12:36:44AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> fs/compat_ioctl.c:868:1: error: 'TIOCSRS485' undeclared here (not in a function)
> fs/compat_ioctl.c:869:1: error: 'TIOCGRS485' undeclared here (not in a function)
> 
> Caused by commit 84c3b8486044 ("compat_ioctl: Add RS-485 IOCTLs to the
> list") from the tty tree.

Thanks, Jaeden just sent me a fix for this, I'll go apply it.

greg k-h
