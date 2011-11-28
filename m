From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Mon, 28 Nov 2011 13:18:47 +0000
Message-ID: <20111128131847.48bffb93@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
	<20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
	<20111125103011.18e167cd@lxorguk.ukuu.org.uk>
	<CAPM=9twsvX=hFS9S01-ht8JHhAAy4uP8N5NxPUDY9UpbsvQWmw@mail.gmail.com>
	<20111128135317.a99880b234c6c060a622fa31@canb.auug.org.au>
	<20111128113056.2099e4c3@lxorguk.ukuu.org.uk>
	<20111129001353.399142710ab77822b29552f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53799 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751013Ab1K1NRX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 08:17:23 -0500
In-Reply-To: <20111129001353.399142710ab77822b29552f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@gmail.com>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

> > Well its very hard to sort stuff out when you are juggling a cross tree
> > set of dependancies and someone pointlessly stops one of them being
> > visible in next for ten days.
> 
> The mess in the drm tree has nothing to do with the staging tree. 

I would suggest you re-read the paragraph above, and the mails I sent you
about marking the staging gma500 tree broken (which given nothing
happened in response to any of them I imagine you didn't).

And if you still think that blocking the DRM tree from -next for ten days
thus stopping all sorts of other integration work and forcing people's
hands on moving from staging and the like didn't cause the problems and
is the right policy then we'll just have to agree to differ.

Alan
