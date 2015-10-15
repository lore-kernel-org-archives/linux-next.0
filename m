From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 15 Oct 2015 14:51:42 +1100
Message-ID: <20151015145142.54e537a4@canb.auug.org.au>
References: <20151015115108.57c04f61@canb.auug.org.au>
	<1444880141.2926.28.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48846 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751259AbbJODvo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 23:51:44 -0400
In-Reply-To: <1444880141.2926.28.camel@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Koul, Vinod" <vinod.koul@intel.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Vinod,

On Thu, 15 Oct 2015 03:35:42 +0000 "Koul, Vinod" <vinod.koul@intel.com> wrote:
>
> So should I ask Linus to apply this fix once merge window opens or you will send
> this, how do we go about fixing this one :)
> 
> Or should I merge the above commit from asm-generic tree?

Up to you.  Though you should only merge fro mthe asm-generic tree if
the maintainer guarantees it will not be rebased.

You could just wait and tell Linus that this fixup is needed when the
two trees are merged.  It really need to go into the merge commit to
avoid bisection problems.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
