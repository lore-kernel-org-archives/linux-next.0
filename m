From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: linux-next: manual merge of the davinci tree with the arm tree
Date: Fri, 29 Jan 2010 15:33:29 -0800
Message-ID: <87iqakpjue.fsf@deeprootsystems.com>
References: <20100129111342.203358d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f190.google.com ([209.85.222.190]:40939 "EHLO
	mail-pz0-f190.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932169Ab0A2Xdd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2010 18:33:33 -0500
In-Reply-To: <20100129111342.203358d9.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Fri\, 29 Jan 2010 11\:13\:42 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Kevin,
>
> Today's linux-next merge of the davinci tree got a conflict in
> arch/arm/mach-bcmring/core.c between commit
> dd84ce18c8f522d26aef6e9e9c05c32485b667a7 ("ARM: Consolidate
> clks_register() and similar") from the arm tree and commit
> 25c692215f5dfc4992b11c4fb57538d1139d6636 ("Consolidate clks_register()
> and similar") from the davinci tree.
>
> The davinci tree version has a typo (ARRAY_SIEZ v. ARRAY_SIZE) so I used
> the arm tree version.

OK, I'll drop the one from the davinci tree.

Thanks,

Kevin
