From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: Tree for April 30
Date: Fri, 30 Apr 2010 21:27:50 +0200
Message-ID: <20100430192748.GC5357@nowhere>
References: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 30, 2010 at 04:35:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100429:
> 
> Dropped trees: tmio-mmc (long unresolved conflicts and unable to fetch)
> 	hwlat (at the maintainer's request)
> 
> My fixes tree contains:
> 	a patch for a pktcdvd build error from Arnd Bergmann
> 
> The v4l-dvb tree still has its build failure, so I used the version from
> next-20100409.
> 
> The block tree lost a conflict and its build failure but gained another
> conflict against the ext3 tree.
> 
> The bk-ioctl tree still has its build failure so I used the version from
> next-20100428.


That looks weird, I fixed all the reported conflicts and build error you
reported. Or may be there are some others left that I missed in allyesconfig?

Thanks.
