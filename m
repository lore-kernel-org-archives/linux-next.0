From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the libata tree
Date: Thu, 31 Dec 2015 21:01:03 -0500
Message-ID: <20160101020103.GB29040@htj.duckdns.org>
References: <20151231122915.64bc66e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151231122915.64bc66e5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaedon Shin <jaedon.shin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hello, Stephen.

On Thu, Dec 31, 2015 at 12:29:15PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the libata tree got conflicts all over teh
> place due to commit:
> 
>   53fab927a8fc ("ata: ahci_brcmstb: add support for MIPS-based platforms")
> 
> from the libata tree which seem to contain most (if not all) of Linus'
> tree :-(.

That's me messing up the branch.  Will rebase the tree.  Sorry about
the mess.

Thanks.

-- 
tejun
