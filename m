From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the s5p tree with Linus' tree
Date: Tue, 24 Jan 2012 21:27:17 +0900
Message-ID: <02e501ccda93$82af3570$880da050$%kim@samsung.com>
References: <20120124132123.6957dd9c43aa692fa12e9c81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43386 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753293Ab2AXM1V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2012 07:27:21 -0500
In-reply-to: <20120124132123.6957dd9c43aa692fa12e9c81@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi Stephen,

> Today's linux-next merge of the s5p tree got a conflict in
> arch/arm/mach-exynos/cpu.c between commit cc511b8d84d8 ("ARM: 7257/1:
> EXYNOS: introduce arch/arm/mach-exynos/common.[ch]") from Linus' tree and
> commit 566fcbb817fb ("ARM: EXYNOS: Add DMC1 and allow PPMU access for
> DMC") from the s5p tree.
> 
> The former removes this file, so the latter patch now needs to be applied
> to arch/arm/mach-exynos/common.c (I think).
> 
Yes, right. Let me fix it. Thanks.

> Maybe the s5p tree should be rebased onto v3.3-rc1 (or merged with it)
> since there are other conflicts as well due to duplicated patches (same
> patch different commit).

Yes, let me rebase my tree onto v3.3-rc1 and then will merge other branches for v3.4 ;)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
