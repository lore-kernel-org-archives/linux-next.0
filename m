From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Wed, 02 Jul 2008 10:50:23 +0100
Message-ID: <1214992223.10393.455.camel@pmac.infradead.org>
References: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
	 <20080701150953.7c349271@lxorguk.ukuu.org.uk>
	 <1214924845.10393.399.camel@pmac.infradead.org>
	 <20080701162942.286670c7@lxorguk.ukuu.org.uk>
	 <1214989294.10393.450.camel@pmac.infradead.org>
	 <20080702101738.22a14658@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:41528 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763326AbYGBJu3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 05:50:29 -0400
In-Reply-To: <20080702101738.22a14658@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 2008-07-02 at 10:17 +0100, Alan Cox wrote:
> > One option is perhaps to split up my patches into two parts -- the part
> > which modifies the driver to use request_firmware() (and removes the old
> > version of the firmware), and the part which adds the firmware back in
> > the firmware/ directory. You could carry the first patch, while I carry
> > the second.
> 
> What I've done for now is regenerated the diffs versus the firmware tree.
> That means the firmware tree has to get thrown at Linus first (or I have
> to regenerate it later without) but that itself isn't a big problem and
> means that ttydev is now in -next and can actually get a good testing.

Ok. I plan to throw it at Linus as soon as he opens the merge window,
anyway.

Are you using git, or patches? I've been going back and recommitting
stuff rather than committing incremental patches, which has much the
same effect as rebasing.

I was doing that on the basis that I had nobody 'downstream' pulling
from the tree. If you are doing that though, then I can stop (which
isn't much of an issue for me; I've fairly much stopped going back and
rewriting parts of it anyway).

-- 
dwmw2
