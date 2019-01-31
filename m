From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: build failure after merge of the ext3 tree
Date: Thu, 31 Jan 2019 11:11:22 +0100
Message-ID: <20190131101122.GD19222@quack2.suse.cz>
References: <20190131151411.7e8b89b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190131151411.7e8b89b3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu 31-01-19 15:14:11, Stephen Rothwell wrote:
> Hi Jan,
> 
> After merging the ext3 tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> ld: fs/ext2/super.o: in function `ext2_fill_super':
> super.c:(.text+0x1494): undefined reference to `__divdi3'
> ld: super.c:(.text+0x14bc): undefined reference to `__divdi3'
> 
> Caused by commit
> 
>   455d38a0e62f ("ext2: Fix underflow in ext2_max_size()")
> 
> I have reverted that commit for today.

Yeah, I've fixed that already in my tree. Thanks for letting me know and
sorry for the breakage.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
