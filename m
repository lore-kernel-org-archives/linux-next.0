From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the arm-current tree with Linus' tree
Date: Fri, 13 Jan 2012 09:59:49 +0900
Message-ID: <033201ccd18e$a6bd5950$f4380bf0$%kim@samsung.com>
References: <20120113114951.7b7f131514437454e5682aa8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56006 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756426Ab2AMBAB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2012 20:00:01 -0500
In-reply-to: <20120113114951.7b7f131514437454e5682aa8@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Russell King' <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>

Stephen Rothwell wrote:
> 
> Hi Russell,
> 
> Today's linux-next merge of the arm-current tree got a conflict in
> arch/arm/mach-exynos/common.c between (I think) commit 237c78beb8a9
> ("Merge branch 'depends/rmk/for-linus' into samsung/dt") from Linus' tree
> and commit 588ac27d3419 ("ARM: 7273/1: EXYNOS: Fix build error which was
> from common.c and old cpu.c") from the arm-current tree.
> 
> So this arm-current fi is superceded by the merge above that is now in
> Linus' tree.
> 
Oh, right. Now we don't need the commit 588ac27d3419.

Russell, could you please remove it in your tree?

> I fixed it up by ignoring the arm-current version.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
