From: Jeff Layton <jlayton@redhat.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 26 May 2017 06:16:28 -0400
Message-ID: <1495793788.2926.4.camel@redhat.com>
References: <20170526124324.058c3d2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170526124324.058c3d2a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox <mawilcox@microsoft.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-05-26 at 12:43 +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/jfs/jfs_metapage.c: In function 'force_metapage':
> fs/jfs/jfs_metapage.c:714:2: warning: ignoring return value of 'write_one_page', declared with attribute warn_unused_result [-Wunused-result]
>   write_one_page(page);
>   ^
> fs/jfs/jfs_metapage.c: In function 'release_metapage':
> fs/jfs/jfs_metapage.c:759:4: warning: ignoring return value of 'write_one_page', declared with attribute warn_unused_result [-Wunused-result]
>     write_one_page(page);
>     ^
> 
> Introduced by commit
> 
>   f8652aebee02 ("mm: drop "wait" parameter from write_one_page()")
> 
> These call sites were updated for the droppping of the argument, but
> not for the addition of __must_check :-(
> 

(cc'ing Dave...)

Yeah, that's a known issue. When Willy reviewed the patch originally he
asked me to add a __must_check there so that JFS would pick up some
warnings for this.

JFS really ought to check the return code there and do something sane
with it. Dave?

-- 
Jeff Layton <jlayton@redhat.com>
