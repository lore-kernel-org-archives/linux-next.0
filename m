From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the iommu tree
Date: Tue, 4 Dec 2012 12:06:56 +0100
Message-ID: <20121204110655.GE18368@8bytes.org>
References: <20121204154203.f0e7e87d1ae99e5c528434f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([85.214.48.195]:47749 "EHLO mail.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497Ab2LDLHA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Dec 2012 06:07:00 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.8bytes.org (Postfix) with SMTP id 5B25412B052
	for <linux-next@vger.kernel.org>; Tue,  4 Dec 2012 12:06:58 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <20121204154203.f0e7e87d1ae99e5c528434f8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Omar Ramirez Luna <omar.luna@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Paul Walmsley <paul@pwsan.com>, Mike Turquette <mturquette@ti.com>

On Tue, Dec 04, 2012 at 03:42:03PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-omap2/clock44xx_data.c between commit 298ea44f211d ("ARM:
> OMAP4: hwmod data: ipu and dsp to use parent clocks instead of leaf
> clocks") from the iommu tree and commit 13a5b6228679 ("ARM: OMAP44xx:
> clock: drop obsolete clock data") from the arm-soc tree.
> 
> I just deleted the file as the latter did and can carry the fix as
> necessary (no action is required).

Ohad, Omar, any comment on this?


	Joerg
