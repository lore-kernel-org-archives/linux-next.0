From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] linux-next: xfs tree build warnings
Date: Mon, 29 Dec 2008 09:36:50 +0100
Message-ID: <20081229083650.GA14699@lst.de>
References: <20081229192649.7099188b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:42156 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752583AbYL2IhO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 03:37:14 -0500
Content-Disposition: inline
In-Reply-To: <20081229192649.7099188b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org

On Mon, Dec 29, 2008 at 07:26:49PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:

Yeah, just noticed when doing my first ppc64 build after a while.  For
now I threw a patch in to always make xfs_ino and unsigned long long
and it works so far.  I'll make sure this or another fix goes in through
the usual ways.
