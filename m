From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 27 Jan 2010 23:54:12 -0200
Message-ID: <4B60EE44.7080508@infradead.org>
References: <20100127175917.5d690f52.sfr@canb.auug.org.au> <1264634688.3088.1.camel@palomino.walls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:55613 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754659Ab0A1ByV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2010 20:54:21 -0500
In-Reply-To: <1264634688.3088.1.camel@palomino.walls.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Walls <awalls@radix.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Devin Heitmueller <dheitmueller@kernellabs.com>

Andy Walls wrote:
> On Wed, 2010-01-27 at 17:59 +1100, Stephen Rothwell wrote:
>> Hi Mauro,
>>
>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>
>> drivers/media/video/cx18/cx18-alsa-pcm.c: In function 'snd_pcm_alloc_vmalloc_buffer':
>> drivers/media/video/cx18/cx18-alsa-pcm.c:234: error: implicit declaration of function 'vfree'
>> drivers/media/video/cx18/cx18-alsa-pcm.c:236: error: implicit declaration of function 'vmalloc'
>>
>> Caused by commit 5e9a302853301e0a2bb6671036daac3366fd85f4 ("V4L/DVB: cx18: overhaul ALSA PCM device handling so it works").
>>
>> I applied the following patch for today.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 27 Jan 2010 17:53:39 +1100
>> Subject: [PATCH] V4L/DVB: using vmalloc requires include of linux/vmalloc.h
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Stephen,
> 
> Looks good to me.
> 
> Acked-by: Andy Walls <awalls@radix.net>

Added at the tree.

Cheers,
Mauro.
