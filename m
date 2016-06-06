From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the amlogic tree
Date: Mon, 6 Jun 2016 14:02:31 +1000
Message-ID: <20160606140231.394f5db7@canb.auug.org.au>
References: <20160606095559.67cf4f00@canb.auug.org.au>
	<CAOi56cVQPutG1ZBw16=HWBAVdbV+i2VL4vDRdc_23qVT+MEL+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56903 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750743AbcFFECe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2016 00:02:34 -0400
In-Reply-To: <CAOi56cVQPutG1ZBw16=HWBAVdbV+i2VL4vDRdc_23qVT+MEL+A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Kevin,

On Sun, 5 Jun 2016 20:40:28 -0700 Kevin Hilman <khilman@baylibre.com> wrote:
>
> Not forgotten, but merged through Philip's reset tree, which I thought
> was already in linux-next.  Sorry about that.

It may well be, but we dislike implicit dependencies between trees ...
it makes the merge order matter :-(  What you should have is a common
non-rebasing branch that both trees merge.

It also means that your for-next branch, on its own, will get this
build failure as well ...

-- 
Cheers,
Stephen Rothwell
