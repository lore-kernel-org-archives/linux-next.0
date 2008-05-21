From: Hans-Joachim Picht <hans@linux.vnet.ibm.com>
Subject: Re: [PATCH] fix I/O memory related compile caused by wrong Kconfig
	dependencies
Date: Wed, 21 May 2008 23:30:56 +0200
Message-ID: <20080521213056.GA22707@blc4eb509856389.ibm.com>
References: <20080521160523.GA1351@blc4eb509856389.ibm.com> <s5hve17vd9y.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.de.ibm.com ([195.212.29.151]:46196 "EHLO
	mtagate2.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755364AbYEUVb0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 17:31:26 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id m4LLVP5D124986
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 21:31:25 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id m4LLVPm32117846
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 23:31:25 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m4LLVOBA025654
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 23:31:25 +0200
Content-Disposition: inline
In-Reply-To: <s5hve17vd9y.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org

On Wed, May 21, 2008 at 06:21:29PM +0200, Takashi Iwai wrote:
> At Wed, 21 May 2008 18:05:23 +0200, Hans-Joachim Picht wrote:
> > 
> > On s390 linux-next fails with the following build error:
> > 
> > sound/core/memory.c: In function 'copy_to_user_fromio':
> > sound/core/memory.c:47: error: implicit declaration of function 'memcpy_fromio'
> > sound/core/memory.c: In function 'copy_from_user_toio':
> > sound/core/memory.c:82: error: implicit declaration of function 'memcpy_toio'

[...]

> Thanks.  I prefer "depends on" in menuconfig SOUND so that we need no
> extra if-endif block.  I added the patch below to sound-2.6 tree.
> Does it work for you?

Yes, it work for me.

        --Hans
