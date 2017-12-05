From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: Signed-off-by missing for commits in the btrfs-kdave
 tree
Date: Tue, 5 Dec 2017 13:43:51 +0100
Message-ID: <20171205124351.GG3553@suse.cz>
References: <20171201092250.66217bac@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201092250.66217bac@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Filipe Manana <fdmanana@suse.com>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 01, 2017 at 09:22:49AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Commits
> 
>   f212bed55c85 ("Btrfs: add support for fallocate's zero range operation")
>   2d0d54302a5f ("Btrfs: use cached state when dirtying pages during buffered write")
> 
> are missing a Signed-off-by from their committer.

Will be fixed in the next for-next version.

This was caused by rebasing a branch that's normally merged to for-next.
Some of the patches have been merged to master and caused conflicts.
