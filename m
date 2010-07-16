From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Thu, 15 Jul 2010 22:27:49 -0600
Message-ID: <AANLkTilI_iZCD1S-LTmYgnCnUnbwhX3t-kEV9CUHEjFW@mail.gmail.com>
References: <20100716111520.732bd29a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:44236 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750992Ab0GPE2K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Jul 2010 00:28:10 -0400
In-Reply-To: <20100716111520.732bd29a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andres Salomon <dilinger@queued.net>

On Thu, Jul 15, 2010 at 7:15 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/sparc/kernel/prom_64.c between commit
> 95f72d1ed41a66f1c1c29c24d479de81a0bea36f ("lmb: rename to memblock") from
> Linus' tree and commit 035ebefc737cce56d3938e9b7eaa5ac0e9c28715
> ("of/sparc: move is_root_node() to of.h") from the devicetree tree.
>
> Just context changes. I fixed it up (see below) and can carry the fix for
> a while.

Okay, thanks Stephen.

g.
