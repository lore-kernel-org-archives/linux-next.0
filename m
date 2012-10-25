From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Wed, 24 Oct 2012 19:17:19 -0700
Message-ID: <20121025021719.GB1603@kroah.com>
References: <20121025130545.5755af42c5573e2253866913@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41268 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759120Ab2JYCQn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Oct 2012 22:16:43 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so1642002pbb.19
        for <linux-next@vger.kernel.org>; Wed, 24 Oct 2012 19:16:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20121025130545.5755af42c5573e2253866913@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>

On Thu, Oct 25, 2012 at 01:05:45PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/misc/ezusb.c between commit 197ef5ef37d9 ("USB: Add missing
> license tag to ezusb driver") from the usb.current tree and commitc
> 30186e51e53 ("USB: ezusb: unexport some functions that aren't being
> used") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
