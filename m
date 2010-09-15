From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Subject: Re: linux-next: manual merge of the bkl-vfs tree with the nilfs2
 tree
Date: Wed, 15 Sep 2010 13:16:28 +0900 (JST)
Message-ID: <20100915.131628.69479307.ryusuke@osrg.net>
References: <20100915140114.81406c4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100915140114.81406c4f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: arnd@arndb.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jblunck@infradead.org, konishi.ryusuke@lab.ntt.co.jp
List-Id: linux-next.vger.kernel.org

On Wed, 15 Sep 2010 14:01:14 +1000, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next merge of the bkl-vfs tree got a conflict in
> fs/nilfs2/super.c between commit 38999dca4fdc4a0d1b92a540bc0772a32b07388a
> ("nilfs2: do not allocate multiple super block instances for a device")
> from the nilfs2 tree and commit 3fec873dc6e9026d98e2359202fa50fd06ee7b64
> ("BKL: Remove BKL from NILFS2") from the bkl-vfs tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

The fix looks fine to me.

Thanks!

Ryusuke Konishi
