From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the f2fs tree with the vfs-fixes tree
Date: Mon, 14 May 2018 01:36:59 +0100
Message-ID: <20180514003659.GA30522@ZenIV.linux.org.uk>
References: <20180514102624.76a4097e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514102624.76a4097e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 14, 2018 at 10:26:24AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the f2fs tree got a conflict in:
> 
>   fs/f2fs/namei.c
> 
> between commit:
> 
>   1e2e547a93a0 ("do d_instantiate/unlock_new_inode combinations safely")
> 
> from the vfs-fixes tree and commit:
> 
>   ab3835aae642 ("f2fs: call unlock_new_inode() before d_instantiate()")
> 
> from the f2fs tree.
> 
> I think that the vfs-fixes commit supercedes the f2fs tree one, so I
> used that.

Yes, it does.
