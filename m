From: Ryan Mallon <rmallon@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with the slave-dma
 tree
Date: Fri, 17 Jun 2011 12:56:02 +1000
Message-ID: <4DFAC242.9090204@gmail.com>
References: <20110617125419.c196ca92.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57167 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab1FQC4I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jun 2011 22:56:08 -0400
In-Reply-To: <20110617125419.c196ca92.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@iki.fi>, Vinod Koul <vinod.koul@intel.com>

On 17/06/11 12:54, Stephen Rothwell wrote:
> Hi Jiri,
>
> Today's linux-next merge of the trivial tree got a conflict in
> arch/arm/mach-ep93xx/dma-m2p.c between commit 8e4a93008db7 ("ep93xx:
> remove the old M2P DMA code") from the slave-dma tree and commit
> 1c5454eed85a ("Change Ryan Mallon's email address across the kernel")
> from the trivial tree.
>
> The former removed the file, so I did that.

That is correct. Mika has added my new email address to the new ep93xx 
dma files.

Thanks,
~Ryan
