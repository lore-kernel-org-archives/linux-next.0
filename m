From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc
 tree
Date: Mon, 19 Aug 2013 16:57:36 -0400
Message-ID: <20130819205736.GA13964@titan.lakedaemon.net>
References: <20130819160537.1eeb0a9ebc269def138e016b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:18368 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852Ab3HSU57 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2013 16:57:59 -0400
Content-Disposition: inline
In-Reply-To: <20130819160537.1eeb0a9ebc269def138e016b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

On Mon, Aug 19, 2013 at 04:05:37PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the mvebu tree got conflicts in various files
> between merges and commits in the arm-soc tree and merges in the mvebu
> tree.

I'm afraid I'm a bit lost...

> These merges/commits in the mvebu tree appear to be from a previous
> version of the arm-soc tree that the mvebu tree has been rebased upon.
> Please don't do that - the arm-soc tree as a whole is not stable.

I didn't do anything different from the other times I built for-next.
Could you give me a specific example when you build linux-next again?
I'll certainly try to avoid it in the future, but it'll be easier if I
know what 'it' is. ;-)

I'll not change for-next today, and we'll see how it goes.

thx,

Jason.
