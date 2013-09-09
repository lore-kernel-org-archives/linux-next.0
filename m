From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 9 (ntb)
Date: Mon, 09 Sep 2013 11:12:51 -0700
Message-ID: <522E0FA3.6060900@infradead.org>
References: <20130909161616.0d663a37c9d5b6b3a2a2735a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57681 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168Ab3IISNa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Sep 2013 14:13:30 -0400
In-Reply-To: <20130909161616.0d663a37c9d5b6b3a2a2735a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Mason <jon.mason@intel.com>

On 09/08/13 23:16, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any code for v3.13 to your linux-next included branches
> until after v3.12-rc1 is released.
> 
> Changes since 20130906:
> 


on x86_64:

drivers/built-in.o: In function `ntb_transport_free_queue':
(.text+0x150344): undefined reference to `dma_sync_wait'
drivers/built-in.o: In function `ntb_transport_create_queue':
(.text+0x1504b5): undefined reference to `dma_find_channel'
drivers/built-in.o: In function `ntb_transport_rx':
ntb_transport.c:(.text+0x150c65): undefined reference to `dma_sync_wait'


ntb_transport.c uses several dma_*() interfaces.
It looks like it needs to select DMA_ENGINE at a minimum.


-- 
~Randy
