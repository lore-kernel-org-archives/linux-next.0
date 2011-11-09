From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: incorrect build fix
Date: Wed, 09 Nov 2011 14:08:35 +0900
Message-ID: <001e01cc9e9d$a26dca20$e7495e60$%kim@samsung.com>
References: <20111109082624.ea5697763c50ef9128244783@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28404 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754Ab1KIFIh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2011 00:08:37 -0500
In-reply-to: <20111109082624.ea5697763c50ef9128244783@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: linux-next@vger.kernel.org, 'LKML' <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> 
> Hi,
> 
Hi Stephen,

> I noticed in commit 8644c202ff42 ("ARM: EXYNOS: Fix compiler error with
> THIS_MODULE") in the s5p tree, an include of linux/module.h is used to
> get THIS_MODULE. For THIS_MODULE, you only need to include
> linux/export.h, now.  To fix the other errors that were fixed by side
> effects of including module.h, you should include linux/time.h (for
> struct timeval, USEC_PER_SEC and do_gettimeofday).
> 
OK, I will fix it in my tree.

> Please try a bit harder to get these things right.

Thanks for your pointing out :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
