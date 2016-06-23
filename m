From: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 23 Jun 2016 15:00:21 +0100
Message-ID: <20160623140021.GZ1868@techsingularity.net>
References: <20160623165321.01995531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160623165321.01995531@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jun 23, 2016 at 04:53:21PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig and x86_64 allmodconfig) produced this warning:
> 

I asked that Andrew drop the patch series that introduced this problem.
It's fixed in a private tree but it's not ready for reposting yet.

-- 
Mel Gorman
SUSE Labs
