From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the tty tree with the trivial tree
Date: Wed, 9 Dec 2009 15:38:19 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0912091536230.3755@pobox.suse.cz>
References: <20091209162826.a28c6c68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59140 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbZLIOiO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 09:38:14 -0500
In-Reply-To: <20091209162826.a28c6c68.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

On Wed, 9 Dec 2009, Stephen Rothwell wrote:

> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in 
> drivers/mmc/card/sdio_uart.c between commit 
> 1e04b7ae709d19d5c9f69c64e1e30253018ce102 ("sdio_uart: coding style 
> fixes") from the trivial tree and various commits from the tty tree.
> 
> I just used the tty tree version where they clashed.  Jiri, you might
> consider sending that patch to Greg for the tty tree.

Hi,

the trivial tree pull request has already been sent to Linus a day ago. I 
am now waiting whether it will be merged or missed.

In the latter case, I will split the tty hunk out and send to Greg. In the 
former case the conflict would have to be solved either by Greg or Linus.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
