From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Date: Tue, 27 May 2014 17:22:04 -0400
Message-ID: <20140527212204.GD32160@fieldses.org>
References: <20140526111815.25153c0c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140526111815.25153c0c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, May 26, 2014 at 11:18:15AM +1000, Stephen Rothwell wrote:
> Hi Bruce,
> 
> After merging the nfsd tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfsd/nfs4proc.c: In function 'warn_on_nonidempotent_op':
> fs/nfsd/nfs4proc.c:1861:3: error: implicit declaration of function 'nfsd4_op_name' [-Werror=implicit-function-declaration]
>    pr_err("unable to encode reply to nonidempotent op %d (%s)\n",
>    ^
> 
> Caused by commit 4d332a993e64 ("nfsd4: fix encoding of out-of-space replies").
> 
> I have used the nfsd tree from next-20140523 for today.

Thanks for catching that!  It should be fixed.  (But I also pushed out a
bunch of new stuff, so hopefully that didn't introduce anything equally
bad....).

--b.
