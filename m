From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: linux-next: build failure after merge of the nfs-anna tree
Date: Mon, 17 Dec 2018 12:18:01 +0100
Message-ID: <809c5ec8-0763-6855-bbbc-3cb95e168278@rasmusvillemoes.dk>
References: <20181217101630.292dd55e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217101630.292dd55e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 17/12/2018 00.16, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the nfs-anna tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> /home/sfr/next/next/fs/nfs/nfsroot.c: In function 'root_nfs_data':
> /home/sfr/next/next/fs/nfs/nfsroot.c:264:5: error: implicit declaration of function 'fmtcheck'; did you mean 'dst_check'? [-Werror=implicit-function-declaration]
>      fmtcheck(tmp, "%s", 0), utsname()->nodename);
>      ^~~~~~~~
>      dst_check
> 
> Caused by commit
> 
>   66ab6f062d96 ("nfs: use fmtcheck() in root_nfs_data")

I didn't know anybody had picked that one up. It's completely safe to
just ignore that commit until the fmtcheck() utility is actually in.

Anna, can I take the fact that this was picked up as a sort-of implicit
ack, that I can use if and when I ever get around to resending the
fmtcheck() series? And for simplicitly, would you mind if the nfs patch
would just be routed along with the patches introducing fmtcheck()?

Rasmus
