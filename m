From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Mon, 01 Dec 2008 17:32:51 +0000
Message-ID: <1228152771.25929.109.camel@pc1117.cambridge.arm.com>
References: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:46412 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752240AbYLARdF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 12:33:05 -0500
In-Reply-To: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Kay Sievers <kay.sievers@vrfy.org>, David Woodhouse <dwmw2@infradead.org>

On Mon, 2008-12-01 at 11:15 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mtd/maps/integrator-flash.c between commit
> ffc86cf850dcd0e181a69c6fa0217d6c7ddf9c85 ("Add armflash support for
> multiple blocks of flash") from the arm tree and commit
> 0b1ea7e6450b3cc2e87d1c7295439483d007bb6e ("mtd: struct device - replace
> bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> 
> I fixed it up (see below).  

I'll send a separate patch on linux-mtd to make the third argument of
mtd_concat_create a "const char *" to avoid a warning (dev_name returns
const char *).

> Maybe you, Russell and David Woodhouse could
> sort out who should coordinate these updates.

I dropped the patch from my series and I suspect Russell will re-merge
my tree (there shouldn't be other conflicts via the arm tree).

Now the question, where should I send the changes to integrator-flash.c
to? I assume it's linux-mtd with ack from Russell.

Anyway, no matter who'll merge it, as long as it is based on the
mainline kernel it will create a conflict in linux-next. Is the rule
that there shouldn't be any conflicts in linux-next at this stage? The
alternative is to get it merged via the driver-core tree.

Thanks.

-- 
Catalin
