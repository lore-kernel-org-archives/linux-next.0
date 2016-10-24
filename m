From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: manual merge of the pm tree with the imx-mxs tree
Date: Tue, 25 Oct 2016 07:55:58 +0800
Message-ID: <20161024235558.GN30578@tiger>
References: <20161025104729.35f5b009@canb.auug.org.au>
 <8126928.lSNgbyj5lv@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754880AbcJXX4W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Oct 2016 19:56:22 -0400
Content-Disposition: inline
In-Reply-To: <8126928.lSNgbyj5lv@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lina Iyer <lina.iyer@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

On Tue, Oct 25, 2016 at 01:58:25AM +0200, Rafael J. Wysocki wrote:
> On Tuesday, October 25, 2016 10:47:29 AM Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > Today's linux-next merge of the pm tree got a conflict in:
> > 
> >   arch/arm/mach-imx/gpc.c
> > 
> > between commits:
> > 
> >   eef0b282bb58 ("ARM: imx: gpc: Initialize all power domains")
> >   f9d1f7a7ad91 ("ARM: imx: gpc: Fix the imx_gpc_genpd_init() error path")
> > 
> > from the imx-mxs tree and commit:
> > 
> >   59d65b73a23c ("PM / Domains: Make genpd state allocation dynamic")
> > 
> > from the pm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Thanks Stephen!
> 
> Lina, please have a look at the Stephen's fix and let me know if that
> conflict should be resolved in a different way.

FYI. We target the following two fixes 4.9-rc.

eef0b282bb58 ("ARM: imx: gpc: Initialize all power domains")
f9d1f7a7ad91 ("ARM: imx: gpc: Fix the imx_gpc_genpd_init() error path")

Shawn
