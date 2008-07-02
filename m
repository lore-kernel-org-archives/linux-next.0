From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Wed, 2 Jul 2008 10:17:38 +0100
Message-ID: <20080702101738.22a14658@lxorguk.ukuu.org.uk>
References: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
	<20080701150953.7c349271@lxorguk.ukuu.org.uk>
	<1214924845.10393.399.camel@pmac.infradead.org>
	<20080701162942.286670c7@lxorguk.ukuu.org.uk>
	<1214989294.10393.450.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:45982 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752464AbYGBJfU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 05:35:20 -0400
In-Reply-To: <1214989294.10393.450.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

> One option is perhaps to split up my patches into two parts -- the part
> which modifies the driver to use request_firmware() (and removes the old
> version of the firmware), and the part which adds the firmware back in
> the firmware/ directory. You could carry the first patch, while I carry
> the second.

What I've done for now is regenerated the diffs versus the firmware tree.
That means the firmware tree has to get thrown at Linus first (or I have
to regenerate it later without) but that itself isn't a big problem and
means that ttydev is now in -next and can actually get a good testing.

Right now its all non urgent bits so that should work out

Alan
