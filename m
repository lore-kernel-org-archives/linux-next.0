From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: staging tree build failure
Date: Wed, 9 Dec 2009 10:29:22 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.0912091026210.4120-100000@iolanthe.rowland.org>
References: <20091209165646.41b9ce8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:41460 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753571AbZLIP3P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2009 10:29:15 -0500
In-Reply-To: <20091209165646.41b9ce8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>

On Wed, 9 Dec 2009, Stephen Rothwell wrote:

> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/net/usb/kaweth.c: In function 'kaweth_open':
> drivers/net/usb/kaweth.c:719: error: implicit declaration of function 'usb_autopm_enable'
> 
> Caused by commit b3f937e6ddf3e60ed9b4c26349b7b171dffdd010 ("USB: prepare
> for changover to Runtime PM framework").
> 
> I have reverted that commit for today.

This should have been okay because of Oliver's patch:

	http://marc.info/?l=linux-netdev&m=125071045301270&w=2

which removed the offending reference.  Hasn't it been merged yet?  
It was submitted back in August.

Alan Stern
