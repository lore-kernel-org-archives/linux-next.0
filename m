From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the vfs tree with the nsfd tree
Date: Sun, 10 Jan 2016 21:59:18 -0500
Message-ID: <20160111025918.GB25396@fieldses.org>
References: <20160111121632.26fd5873@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160111121632.26fd5873@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 11, 2016 at 12:16:32PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/namei.c
> 
> between commit:
> 
>   1932ac9d7cef ("nfsd: don't hold i_mutex over userspace upcalls")
> 
> from the nfsd tree and commit:
> 
>   bbddca8e8fac ("nfsd: don't hold i_mutex over userspace upcalls")
> 
> from the vfs tree.
> 
> Similar patch, but slightly different. :-(
> 
> I fixed it up (I used the vfs tree version) and can carry the fix as
> necessary (no action is required).

Thanks, I've dropped my version.

--b.
