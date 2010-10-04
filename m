From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the bkl-trivial tree with the hfsplus tree
Date: Mon, 4 Oct 2010 05:34:41 +0200
Message-ID: <20101004033441.GA6867@lst.de>
References: <20101004104740.822b987d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:49380 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751540Ab0JDDet (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Oct 2010 23:34:49 -0400
Content-Disposition: inline
In-Reply-To: <20101004104740.822b987d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 04, 2010 at 10:47:40AM +1100, Stephen Rothwell wrote:
> Hi Arnd,
> 
> The second of the hfsplus tree commits seems to supercede the bkl-trivial
> one, so I used that.

Yes, the hfsplus tree contains a proper BKL removal for hfsplus.
