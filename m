From: Dave Chinner <david@fromorbit.com>
Subject: Re: next-20160722 build: 1 failures 5 warnings (next-20160722)
Date: Fri, 22 Jul 2016 21:58:34 +1000
Message-ID: <20160722115834.GR16044@dastard>
References: <E1bQXSf-0008Uu-Ej@optimist>
 <20160722103829.GY6509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl6.internode.on.net ([150.101.137.143]:21791 "EHLO
	ipmail05.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753333AbcGVL6j (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 07:58:39 -0400
Content-Disposition: inline
In-Reply-To: <20160722103829.GY6509@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matthew Wilcox <matthew.r.wilcox@intel.com>, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>, xfs@oss.sgi.com, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

On Fri, Jul 22, 2016 at 11:38:29AM +0100, Mark Brown wrote:
> On Fri, Jul 22, 2016 at 11:13:41AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an ARM allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!

Already fixed.

https://git.kernel.org/cgit/linux/kernel/git/dgc/linux-xfs.git/commit/?h=for-next&id=f021bd071f06b545926b1031348873b05442139f

-- 
Dave Chinner
david@fromorbit.com
