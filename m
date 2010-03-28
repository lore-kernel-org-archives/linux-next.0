From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: manual merge of the libata tree with Linus' tree
Date: Sun, 28 Mar 2010 00:45:57 -0400
Message-ID: <4BAEDF05.9070006@garzik.org>
References: <20100322124422.4a10bc4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f191.google.com ([209.85.210.191]:65040 "EHLO
	mail-yx0-f191.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751775Ab0C1EqE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Mar 2010 00:46:04 -0400
In-Reply-To: <20100322124422.4a10bc4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shane Huang <shane.huang@amd.com>, Anton Vorontsov <avorontsov@ru.mvista.com>

On 03/21/2010 09:44 PM, Stephen Rothwell wrote:
> Hi Jeff,
>
> Today's linux-next merge of the libata tree got a conflict in
> drivers/ata/ahci.c between commit
> 5db5b0215af94a36d4bf10900ff9707b6d5c1610 ("ahci: pp->active_link is not
> reliable when FBS is enabled") from Linus' tree and commit
> efd7cb719e07433588ee5c6a99b1208b0aff6295 ("ahci: Move generic code into
> libahci") from the libata tree.
>
> I applied the changes to drivers/ata/ahci.c from the former commit to
> drivers/ata/libahci.c (where the latter commit moves it).

Should be fixed now...
