From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the imx-mxs tree
Date: Tue, 25 Oct 2016 01:58:25 +0200
Message-ID: <8126928.lSNgbyj5lv@vostro.rjw.lan>
References: <20161025104729.35f5b009@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161025104729.35f5b009@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lina Iyer <lina.iyer@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: linux-next.vger.kernel.org

On Tuesday, October 25, 2016 10:47:29 AM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   arch/arm/mach-imx/gpc.c
> 
> between commits:
> 
>   eef0b282bb58 ("ARM: imx: gpc: Initialize all power domains")
>   f9d1f7a7ad91 ("ARM: imx: gpc: Fix the imx_gpc_genpd_init() error path")
> 
> from the imx-mxs tree and commit:
> 
>   59d65b73a23c ("PM / Domains: Make genpd state allocation dynamic")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen!

Lina, please have a look at the Stephen's fix and let me know if that
conflict should be resolved in a different way.

Thanks,
Rafael
