From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the xarray tree
Date: Wed, 25 Jul 2018 16:36:21 -0700
Message-ID: <20180725233621.GA20272@bombadil.infradead.org>
References: <20180726072814.6c93b595@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180726072814.6c93b595@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 26, 2018 at 07:28:14AM +1000, Stephen Rothwell wrote:
> Hi Matthew,
> 
> Commits
> 
>   890e537e2b42 ("filesystem-dax: Introduce dax_lock_mapping_entry()")
>   aaf149902c79 ("filesystem-dax: Set page->index")
> 
> are missing a Signed-off-by from their committers.

Oh, hah.  I assume this is an automated email?

These two commits I cherry-picked from the nvdimm tree so that XArray can
be rebased on top of it.  Is there some other way I should be doing this,
like rebasing on top of the nvdimm tree?
