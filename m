From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Mon, 28 Nov 2011 11:30:56 +0000
Message-ID: <20111128113056.2099e4c3@lxorguk.ukuu.org.uk>
References: <20111116113007.5656a7b4823ba085a46c57ae@canb.auug.org.au>
	<20111125124913.405fc8360a185f3116adb5ec@canb.auug.org.au>
	<20111125103011.18e167cd@lxorguk.ukuu.org.uk>
	<CAPM=9twsvX=hFS9S01-ht8JHhAAy4uP8N5NxPUDY9UpbsvQWmw@mail.gmail.com>
	<20111128135317.a99880b234c6c060a622fa31@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53235 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752213Ab1K1L3h (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 06:29:37 -0500
In-Reply-To: <20111128135317.a99880b234c6c060a622fa31@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@gmail.com>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

On Mon, 28 Nov 2011 13:53:17 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Dave,
> 
> On Fri, 25 Nov 2011 10:34:19 +0000 Dave Airlie <airlied@gmail.com> wrote:
> >
> > I just pushed jbarnes patch into my tree for now, at pushed out the
> > mainline gma500 code with it.
> 
> And it is a mess (see my linux-next reports).

Well its very hard to sort stuff out when you are juggling a cross tree
set of dependancies and someone pointlessly stops one of them being
visible in next for ten days.

Whatever. I'm onto it, but I think blocking -next merges for staging
breakage is broken to the point that -next needs fixing, or we should
kill staging off.

Alan
