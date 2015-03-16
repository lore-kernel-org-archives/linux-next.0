From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the irqchip tree with the tegra tree
Date: Mon, 16 Mar 2015 08:47:52 +0000
Message-ID: <550698B8.80108@arm.com>
References: <20150316145508.62cad7d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55801 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752998AbbCPIr4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 04:47:56 -0400
In-Reply-To: <20150316145508.62cad7d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bob Mottram <bob.mottram@codethink.co.uk>

On 16/03/15 03:55, Stephen Rothwell wrote:
> Hi Jason,
> 
> Today's linux-next merge of the irqchip tree got a conflict in
> arch/arm/mach-tegra/irq.c between commit 0a63e1e0617f ("ARM: tegra: Fix
> big-endian issue with IRQ code") from the tegra tree and commit
> 1a703bffd82e ("ARM: tegra: remove old LIC support") from the irqchip
> tree.
> 
> I fixed it up (the latter removed the code changed by the former) and
> can carry the fix as necessary (no action is required).

That looks good.

Thanks Stephen.

	M.
-- 
Jazz is not dead. It just smells funny...
