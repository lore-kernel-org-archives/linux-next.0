From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Date: Thu, 31 Aug 2017 09:48:14 +1000
Message-ID: <20170831094814.1549b70e@canb.auug.org.au>
References: <20170825102420.3ab48a1b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170825102420.3ab48a1b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 25 Aug 2017 10:24:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the nfsd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/nfsd/nfs4proc.c: In function 'nfsd4_getdeviceinfo_release':
> fs/nfsd/nfs4proc.c:1356:8: error: 'gdev' undeclared (first use in this function)
>   kfree(gdev->gd_device);
>         ^
> fs/nfsd/nfs4proc.c:1356:8: note: each undeclared identifier is reported only once for each function it appears in
> fs/nfsd/nfs4proc.c: At top level:
> fs/nfsd/nfs4proc.c:1439:1: warning: return type defaults to 'int' [-Wreturn-type]
>  nfsd4_layoutget_release(union nfsd4_op_u *u)
>  ^
> fs/nfsd/nfs4proc.c: In function 'nfsd4_layoutget_release':
> fs/nfsd/nfs4proc.c:1441:8: error: 'lgp' undeclared (first use in this function)
>   kfree(lgp->lg_content);
>         ^
> fs/nfsd/nfs4proc.c: At top level:
> fs/nfsd/nfs4proc.c:2405:17: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>    .op_release = nfsd4_layoutget_release,
>                  ^
> fs/nfsd/nfs4proc.c:2405:17: note: (near initialization for 'nfsd4_ops[50].op_release')
> fs/nfsd/nfs4proc.c: In function 'nfsd4_layoutget_release':
> fs/nfsd/nfs4proc.c:1442:1: warning: control reaches end of non-void function [-Wreturn-type]
>  }
>  ^
> 
> Caused by commit
> 
>   93e92e5d0016 ("nfsd4: define ->op_release for compound ops")
> 
> I have used the nfsd tree from next-20170824 for today.

I am still getting this failure.

-- 
Cheers,
Stephen Rothwell
