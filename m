From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the imx-mxs tree
Date: Tue, 25 Oct 2016 10:47:29 +1100
Message-ID: <20161025104729.35f5b009@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57451 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754656AbcJXXrc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Oct 2016 19:47:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, Lina Iyer <lina.iyer@linaro.org>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  arch/arm/mach-imx/gpc.c

between commits:

  eef0b282bb58 ("ARM: imx: gpc: Initialize all power domains")
  f9d1f7a7ad91 ("ARM: imx: gpc: Fix the imx_gpc_genpd_init() error path")

from the imx-mxs tree and commit:

  59d65b73a23c ("PM / Domains: Make genpd state allocation dynamic")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-imx/gpc.c
index b54db47f6f32,57a410bbb6a2..000000000000
--- a/arch/arm/mach-imx/gpc.c
+++ b/arch/arm/mach-imx/gpc.c
@@@ -430,18 -423,20 +423,28 @@@ static int imx_gpc_genpd_init(struct de
  	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
  		return 0;
  
+ 	imx6q_pu_domain.base.states = devm_kzalloc(dev,
+ 					sizeof(*imx6q_pu_domain.base.states),
+ 					GFP_KERNEL);
+ 	if (!imx6q_pu_domain.base.states)
+ 		return -ENOMEM;
+ 
+ 	imx6q_pu_domain.base.states[0].power_off_latency_ns = 25000;
+ 	imx6q_pu_domain.base.states[0].power_on_latency_ns = 2000000;
+ 	imx6q_pu_domain.base.state_count = 1;
+ 
 -	pm_genpd_init(&imx6q_pu_domain.base, NULL, false);
 -	return of_genpd_add_provider_onecell(dev->of_node,
 +	for (i = 0; i < ARRAY_SIZE(imx_gpc_domains); i++)
 +		pm_genpd_init(imx_gpc_domains[i], NULL, false);
 +
 +	ret =  of_genpd_add_provider_onecell(dev->of_node,
  					     &imx_gpc_onecell_data);
 +	if (ret)
 +		goto power_off;
 +
 +	return 0;
  
 +power_off:
 +	imx6q_pm_pu_power_off(&imx6q_pu_domain.base);
  clk_err:
  	while (i--)
  		clk_put(imx6q_pu_domain.clk[i]);
