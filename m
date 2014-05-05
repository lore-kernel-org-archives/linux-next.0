From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Mon, 5 May 2014 14:02:11 -0700
Message-ID: <20140505210211.GA27503@kroah.com>
References: <20140505154103.941b62e29706efa62b826354@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140505154103.941b62e29706efa62b826354@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, May 05, 2014 at 03:41:03PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> arch/arm64/kernel/early_printk.c between commit f774b7d10e21 ("arm64:
> fixmap: fix missing sub-page offset for earlyprintk") from the  tree and
> commit 8ef0ed95ee04 ("arm64: remove arch specific earlyprintk") from the
> tty tree.
> 
> I fixed it up (I removed the file) and can carry the fix as necessary (no
> action is required).

That sounds fine to me, thanks.

greg k-h
