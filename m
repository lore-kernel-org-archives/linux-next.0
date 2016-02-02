From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Tue, 2 Feb 2016 09:54:17 +0100
Message-ID: <20160202085417.GK31992@suse.cz>
References: <20160202103904.4cb77c87@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160202103904.4cb77c87@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On Tue, Feb 02, 2016 at 10:39:04AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/reada.c:326:29: error: invalid storage class for function 'reada_find_extent'
>  static struct reada_extent *reada_find_extent(struct btrfs_root *root,
>                              ^
> 
> and lots of others.

sorry, I've pushed 4.5-rc1 again until I fix it.
