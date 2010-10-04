From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bkl-trivial tree with the hfsplus tree
Date: Mon, 4 Oct 2010 10:23:45 +0200
Message-ID: <201010041023.45694.arnd@arndb.de>
References: <20101004104740.822b987d.sfr@canb.auug.org.au> <20101004033441.GA6867@lst.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:57993 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753115Ab0JDIXy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2010 04:23:54 -0400
In-Reply-To: <20101004033441.GA6867@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 04 October 2010 05:34:41 Christoph Hellwig wrote:
> On Mon, Oct 04, 2010 at 10:47:40AM +1100, Stephen Rothwell wrote:
> > Hi Arnd,
> > 
> > The second of the hfsplus tree commits seems to supercede the bkl-trivial
> > one, so I used that.
> 
> Yes, the hfsplus tree contains a proper BKL removal for hfsplus.

Ok. I've removed the pushdown into hfsplus and subsequent removal from my
tree now, thanks! I've also removed the pushdown from other file systems
that are already BKL-free.

Christoph, are you planning to take care of freevxfs, too? I can't figure
out whether readdir and lookup actually need locking there.

	Arnd
