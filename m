From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the net tree
Date: Mon, 30 Nov 2009 13:36:18 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0911301335570.6953@wotan.suse.de>
References: <20091130135320.215722a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753129AbZK3MgO@vger.kernel.org>
In-Reply-To: <20091130135320.215722a2.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, "David S. Miller" <davem@davemloft.net>, =?ISO-8859-15?Q?=22Andr=E9_Goddard_Rosa=22?= <andre.goddard@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, 30 Nov 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/sfc/falcon.c between commit
> 127e6e10ad17585c48cba8e1dcf30d98b90ee583 ("sfc: Fix bugs in RX queue
> flushing") from the net tree and commit
> 4e5cf22a6f45b6489f84de03d3a1dfa60cc4b4e4 ("tree-wide: fix assorted typos
> all over the place") from the trivial tree.
> 
> The former removed the comment that the latter was fixing.

Dropped the falcon.c hunk from the pile, so the conflict should be gone. 
Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
