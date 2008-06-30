From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 10:24:13 +0100
Message-ID: <1214817853.10393.330.camel@pmac.infradead.org>
References: <20080630190907.004cbb79.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:41964 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760532AbYF3JYR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 05:24:17 -0400
In-Reply-To: <20080630190907.004cbb79.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, Chas Williams <chas@cmf.nrl.navy.mil>, David Miller <davem@davemloft.net>

On Mon, 2008-06-30 at 19:09 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the firmware tree got a major conflict
> between commit e92481f95375aa2702ea5018b0295792ae0fa9c1 ("atm: [fore200e]
> convert to use request_firmware()") from the net tree and commit
> ef15231d8a30e501b5471ad97a07359e39ceab00 ("fore200e: use request_firmware
> ()") from the firmware tree.
> 
> I reverted the latter from the firmware tree for now.

Oops, sorry -- I'd forgotten about that patch, and I let Jaswinder go
ahead and do it again.

I think the reason I didn't apply the patch from Chas to my tree was
because I'm trying to be very careful to preserve functionality -- when
I ask Linus to pull the firmware tree, I still want people to be able to
build in _all_ the firmware they could before.

I'm happy enough to see it done separately though; I'll drop our
fore200e patch from the firmware-2.6.git tree.

-- 
dwmw2
