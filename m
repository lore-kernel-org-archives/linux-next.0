From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: Fixes tag needs some work in the btrfs-kdave tree
Date: Tue, 26 Mar 2019 17:32:06 +0100
Message-ID: <20190326163206.GW10640@suse.cz>
References: <20190326070924.1857a3fd@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326070924.1857a3fd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 26, 2019 at 07:09:24AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   167ab7e5ebbf ("btrfs: reloc: Fix NULL pointer dereference due to expanded reloc_root lifespan")
> 
> Fixes tag
> 
>   Fixes: d2311e698578 ("btrfs: relocation: Delay reloc tree deletion after merge_reloc_roots()")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h (%s)'

Will be fixed in the next update, thanks for the report. There was
reference from another repository that had wrong commit id that I fixed
but did not notice the slightly differen subject with ().
