From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Mon, 28 Nov 2011 14:08:11 +0000
Message-ID: <20111128140811.4e2983a3@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
	<20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
	<20111125103011.18e167cd@lxorguk.ukuu.org.uk>
	<CAPM=9twsvX=hFS9S01-ht8JHhAAy4uP8N5NxPUDY9UpbsvQWmw@mail.gmail.com>
	<20111128135317.a99880b234c6c060a622fa31@canb.auug.org.au>
	<20111128113056.2099e4c3@lxorguk.ukuu.org.uk>
	<20111129001353.399142710ab77822b29552f0@canb.auug.org.au>
	<20111128131847.48bffb93@lxorguk.ukuu.org.uk>
	<20111129005341.c5caf7f353876a0dd4764d3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:54076 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750921Ab1K1OGs (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 09:06:48 -0500
In-Reply-To: <20111129005341.c5caf7f353876a0dd4764d3c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@gmail.com>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

> Which I assumed was aimed at Dave.  Then Jesse (whose changes broke the
> code in staging) responded with a patch which I assumed that Dave would
> do something with.  Then the next day you responded with:

Dave did include Jesse's patch to gma500 in his DRM branch - that wasn't
complete but I assumed it was which confused me. Fixes just went to Dave. 

> > If the staging gma500 is causing this still please resolve it by marking
> > the GMA500 in staging "&& BROKEN" for the moment.
> 
> And maybe I should have done something then.  I fall back on the excuse
> that I have about 200 trees to merge every day and when I use to fix
> things for people I used to have lots of 12-16 hour days ...

Fair enough - can't argue with that.

> In the future, I will try to remember to "kill staging first", but this
> is the first time it has come up since staging started being built by an
> allmodconfig build (which it used not to be - and that change was not my
> choice)

Ok.

Alan
