From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the net-current
 tree
Date: Thu, 10 Dec 2009 09:45:27 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0912100944250.3755@pobox.suse.cz>
References: <20091210143756.5a236829.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20091210143756.5a236829.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Damian Lukowski <damian@tvk.rwth-aachen.de>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, =?ISO-8859-15?Q?=22Andr=E9_Goddard_Rosa=22?= <andre.goddard@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, 10 Dec 2009, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> include/net/tcp.h between commit 2f7de5710a4d394920405febc2a9937c69e16dda
> ("tcp: Stalling connections: Move timeout calculation routine") from the
> net-current tree and commit af901ca181d92aac3a7dc265144a9081a86d8f39
> ("tree-wide: fix assorted typos all over the place") from the trivial
> tree.
> 
> The former moves the comment that the latter corrects to
> net/ipv4/tcp_timer.c.  I just used the net-current version and didn't
> bother fixing it up in its new location.

Hi,

Linus has merged trivial tree into his tree tonight, so I am afraid that 
davem will have to fix the conflict when pulling Linus tree into 
net-current.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
