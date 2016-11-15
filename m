From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Date: Mon, 14 Nov 2016 18:13:41 -0800
Message-ID: <20161115021341.7tt6acyumfueq2kf@intel.com>
References: <20161115120107.35e7db48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161115120107.35e7db48@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nayna Jain <nayna@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 15, 2016 at 12:01:07PM +1100, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> After merging the tpmdd tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/char/tpm/tpm_of.c: In function 'read_log_of':
> drivers/char/tpm/tpm_of.c:37:8: warning: 'np' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   sizep = of_get_property(np, "linux,sml-size", NULL);
>         ^
> 
> Introduced by commit
> 
>   4a45d9669ac1 ("tpm: replace of_find_node_by_name() with dev of_node property")
> 
> This commit is just wrong :-(

It really is. I'll drop it from my tree.

> -- 
> Cheers,
> Stephen Rothwell

/Jarkko
