From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warnings after merge of the uuid tree
Date: Mon, 5 Jun 2017 16:41:58 +0200
Message-ID: <20170605144158.GA28659@lst.de>
References: <20170605160928.2930133d@canb.auug.org.au> <1496673610.22624.7.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:40422 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751112AbdFEOmA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jun 2017 10:42:00 -0400
Content-Disposition: inline
In-Reply-To: <1496673610.22624.7.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 05, 2017 at 05:40:10PM +0300, Andy Shevchenko wrote:
> On Mon, 2017-06-05 at 16:09 +1000, Stephen Rothwell wrote:
> > Hi Christoph,
> > 
> > After merging the uuid tree, today's linux-next build (arm
> > multi_v7_defconfig and x86_64 allmodconfig) produced these warnings:
> > 
> 
> Briefly looking to the conflict it looks like we first need to rename
> register description(s) in dwc2 in the way how it's done in dwc3.

They probably should do that.  But I also think GUID and UUID
are too generic names for a macro and would like to change them
in uuid.h
