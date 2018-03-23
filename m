From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the
 rdma-fixes tree
Date: Fri, 23 Mar 2018 00:19:00 -0400 (EDT)
Message-ID: <20180323.001900.849305099701511845.davem@davemloft.net>
References: <20180316115610.3d7f232a@canb.auug.org.au>
        <1521163082.18703.191.camel@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521163082.18703.191.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dledford@redhat.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, jgg@mellanox.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, markb@mellanox.com, leonro@mellanox.com
List-Id: linux-next.vger.kernel.org

From: Doug Ledford <dledford@redhat.com>
Date: Thu, 15 Mar 2018 21:18:02 -0400

> Here's the commit (from the rdma git repo) with the proper merge fix
> (although it also has other minor merge stuff that needs to be ignored):
> 
> 2d873449a202 (Merge branch 'k.o/wip/dl-for-rc' into k.o/wip/dl-for-next)

Really?

[davem@localhost GIT]$ git clone --reference linux/.git git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git
Cloning into 'rdma'...
remote: Counting objects: 32, done.        
remote: Compressing objects: 100% (31/31), done.        
remote: Total 32 (delta 0), reused 32 (delta 0)        
Receiving objects: 100% (32/32), 186.52 KiB | 3.01 MiB/s, done.
Checking connectivity: 5706198, done.
Checking out files: 100% (61622/61622), done.
[davem@localhost GIT]$ cd rdma
[davem@localhost rdma]$ git show 2d873449a202
fatal: ambiguous argument '2d873449a202': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
[davem@localhost rdma]$
