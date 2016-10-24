From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] kernel: irq: fix build failure
Date: Mon, 24 Oct 2016 11:22:15 +0100
Message-ID: <20161024102215.GN14477@dell>
References: <1475775403-27207-1-git-send-email-sudipm.mukherjee@gmail.com>
 <57FBBA0B.9070500@gmail.com>
 <alpine.DEB.2.20.1610201454410.5073@nanos>
 <20161021120020.52b3fa35@canb.auug.org.au>
 <alpine.DEB.2.20.1610211006370.4797@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36417 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753620AbcJXKTs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2016 06:19:48 -0400
Received: by mail-lf0-f49.google.com with SMTP id b75so190151920lfg.3
        for <linux-next@vger.kernel.org>; Mon, 24 Oct 2016 03:19:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1610211006370.4797@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Fri, 21 Oct 2016, Thomas Gleixner wrote:

> On Fri, 21 Oct 2016, Stephen Rothwell wrote:
> > On Thu, 20 Oct 2016 14:55:45 +0200 (CEST) Thomas Gleixner <tglx@linutronix.de> wrote:
> > > I know. This is under discussion with the driver folks as we are not going
> > > to blindly export stuff just because someone slapped a irq_set_parent()
> > > into the code w/o knowing why.
> > 
> > Do we have any idea if a resolution is close.  This was first reported
> > in linux-next in September 14/15.  :-(
> 
> Grr. Yes. As much as I hate it, I'll go and export it for now. Should be
> able to get it into rc2.

Did this get in?  I still have people complaining about it.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
