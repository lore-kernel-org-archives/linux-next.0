From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Thu, 11 Dec 2008 10:21:22 +0000
Message-ID: <20081211102122.5fe69850@lxorguk.ukuu.org.uk>
References: <20081211172645.f40c8b9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:44605 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754630AbYLKKV1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Dec 2008 05:21:27 -0500
In-Reply-To: <20081211172645.f40c8b9f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, David Daney <ddaney@caviumnetworks.com>

On Thu, 11 Dec 2008 17:26:45 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/serial/8250.c between commit
> 507ce132910803e8fd1116467e99f59da3d526f0 ("iop13xx: workaround errata
> that causes uart interrupts to be missed") from the async_tx tree and
> commit 63c4074301f79f1620d6c880973d6ef1cc770990
> ("tty-serial-8250-regops") from the ttydev tree.
> 
> I have reverted the async_tx commit for today. Please try to figure out
> what should happen here.

Dan - can you feed the uart 8250 patches through the ttydev tree or are
there dependancies on other parts of async_tx ?

Alan
