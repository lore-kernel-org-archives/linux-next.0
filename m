From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (net tree related)
Date: Thu, 23 Jun 2011 16:04:13 +0300
Message-ID: <BANLkTin+iCahNVJGKc-_26pb9zEERTc8_A@mail.gmail.com>
References: <20110623152920.31b28b00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:44726 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab1FWNEO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2011 09:04:14 -0400
In-Reply-To: <20110623152920.31b28b00.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 23, 2011 at 8:29 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:

I build on all powerpc defconfigs, somehow this driver is not pinned
by any of them :^)

> drivers/net/ll_temac_main.c:209:4: error: implicit declaration of function 'dma_unmap_single'
