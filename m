From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (arm-soc tree related)
Date: Wed, 14 Mar 2012 20:20:20 -0400
Message-ID: <20120315002020.GA16189@titan.lakedaemon.net>
References: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:27523 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753992Ab2COAU2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 20:20:28 -0400
Content-Disposition: inline
In-Reply-To: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 15, 2012 at 10:59:01AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allmodconfig) failed like this:
> 
> drivers/ata/sata_mv.c:4185:1: error: '__mod_of_device_table' aliased to undefined symbol 'mvsdio_dt_ids'
> 
> Caused by commit f1e1e148c5cb ("ARM: kirkwood: sata_mv: add device tree
> binding").

Stephen,

That's my mistake.  I did a pull request for the wrong branch.  Olof,
could you please drop the offending branch and I'll submit a new pull
request once I have a chance to test Arnd's irq patch?

thx,

Jason.
