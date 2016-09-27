From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 27 Sep 2016 15:39:49 +0200
Message-ID: <20160927133949.GA21231@lst.de>
References: <20160927112334.3615159e@canb.auug.org.au> <20160927050415.GA2024@lst.de> <20160927154820.11d17334@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:54741 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752839AbcI0Njx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 09:39:53 -0400
Content-Disposition: inline
In-Reply-To: <20160927154820.11d17334@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 27, 2016 at 03:48:20PM +1000, Stephen Rothwell wrote:
> Yeah, sorry.  Note, however, that you bothered to fix up this same
> staging file in another of your patches ...

It's generally not that I don't fix them up because I hate them, it's
just because they are doing something so incredibly stupid that it would
take forever to fix up (and something that would have been could if it
ever had been through review).   For this particular case I think everyone
would be served much better if this module was simply dropped from the
tree, as there will be lots of future patches that will break it.
