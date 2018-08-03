From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Thu, 02 Aug 2018 19:44:26 -0700 (PDT)
Message-ID: <20180802.194426.2272443689594696355.davem@davemloft.net>
References: <20180803121430.25899c83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803121430.25899c83@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 3 Aug 2018 12:14:30 +1000

> Hi all,
> 
> After merging the net-next tree, today's linux-next build (perf) failed
> like this:
> 
> In file included from btf.c:10:0:
 ...
> Caused by commit
> 
>   89b1698c93a9 ("Merge ra.kernel.org:/pub/scm/linux/kernel/git/davem/net")
> 
> Some of the lines in tools/lib/bpf/btf.[ch] were duplicated (they existed
> on both sides of the merge).
> 
> I have used the net-next tree from next-20180802 for today.

My bad, I am working on fixing this now.

Thanks.
