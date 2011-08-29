From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Mon, 29 Aug 2011 10:36:57 +0200
Message-ID: <20110829083656.GH8978@8bytes.org>
References: <20110829133237.80467b5d54438ace53b324df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110829133237.80467b5d54438ace53b324df@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 29, 2011 at 01:32:37PM +1000, Stephen Rothwell wrote:
> After merging the iommu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iommu/omap-iommu.c:27:24: fatal error: plat/iommu.h: No such file or directory
> 
> Caused by commit fcf3a6ef4a58 ("omap: iommu/iovmm: move to dedicated
> iommu folder").  Presumably building of this code should be restricted to
> just some platforms only.
> 
> I have dropped the iommu tree for today (since I have no older working
> version).

Thanks for the report Stephen, I apply Ohads patch today so that this
should be fixed for tomorrow.

	Joerg
