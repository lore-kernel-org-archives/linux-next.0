From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: build failure after merge of the ext3 tree
Date: Mon, 2 Jan 2012 23:40:12 +0100
Message-ID: <20120102224012.GE3626@quack.suse.cz>
References: <20111228112254.551c2ee5a1ac8509962d6611@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228112254.551c2ee5a1ac8509962d6611@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

  Hi,

On Wed 28-12-11 11:22:54, Stephen Rothwell wrote:
> After merging the ext3 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/reiserfs/super.c: In function 'reiserfs_show_options':
> fs/reiserfs/super.c:652:20: error: 'struct reiserfs_sb_info' has no member named 's_qf_names'
> fs/reiserfs/super.c:653:50: error: 'struct reiserfs_sb_info' has no member named 's_qf_names'
> fs/reiserfs/super.c:656:20: error: 'struct reiserfs_sb_info' has no member named 's_qf_names'
> fs/reiserfs/super.c:657:50: error: 'struct reiserfs_sb_info' has no member named 's_qf_names'
> fs/reiserfs/super.c:660:20: error: 'struct reiserfs_sb_info' has no member named 's_jquota_fmt'
> fs/reiserfs/super.c:661:21: error: 'struct reiserfs_sb_info' has no member named 's_jquota_fmt'
> fs/reiserfs/super.c:663:26: error: 'struct reiserfs_sb_info' has no member named 's_jquota_fmt'
> 
> Caused by commit 5fa84b871b97 ("reiserfs: Properly display mount options
> in /proc/mounts").  Hint: CONFIG_QUOTA is not set in this build.
  Ah, stupid me. Fixed now. Thanks for letting me know.

									Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
