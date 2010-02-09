From: Michal Simek <michal.simek@petalogix.com>
Subject: Re: linux-next: manual merge of the microblaze tree with Linus' tree
Date: Tue, 09 Feb 2010 09:18:39 +0100
Message-ID: <4B711A5F.7020304@petalogix.com>
References: <20100209110710.c7b6992b.sfr@canb.auug.org.au>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f220.google.com ([209.85.220.220]:55898 "EHLO
	mail-fx0-f220.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241Ab0BIIVJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2010 03:21:09 -0500
In-Reply-To: <20100209110710.c7b6992b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Michal,
> 
> Today's linux-next merge of the microblaze tree got a conflict in
> arch/microblaze/kernel/setup.c between commit
> a6013411118a6c8c34f1bd8b047b36fdf9711590 ("microblaze: Invalidate dcache
> before enabling it") from Linus' tree and commit
> 578059c56c816db2b696a196d3656afc187c7edd ("microblaze: Move cache
> function to cache.c") from the microblaze tree.
> 
> The microblaze tree version supercedes the version from Linus' tree, so I
> used that.

Yes, I know about. I am fixing it.

Thanks,
Michal




-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
