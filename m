From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: powerpc tree build warning
Date: Thu, 11 Jun 2009 13:14:04 +1000
Message-ID: <1244690044.5739.31.camel@pasglop>
References: <20090611113930.78a42893.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:40094 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753018AbZFKDRL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 23:17:11 -0400
In-Reply-To: <20090611113930.78a42893.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

On Thu, 2009-06-11 at 11:39 +1000, Stephen Rothwell wrote:
> Hi Ben,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> arch/powerpc/platforms/Kconfig.cputype:60:warning: defaults for choice values not supported
> 
> We appear to have CONFIG_PPC_BOOK3S int two places which is confusing
> Kconfig.

Yes, I see that. One place depends on PPC32 and the other one PPC64, but
it still seems to be somewhat confused. In any case, it seems to still
do the right thing, so not a big hurry here, but I'll do a patch that
does it differently.

Cheers,
Ben.
