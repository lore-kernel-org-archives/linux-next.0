From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (mfd
 tree related)
Date: Mon, 17 Sep 2012 15:28:36 +0200
Message-ID: <20120917132836.GS3647@sortiz-mobl>
References: <20120917213833.2b3ac86e097d131065a0541d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:31007 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751153Ab2IQN2j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Sep 2012 09:28:39 -0400
Content-Disposition: inline
In-Reply-To: <20120917213833.2b3ac86e097d131065a0541d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gyungoh Yoo <jack.yoo@maxim-ic.com>, Stephen Warren <swarren@nvidia.com>

Hi Stephen,

On Mon, Sep 17, 2012 at 09:38:33PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/mfd/max8907.c: In function 'max8907_i2c_probe':
> drivers/mfd/max8907.c:248:10: error: too few arguments to function 'mfd_add_devices'
> include/linux/mfd/core.h:100:12: note: declared here
> 
> Caused by commit 6c2591532a6f ("mfd: Add MAX8907 core driver") from the
> mfd tree interacting with commit 0848c94fb4a5 ("mfd: core: Push irqdomain
> mapping out into devices") from Linus' tree.
My bad. And Stephen even warned me about it...
It should be all fixed now, sorry about that.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
