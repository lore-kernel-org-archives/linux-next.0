From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the sh tree
Date: Tue, 3 Mar 2009 09:12:18 +0900
Message-ID: <20090303001217.GB4781@linux-sh.org>
References: <20090303104533.e411cdff.sfr@canb.auug.org.au> <20090302235926.GA2690@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:57362 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759417AbZCCAQI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 19:16:08 -0500
Content-Disposition: inline
In-Reply-To: <20090302235926.GA2690@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Adrian McMenamin <adrian@mcmen.demon.co.uk>

On Mon, Mar 02, 2009 at 03:59:26PM -0800, Greg KH wrote:
> On Tue, Mar 03, 2009 at 10:45:33AM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the driver-core tree got a conflict in
> > drivers/sh/maple/maple.c between commit
> > b233b28eac0cc37d07c2d007ea08c86c778c5af4 ("sh: maple: Support block reads
> > and writes") from the sh tree and commit
> > f1f93f5605f08a698418e52828bef46973b6a4ec ("sh: struct device - replace
> > bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> > 
> > Maybe we could persuade Paul to apply the driver-core patch (not the
> > patch below)to the sh tree (assuming he has been sent a copy)?
> 
> I think he was sent a copy, Kay?
> 
> Anyway, Paul, here's the patch, could you take this through your tree to
> prevent future conflicts?  It should build and work today, no
> dependancies on any other patch
> 
I'm a bit behind on pending patches due to travel, so it's possible I
just missed the earlier iteration. In any event, I've queued this up now,
thanks!
