From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 24 - missing files in
 drivers/media/dvb/
Date: Sun, 29 Jun 2008 08:43:17 -0300
Message-ID: <20080629084317.3392dac9@gaivota>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au>
	<486134B4.4050400@linux.vnet.ibm.com>
	<20080625132810.6f31b571.sfr@canb.auug.org.au>
	<20080625134859.6bc218c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:51353 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbYF2Lnc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 29 Jun 2008 07:43:32 -0400
In-Reply-To: <20080625134859.6bc218c4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-testers@vger.kernel.org, v4l-dvb-maintainer@linuxtv.org, Andy Whitcroft <apw@shadowen.org>

On Wed, 25 Jun 2008 13:48:59 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Wed, 25 Jun 2008 13:28:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 24 Jun 2008 23:23:56 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:
> > >
> > > allyesconfig kernel build on next-20080624, fails due to missing files
> > > 
> > > drivers/media/video/em28xx/em28xx-dvb.c:30:22: error: drx397xD.h: No such file or directory
> > 
> > To fix this, I have reverted commit
> > 969ff74e0ab707801150dc83eb254794bc574442 ("V4L/DVB (8006): em28xx: Split
> > HVR900 into two separate entries") from linux-next for today.
> 
> Although, on reflection, this may have been caused by the mismerge
> yesterday.  I will leave it in tomorrow unless I am told otherwise.

Thanks for the report. I've fixed the two reported issues and now it should compile fine.

Cheers,
Mauro
