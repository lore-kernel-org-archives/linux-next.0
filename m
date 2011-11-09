From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: incorrect build fix
Date: Wed, 09 Nov 2011 15:11:50 +0900
Message-ID: <003401cc9ea6$785e7dc0$691b7940$%kim@samsung.com>
References: <20111109082624.ea5697763c50ef9128244783@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23175 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202Ab1KIGLw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2011 01:11:52 -0500
In-reply-to: 
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: linux-next@vger.kernel.org, 'LKML' <linux-kernel@vger.kernel.org>

Kukjin Kim wrote:
> 
> Stephen Rothwell wrote:
> >
> > Hi,
> >
> Hi Stephen,
> 
> > I noticed in commit 8644c202ff42 ("ARM: EXYNOS: Fix compiler error with
> > THIS_MODULE") in the s5p tree, an include of linux/module.h is used to
> > get THIS_MODULE. For THIS_MODULE, you only need to include
> > linux/export.h, now.  To fix the other errors that were fixed by side
> > effects of including module.h, you should include linux/time.h (for
> > struct timeval, USEC_PER_SEC and do_gettimeofday).
> >
> OK, I will fix it in my tree.
> 
> > Please try a bit harder to get these things right.
> 
Stephen,

I'm not sure following......
So only for THIS_MODULE, <linux/export.h> should be added instead of
<linux/module.h>?

> Thanks for your pointing out :)
> 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
