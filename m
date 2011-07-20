From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the s5p tree with the arm tree
Date: Wed, 20 Jul 2011 19:38:55 +0900
Message-ID: <064301cc46c9$622cdd60$26869820$%kim@samsung.com>
References: <20110720113558.1fb8c2f8392f52c77becf46a@canb.auug.org.au>
 <20110720080441.GA28730@flint.arm.linux.org.uk>
 <20110720182540.c53726975c8a0b3a48d609b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51195 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244Ab1GTKkF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2011 06:40:05 -0400
In-reply-to: <20110720182540.c53726975c8a0b3a48d609b1@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Russell King' <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>

Stephen Rothwell wrote:
> 
> Hi Russell,
> 
Hi Russell and Stephen,

> On Wed, 20 Jul 2011 09:04:41 +0100 Russell King <rmk@arm.linux.org.uk>
wrote:
> >
> > On Wed, Jul 20, 2011 at 11:35:58AM +1000, Stephen Rothwell wrote:
> > > BTW, Russell, commit 29cb3cd208dd above changed the return type of
> > > exynos4_cpu_suspend() from void to int but did not add any return
> > > statement ...
> >
> > That's fine - it ends with a call to panic() which is declared as a
> > function which never returns.  Therefore, exynos4_cpu_suspend() itself
> > never returns.
> 
> Ah, yes.  Unfortunately, the s5p tree changes removed the panic.  So, I
> guess the merge needs some other fixup.
> 
Oops, yes. I fixed it and thanks a lot for pointing out.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
