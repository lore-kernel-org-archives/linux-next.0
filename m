From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] kernel: irq: fix build failure
Date: Fri, 21 Oct 2016 10:07:41 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1610211006370.4797@nanos>
References: <1475775403-27207-1-git-send-email-sudipm.mukherjee@gmail.com> <57FBBA0B.9070500@gmail.com> <alpine.DEB.2.20.1610201454410.5073@nanos> <20161021120020.52b3fa35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:50853 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbcJUIKa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Oct 2016 04:10:30 -0400
In-Reply-To: <20161021120020.52b3fa35@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Fri, 21 Oct 2016, Stephen Rothwell wrote:
> On Thu, 20 Oct 2016 14:55:45 +0200 (CEST) Thomas Gleixner <tglx@linutronix.de> wrote:
> > I know. This is under discussion with the driver folks as we are not going
> > to blindly export stuff just because someone slapped a irq_set_parent()
> > into the code w/o knowing why.
> 
> Do we have any idea if a resolution is close.  This was first reported
> in linux-next in September 14/15.  :-(

Grr. Yes. As much as I hate it, I'll go and export it for now. Should be
able to get it into rc2.

Thanks,

	tglx
