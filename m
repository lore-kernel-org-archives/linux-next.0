From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next:  tree build failure
Date: Mon, 23 Mar 2009 19:27:09 -0300
Message-ID: <20090323192709.3b3eb070@pedra.chehab.org>
References: <20090323203810.14776298.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:46776 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756692AbZCWW1I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2009 18:27:08 -0400
In-Reply-To: <20090323203810.14776298.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Mon, 23 Mar 2009 20:38:10 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/media/video/ov7670.c: In function 'ov7670_write':
> drivers/media/video/ov7670.c:433: error: implicit declaration of function 'msleep'
> 
> Caused by commit c69a6f8d071763141e774893c71e09ded722f05d ("V4L/DVB
> (11113): ov7670: convert to v4l2_subdev") which removed the include of
> linux/delay.h ...
> 
> I have reverted that commit (and the two dependent commits
> b7db06380e43161560a0eb2cc5fe891c23994b35 ("V4L/DVB (11116): ov7670:
> cleanup and remove legacy code") and
> 2134b61009c102142e5140ab156d1cd99e0f6362 ("V4L/DVB (11117): ov7670: add
> support to get/set registers")) for today.
> 
Thanks. I just fold the fix at c69a6f8d071763 to avoid bisect troubles.

Cheers,
Mauro
