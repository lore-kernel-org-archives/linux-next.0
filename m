From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Thu, 2 Oct 2014 09:31:49 -0700
Message-ID: <20141002163149.GA1056@kroah.com>
References: <20140930180416.5ae64587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49235 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750901AbaJBQbz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Oct 2014 12:31:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by gateway2.nyi.internal (Postfix) with ESMTP id A357820BDB
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2014 12:31:50 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140930180416.5ae64587@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tapasweni Pathak <tapaswenipathak@gmail.com>

On Tue, Sep 30, 2014 at 06:04:16PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/staging/media/cxd2099/cxd2099.c: In function 'slot_reset':
> drivers/staging/media/cxd2099/cxd2099.c:537:4: error: expected ';' before 'if'
>     if (ci->ready)
>     ^
> 
> Caused by commit 7b86477c0e5b ("staging: media: cxd2099: use
> usleep_range()").
> 
> I have reverted that commit for today.

Now fixed, thanks.

greg k-h
