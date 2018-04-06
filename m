From: Anna Schumaker <Anna.Schumaker@Netapp.com>
Subject: Re: linux-next: bad commits in the nfs-anna tree
Date: Fri, 6 Apr 2018 09:44:07 -0400
Message-ID: <f728fad9-bc15-b968-2965-d17c6893efc3@Netapp.com>
References: <20180406074314.7ae8652e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406074314.7ae8652e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 04/05/2018 05:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> It looks like part of Linus' tree has been rebased into the nfs-anna tree ... commits
> 
>   4c8936622a01 ("btrfs: use kvzalloc to allocate btrfs_fs_info")
> to
>   8f1cd0ae48f5 ("Linux 4.16-rc4")
> 
> in the nfs-anna tree are the same as commits
> 
>   a8fd1f717493 ("btrfs: use kvzalloc to allocate btrfs_fs_info")
> to
>   661e50bc8532 ("Linux 4.16-rc4")
> 
> I can't use the nfs-anna tree as it is, please fis it up.

Weird.  I removed a few patches from the middle of my tree after finding a bug, but I guess I gave my interactive rebase a slightly too wide range.  It should be fixed now.

Anna
> 
