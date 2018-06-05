From: Trond Myklebust <trondmy@gmail.com>
Subject: Re: linux-next: build warning after merge of the nfs tree
Date: Tue, 5 Jun 2018 10:53:44 -0400
Message-ID: <CAABAsM4sBJukct3Ah7L7h2vg1dxzLWiVsSthk6ZECm3Guem4Pg@mail.gmail.com>
References: <20180605101741.658efe5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605101741.658efe5f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: List Linux Next Mailing <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org, Fred A Isaman IV <fred.isaman@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, 4 Jun 2018 at 20:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Trond,
>
> After merging the nfs tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> fs/nfs/nfs4proc.c:910:13: warning: 'nfs4_layoutget_release' defined but not used [-Wunused-function]
>  static void nfs4_layoutget_release(void *calldata)
>              ^~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   30ae2412e90f ("pnfs: Fix manipulation of NFS_LAYOUT_FIRST_LAYOUTGET")
>
> in combination with
>
>   2409a976a299 ("pnfs: Add LAYOUTGET to OPEN of a new file")
>
> # CONFIG_NFS_V4_1 is not set

Thanks Stephen! I've appended a fix to the linux-next branch.

Cheers
 Trond
