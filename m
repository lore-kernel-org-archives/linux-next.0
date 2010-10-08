From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Date: Fri, 08 Oct 2010 00:13:19 -0300
Message-ID: <4CAE8C4F.2060609@infradead.org>
References: <20101008114945.636093c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41633 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab0JHDN0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2010 23:13:26 -0400
In-Reply-To: <20101008114945.636093c9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em 07-10-2010 21:49, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> After merging the kvm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/media/video/videobuf-dma-sg.c: In function 'videobuf_pages_to_sg':
> drivers/media/video/videobuf-dma-sg.c:119: warning: comparison of distinct pointer types lacks a cast
> drivers/media/video/videobuf-dma-sg.c:120: warning: comparison of distinct pointer types lacks a cast
> 
> Commit ecc736735ecf922d7f31d34417f7c42f8ec9eb67 ("V4L/DVB:
> videobuf-dma-sg: Fix a warning due to the usage of min(PAGE_SIZE, arg)")
> tried to fix it (presumably on a 32 bit build), but is not correct for 64
> bits .
> 
Hi Stephen,

Thanks. I have already a fix for it, using min_t(size_t, PAGE_SIZE, arg).
I'll add it probably tomorrow for the linux-next tree.

Thanks,
Mauro
