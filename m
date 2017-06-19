From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Mon, 19 Jun 2017 13:06:30 +0300
Message-ID: <1497866790.22624.164.camel@linux.intel.com>
References: <20170616152136.161630bf@canb.auug.org.au>
         <20170619091942.GA2702@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:9064 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751090AbdFSKGf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 06:06:35 -0400
In-Reply-To: <20170619091942.GA2702@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tyler Baicar <tbaicar@codeaurora.org>

On Mon, 2017-06-19 at 10:19 +0100, Will Deacon wrote:
> Hi Stephen, Christoph, Tyler,
> On Fri, Jun 16, 2017 at 03:21:36PM +1000, Stephen Rothwell wrote:
> > 

> Apologies for this: I've just dropped the offending merge from the
> arm64
> tree so you can include the uuid tree in -next again.
> 
> Tyler: please rebase your patches on top of Christoph's uuid-types
> branch
> and send me a new series.

To have better coordination, please, look at my WIP branch regarding
UUID stuff:
http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
