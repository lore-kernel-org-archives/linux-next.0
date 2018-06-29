From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sat, 30 Jun 2018 00:25:22 +0300
Message-ID: <20180629212521.GA23437@avx2>
References: <20180629174946.1b4f40ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629174946.1b4f40ef@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 29, 2018 at 05:49:46PM +1000, Stephen Rothwell wrote:
> fs/proc/inode.c:110:2: note: in expansion of macro 'BUILD_BUG_ON'
>   BUILD_BUG_ON(sizeof(struct proc_dir_entry) >= SIZEOF_PDE);
>   ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   527ae8759f10 ("proc: fixup PDE allocation bloat")
> 
> I have reverted that commit for today.

Can't reproduce it with commit 7aa4b0a46be8badd053c958481f0e89e634ae4df
(the one before revert) both on 32-bit and 64-bit.

Can you post fs/proc/inode.i ?
