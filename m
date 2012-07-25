From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Wed, 25 Jul 2012 12:10:17 +0530
Message-ID: <500F94D1.5090703@nvidia.com>
References: <20120725111855.bd9553a735807afa0bd03821@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:7599 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911Ab2GYGvA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jul 2012 02:51:00 -0400
In-Reply-To: <20120725111855.bd9553a735807afa0bd03821@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

On Wednesday 25 July 2012 06:48 AM, Stephen Rothwell wrote:
> * PGP Signed by an unknown key
>
> Hi Samuel,
>
> Today's linux-next merge of the mfd tree got a conflict in
> arch/arm/configs/tegra_defconfig between commit dbebe1589d3a ("ARM:
> tegra: defconfig updates") from Linus' tree and commit 05f3ad2b8ae5
> ("ARM: tegra: defconfig: Enable tps6586x gpio") from the mfd tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
Yes, this fix is proper.

Thanks,
Laxman
