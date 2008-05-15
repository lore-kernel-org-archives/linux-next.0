From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: i2c/driver-core merge conflict
Date: Thu, 15 May 2008 11:47:15 -0700
Message-ID: <20080515184715.GA15572@kroah.com>
References: <20080515120006.b336a720.sfr@canb.auug.org.au> <20080515030942.GA1638@kroah.com> <20080515095814.49e03731@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:50664 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755017AbYEOTuO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 May 2008 15:50:14 -0400
Content-Disposition: inline
In-Reply-To: <20080515095814.49e03731@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Thu, May 15, 2008 at 09:58:14AM +0200, Jean Delvare wrote:
> On Wed, 14 May 2008 20:09:42 -0700, Greg KH wrote:
> > On Thu, May 15, 2008 at 12:00:06PM +1000, Stephen Rothwell wrote:
> > > Hi Jean, Greg,
> > > 
> > > Today's linux-next merge of the i2c tree got a conflict in
> > > include/linux/i2c.h between commit
> > > e38c93bf253cb3176478a1943cd2306e8413d2bb ("driver core: remove
> > > KOBJ_NAME_LEN define") from the driver-core tree and commit
> > > f625810ef235a8b238427df3129792f89187c085 ("i2c: Kill the old driver
> > > matching scheme") from the i2c tree.  The former changes the definition
> > > of driver_name in two places, the letter removes the definitions.  I went
> > > with the latter.
> > 
> > Thanks, that should be the correct one.
> 
> Correct, thanks.
> 
> Greg, note that I plan to send this patch to Linus quickly, so you will
> have to adjust your patch (i.e. simply remove the linux/i2c.h chunks
> that no longer apply) for 2.6.26-rc3.

No problem, I will adjust them after your patches go to Linus, mine are
queued up for 2.6.27, not .26.

thanks,

greg k-h
