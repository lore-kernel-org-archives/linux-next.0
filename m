From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 04:34:48 +0000
Message-ID: <20160315043448.GE17997@ZenIV.linux.org.uk>
References: <20160315150640.02a4db30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160315150640.02a4db30@canb.auug.org.au>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 15, 2016 at 03:06:40PM +1100, Stephen Rothwell wrote:
> Hi Ben,
> 
> Today's linux-next merge of the aio tree got a conflict in:
> 
>   fs/namei.c
> 
> between commit:
> 
>   5955102c9984 ("wrappers for ->i_mutex access")
> 
> from the vfs tree and commit:
> 
>   5d3d80fcf992 ("aio: add support for in-submit openat")
> 
> from the aio tree.

What.

The.

Hell?

The first commit is in the mainline, not in vfs tree.  And it had been
there since before -rc1.

Incidentally, why the hell has that thing never landed in my mailbox?  Not
directly, not Cc'd, not via fsdevel either.

Ben, what the fuck going on?  OK, you don't feel necessary to mention
that to me (or have me take a look through it).  Your business.  You also
don't bother to bring it on fsdevel.  Again, your estimates of the
usefulness of said list and review there are your business.  But it looks
like you also do not bother to check what has landed in the mainline two
months ago.  WTF?
