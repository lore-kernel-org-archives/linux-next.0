From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the sparc
 tree
Date: Mon, 22 Feb 2010 11:24:20 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1002221123580.30967@pobox.suse.cz>
References: <20100222141341.f5c92be4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100222141341.f5c92be4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frans Pop <elendil@planet.nl>, David Miller <davem@davemloft.net>, Daniel Mack <daniel@caiaq.de>
List-Id: linux-next.vger.kernel.org

On Mon, 22 Feb 2010, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> arch/sparc/kernel/leon_kernel.c between commit
> 0da2b300b91ddeb9944c3fb4faaf78c1c482c0af ("sparc: remove trailing space
> in messages") from the sparc tree and commit
> 3ad2f3fbb961429d2aa627465ae4829758bc7e07 ("tree-wide: Assorted spelling
> fixes") from the trivial tree.
> 
> The former also fixed the spelling mistake fixed by the latter.

Thanks, I have reverted the chunk in question in my tree.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
