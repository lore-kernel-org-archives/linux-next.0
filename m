From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the akpm tree with the v4l-dvb tree
Date: Wed, 09 Nov 2011 07:38:07 -0200
Message-ID: <4EBA49FF.4090904@infradead.org>
References: <20111109135353.69057bcd2463a6ea009b898e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:55695 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704Ab1KIJiT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2011 04:38:19 -0500
In-Reply-To: <20111109135353.69057bcd2463a6ea009b898e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em 09-11-2011 00:53, Stephen Rothwell escreveu:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict between commit
> "poll: add poll_requested_events() function" the v4l-dvb and akpm trees.
> It was very similar (but not identical), so I dropeed it from the akpm
> tree.

Hans,

Could you please double-check the differences?

> BTW Mauro, that commit in v4l-dvb comes from a branch that contains a
> series of patches that have various Signed-off-by's but not yours ... it
> looks like they were imported from patchwork, but you forgot to add your
> SOB line.

Stephen,

Thanks for noticing it. Yes, I forgot to add my SOB on those patches, when
importing from Hans tree. I'll fix it for tomorrow's merge.

Thanks!
Mauro
