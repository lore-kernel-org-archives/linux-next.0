From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Tue, 1 Jul 2008 16:36:09 +0100
Message-ID: <20080701163609.4cd791c6@lxorguk.ukuu.org.uk>
References: <20080702001740.9bbea0df.sfr@canb.auug.org.au>
	<20080701152302.07cdba1e@lxorguk.ukuu.org.uk>
	<20080702005134.d07261ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:44682 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751784AbYGAPxo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 11:53:44 -0400
In-Reply-To: <20080702005134.d07261ad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

> One downsides of the way linux-next works is that, because it is
> recreated every day, you cannot really base anything on it that is to be
> merged into it.
> 
> I really need to think about this when I am awake :-(

As its a patch series not  git tree I don't think this is actually the
problem it would be with git.

Producing a 'fits on top of firmware' merge doesn't mean losing anything
as its just another patch set (and at the very least its a reference for
you to do the exact same merge work yourself if you have both). It might
for the moment anchor the tty dev work to follow the firmware work but I
can live with that for now.

Alan
