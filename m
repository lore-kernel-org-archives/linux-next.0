From: Bernhard Walle <bwalle@suse.de>
Subject: Re: linux-next: Tree for July 29
Date: Wed, 30 Jul 2008 09:06:50 +0200
Message-ID: <20080730090650.79a5a749@kopernikus.site>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au>
	<200807291825.14281.bzolnier@gmail.com>
	<20080729181639.GA21311@suse.de>
	<Pine.LNX.4.64.0807292145220.28604@blonde.site>
	<20080730044834.GB2954@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39507 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751877AbYG3HGx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 03:06:53 -0400
In-Reply-To: <20080730044834.GB2954@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Hugh Dickins <hugh@veritas.com>, Greg KH <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <haveblue@us.ibm.com>

* Greg KH <greg@kroah.com> [2008-07-29 21:48]:
> > Isn't this the opposite end of the same problem for which Bernhard
> > has been repeatedly trying to find a taker for his patch:
> > 
> > http://article.gmane.org/gmane.linux.kernel.kexec/1882
> 
> Yes.  It's not the kobject patch at fault here, it's the use of kobjects
> so early in the boot process.  That needs to be fixed.

Yes, but if somebody could tell me why nobody takes the patch, I would
be happy. Then I would be able to improve the patch. :)




Bernhard
-- 
Bernhard Walle, SUSE LINUX Products GmbH, Architecture Development
