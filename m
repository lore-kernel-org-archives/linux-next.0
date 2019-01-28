From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Mon, 28 Jan 2019 17:53:42 +0100
Message-ID: <20190128165342.GH2900@suse.cz>
References: <20190124095338.523fc3a3@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124095338.523fc3a3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 24, 2019 at 09:53:38AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/btrfs/relocation.c: In function 'insert_dirty_subv':
> fs/btrfs/relocation.c:2138:6: warning: unused variable 'root_objectid' [-Wunused-variable]
>   u64 root_objectid = root->root_key.objectid;
>       ^~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   7b837199c581 ("btrfs: relocation: Delay reloc tree deletion after merge_reloc_roots()")
> 
> Presumably the ASSERT is compiled out in this configuration.

Agreed, thanks for the report. I'll drop the temporary variable.
