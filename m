From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the s5p tree with the arm tree
Date: Mon, 18 Oct 2010 09:57:25 +0900
Message-ID: <03f901cb6e5f$6ff5f690$4fe1e3b0$%kim@samsung.com>
References: <20101018105046.368420c2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20036 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752663Ab0JRA5X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Oct 2010 20:57:23 -0400
In-reply-to: <20101018105046.368420c2.sfr@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jeremy Kerr' <jeremy.kerr@canonical.com>, 'Lorenzo Pieralisi' <lorenzo.pieralisi@arm.com>, 'Jason Wang' <jason77.wang@gmail.com>, 'Tony Lindgren' <tony@atomide.com>, 'Russell King' <rmk@arm.linux.org.uk>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi Stephen :-)

> Today's linux-next merge of the s5p tree got a conflict in
> arch/arm/mach-s5p6440/include/mach/debug-macro.S between commit
> 08a610d9ef5394525b0328da0162d7b58c982cc4 ("arm: return both physical and
> virtual addresses from addruart") from the arm tree and commit
> 29159b7dd244def6e0073ff0e2d4cbb59599187f ("ARM: S5P64X0: Add S5P64X0
> (S5P6440 and S5P6450) initialization support") from the s5p tree.
> 
Hmm...ok...

> The latter removed the file modified by the former.  I did that.
> 
Ok.

> The appropriate part of the above arm commit needs to be done for the new
> file arch/arm/mach-s5p64x0/include/mach/debug-macro.S .  Unfortunately, I
> am unqualified to do that ...

I see...so may I do only fix
arch/arm/mach-s5p64x0/include/mach/debug-macro.S in my tree?
Or...need to fix other things?

Anyway, thanks for your linux-next ;-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
