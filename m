From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (net
 tree related)
Date: Wed, 02 Feb 2011 20:46:06 -0800 (PST)
Message-ID: <20110202.204606.226770967.davem@davemloft.net>
References: <20110203151309.d4a6c344.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20110203151309.d4a6c344.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Feb 2011 15:13:09 +1100

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> net/ipv4/fib_trie.c:98: error: redefinition of 'struct node'
> 
> Probably exposed by commit 3630b7c050d9c3564f143d595339fc06b888d6f3
> ("ipv4: Remove fib_hash").
> 
> Naming a struct "node" (in the face of include/linux/node.h) is a bit
> hopeful.  :-)
> 
> I have left this broken for now ...

This problem has existed forever, you just have only been testing
the build with fib_hash enabled instead of fib_trie.

I'm really surprised this has never been hit before. :-)

I'll fix it up, thanks for the report.

