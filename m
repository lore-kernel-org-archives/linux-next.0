From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the omap tree
Date: Wed, 29 Nov 2017 08:50:50 -0800
Message-ID: <20171129165050.GG28152@atomide.com>
References: <20171129093017.5e69ad0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129093017.5e69ad0d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [171128 22:32]:
> Hi Tony,
> 
> Commit
> 
>   57af8b4f7b46 ("Revert "ARM: omap2plus: Run make savedefconfig again to save some space"")
> 
> is missing a Signed-off-by from its author or committer.
> 
> Also, it is nice to put some reasoning in the commit message for a revert
> so future you knows why you did it.

Thanks for letting me know, that's no longer in my for-next branch.

And yes, I should have added a proper commit message to the revert.

Regards,

Tony
