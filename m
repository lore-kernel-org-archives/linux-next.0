From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the trivial tree with the net tree
Date: Thu, 04 Feb 2010 20:26:45 -0800 (PST)
Message-ID: <20100204.202645.18974249.davem@davemloft.net>
References: <20100205133747.14ca83f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20100205133747.14ca83f2.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: jkosina@suse.cz, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, adam.buchbinder@gmail.com, netdev@vger.kernel.org, bhutchings@solarflare.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 5 Feb 2010 13:37:47 +1100

> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/sfc/mcdi_pcol.h between commit
> 5297a98d5dd6de86fe1e2ffc9ea60cdf59b71443 ("sfc: Update MCDI protocol
> definitions") from the net tree and commit
> 4887b438e6880c73c4b44d868211e70c1f3deaec ("Fix misspelling of
> "successful" and variants in comments") from the trivial tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Ugh, this is the second spelling fix that's hit a conflict
in the same exact tree.

Please, submit these things to the subsystem maintainers instead
of keeping them together in a totally seperate tree.  That way
we won't have to keep fighting these things.

Thanks.
