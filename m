From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the regmap
 tree
Date: Thu, 10 May 2012 10:12:30 +0530
Message-ID: <4FAB4736.8070301@nvidia.com>
References: <20120510142552.35f8e15042053707a2086905@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:2273 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083Ab2EJEqK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 May 2012 00:46:10 -0400
In-Reply-To: <20120510142552.35f8e15042053707a2086905@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

On Thursday 10 May 2012 09:55 AM, Stephen Rothwell wrote:
> * PGP Signed by an unknown key
>
> Hi all,
>
> Today's linux-next merge of the sound-asoc tree got a conflict in
> drivers/base/regmap/regmap.c between commit 6560ffd1ccd6 ("regmap: fix
> possible memory corruption in regmap_bulk_read()") from the regmap tree
> and commit edc9ae420f98 ("regmap: implement register striding") from the
> sound-asoc tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
The change looks fine to me.
