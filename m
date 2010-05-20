From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Wed, 19 May 2010 22:51:50 -0300
Message-ID: <4BF495B6.6030804@infradead.org>
References: <20100520114543.898f02c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:43675 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495Ab0ETBv4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2010 21:51:56 -0400
In-Reply-To: <20100520114543.898f02c7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/input/evdev.c: In function 'evdev_do_ioctl':
> drivers/input/evdev.c:596: error: duplicate case value
> drivers/input/evdev.c:574: error: previously used here
> 
> Caused by commit ff2956560d97ccdd2c54cb9d0fdd7eb78c113ba9 ("V4L/DVB:
> input: Add support for EVIO[CS]GKEYCODEBIG").
> 
> Please build test.
> 
> I have used the v4l-dvb tree from next-20100519 for today.

Yeah, I noticed that. It was due to a bad merge conflict I did. As there's
a bug at the new big getkeycode, I've removed those input changes from
linux-next for a while, since I wanted to send upstream the patches
that I currently have. I've already pushed the new version.

I'll probably add later the input patches, if I can fix the bug today.

-- 

Cheers,
Mauro
