From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 8 (nfsd)
Date: Tue, 8 Mar 2016 08:55:29 -0800
Message-ID: <56DF0401.6010901@infradead.org>
References: <20160308165122.68ececf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160308165122.68ececf7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>
List-Id: linux-next.vger.kernel.org

On 03/07/16 21:51, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160307:
> 

on x86_64:
when CONFIG_BLOCK is not enabled:

../fs/nfsd/nfs4layouts.c: In function 'nfsd4_setup_layout_type':
../fs/nfsd/nfs4layouts.c:145:39: error: dereferencing pointer to incomplete type
      sb->s_bdev && sb->s_bdev->bd_disk->fops->pr_ops)
                                       ^


-- 
~Randy
