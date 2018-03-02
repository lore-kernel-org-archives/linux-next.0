From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: Signed-off-by missing for commit in the btrfs-kdave
 tree
Date: Fri, 2 Mar 2018 13:09:17 +0100
Message-ID: <20180302120916.GA5942@suse.cz>
References: <20180302073733.789343f2@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302073733.789343f2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Filipe Manana <fdmanana@suse.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 02, 2018 at 07:37:33AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Commit
> 
>   001cafe3c03c ("Btrfs: fix unexpected -EEXIST when creating new inode")
> 
> is missing a Signed-off-by from its committer.

Thanks for the notice, this is only temporary. The patch has been merged
to 4.16-rc2 but Filipe's branch is based on an older rc and the patch
was probably cherry-picked, without the SOB.

I'll add a pre-push check for the signed-off so it does not trigger the
warning in the future for the known cases.
