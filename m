From: David Jander <david.jander@protonic.nl>
Subject: Re: linux-next: manual merge of the mfd tree with the i.MX tree
Date: Tue, 1 Mar 2011 09:35:28 +0100
Message-ID: <20110301093528.00184f93@archvile>
References: <20110301145436.b1ae1923.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from protonic.xs4all.nl ([213.84.116.84]:11736 "EHLO protonic.prtnl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755643Ab1CAJC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2011 04:02:27 -0500
In-Reply-To: <20110301145436.b1ae1923.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andres Salomon <dilinger@queued.net>, David Jander <david@protonic.nl>, Sascha Hauer <s.hauer@pengutronix.de>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>


Hi Stephen,

On Tue, 1 Mar 2011 14:54:36 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the mfd tree got a conflict in
> arch/arm/mach-imx/mach-mx27_3ds.c arch/arm/mach-imx/mach-pcm038.c
> arch/arm/mach-mx3/mach-mx31_3ds.c arch/arm/mach-mx3/mach-mx31moboard.c
> between commit 5836372e8a0ba5cc633f61bc0484ee20c86f4b36 ("ARM: imx+mx3:
> convert to mc13xxx MFD") from the i.MX tree and commit
> e84e545d47d26644275a79fe5ebc1797bcb80910 ("mfd: mfd_cell is now
> implicitly available to mc13xxx drivers") from the mfd tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Your fix seems correct, although I fear I am too dumb to understand why commit
e84e545d47d26644275a79fe5ebc1797bcb80910 introduces this extra struct
nesting.... AFAICS gcc will end up doing the same as without the extra nest.

Btw, include/linux/mfd/mc13783.h should end up disappearing after you're done
merging... I hope so.

Best regards,

-- 
David Jander
Protonic Holland.
