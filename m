From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 17:27:59 +0100
Message-ID: <20080701172759.19ca15af@lxorguk.ukuu.org.uk>
References: <20080701211003.8ecd7d3b.sfr@canb.auug.org.au>
	<20080701125631.3deab583@lxorguk.ukuu.org.uk>
	<200807010918.09669.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:47587 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750874AbYGAQpg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 12:45:36 -0400
In-Reply-To: <200807010918.09669.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>


> A quick search doesn't turn up a ttydev tree, or that patch.
> 
> Is that the right long-term fix, so I can consider this resolved?

Consider it resolved - it changed the type of the unneccesary break_ctl
method from void to int. You now don't have one - end of problem 8)
