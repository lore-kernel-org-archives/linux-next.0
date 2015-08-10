From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with the regulator tree
Date: Mon, 10 Aug 2015 13:07:11 +0900
Message-ID: <CAJKOXPcxoiOAMrrsmO5FR8Y+ZpeCfUfp7P4bMWBrWCVWKn8E7g@mail.gmail.com>
References: <20150810123729.58c74531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:35057 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750698AbbHJEHM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2015 00:07:12 -0400
In-Reply-To: <20150810123729.58c74531@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2015-08-10 11:37 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Jiri,
>
> Today's linux-next merge of the trivial tree got a conflict in:
>
>   drivers/regulator/max77843.c
>
> between commit:
>
>   2a32b401a11f ("regulator: Remove the max77843 driver")
>
> from the regulator tree and commit:
>
>   971bd8fa369a ("treewide: Fix typo in printk")
>
> from the trivial tree.
>
> I fixed it up (the former removed the file, so I did that) and can carry
> the fix as necessary (no action is required).

Thanks, that's the proper resolution.

Best regards,
Krzysztof
