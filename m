From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net tree
Date: Wed, 21 Jul 2010 21:09:47 -0700 (PDT)
Message-ID: <20100721.210947.00037033.davem@davemloft.net>
References: <20100722121157.344c8462.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20100722121157.344c8462.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 22 Jul 2010 12:11:57 +1000

> After merging the net tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/vhost/net.c: In function 'vhost_net_set_backend':
> drivers/vhost/net.c:536: warning: label 'done' defined but not used
> 
> Introduced by commit 11fe883936980fe242869d671092a466cf1db3e3 ("Merge
> branch 'master' of
> master.kernel.org:/pub/scm/linux/kernel/git/davem/net-2.6") which
> kept the unneeded label.  Sorry if I misguided you.

I've fixed this, thanks Stephen.  Don't worry, not your fault :)
