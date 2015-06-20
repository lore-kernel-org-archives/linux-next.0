From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Sat, 20 Jun 2015 07:50:34 -0700
Message-ID: <20150620145034.GA28249@kroah.com>
References: <20150529204002.1cd0cc0a@canb.auug.org.au>
 <20150601185012.093db327@canb.auug.org.au>
 <20150620204826.010cd35a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41928 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754382AbbFTOui (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 10:50:38 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E594B20302
	for <linux-next@vger.kernel.org>; Sat, 20 Jun 2015 10:50:35 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150620204826.010cd35a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johnny Kim <johnny.kim@atmel.com>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>

On Sat, Jun 20, 2015 at 08:48:26PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 1 Jun 2015 18:50:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 29 May 2015 20:40:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the staging tree, today's linux-next build (x86_64
> > > allmodconfig) produced a large number of warnings in
> > > drivers/staging/wilc1000.
> > 
> > Since there are so many warnings, I have disabled the driver for now.
> 
> I tried building this with the driver enabled but it still produces and
> inordinate number of warnings, so I have disabled it again.  Please
> either get them sorted out or disable this driver before asking Linus
> to merge it.

Yeah, I know, I keep asking the driver authors for fixes, but nothing
has shown up yet except cosmetic changes.  I'm going to disable it as no
one seems willing to do the work, which is sad.

greg k-h
