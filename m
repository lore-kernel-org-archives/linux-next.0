From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 28
Date: Fri, 28 Aug 2015 08:24:41 -0700
Message-ID: <20150828152441.GA8179@roeck-us.net>
References: <20150828182712.3d45a033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150828182712.3d45a033@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 28, 2015 at 06:27:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150827:
> 
> The rdma tree gained a conflict aaginst the net-next tree.
> 
> The sound-asoc tree gained a build failure for which I reverted a commit.
> 
> The mmc-uh tree lost its build failure.
> 
> The tty tree still had its build failure for which I reverted part of
> a commit.
> 
> The nvdimm tree gained conflicts against Linus' and the v4l-dvb trees.
> 
> Non-merge commits (relative to Linus' tree): 10211
>  8743 files changed, 533186 insertions(+), 210999 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Time for a status report. We might see at least some of the following
failures in mainline after the commit window closes.

Build results:
	total: 145 pass: 138 fail: 7
Failed builds:
	alpha:allmodconfig [1], [2]
	arm:rpc_defconfig [3]
	mips:nlm_xlp_defconfig [4]
	s390:allmodconfig [5]
	xtensa:defconfig [6]
	xtensa:allmodconfig [6]
	xtensa:allnoconfig [6]
Qemu test results:
	total: 85 pass: 80 fail: 5
Failed tests:
	mips:fuloong2e_defconfig [7]
	xtensa:dc232b:lx60:xtensa_defconfig [6]
	xtensa:dc232b:kc705:xtensa_defconfig [6]
	xtensa:dc233c:ml605:generic_kc705_defconfig [6]
	xtensa:dc233c:kc705:generic_kc705_defconfig [6]

Guenter

---
[1] new, introduced by "libnvdimm, pfn: 'struct page' provider infrastructure"
[2] https://lkml.org/lkml/2015/7/31/1373
[3] https://lkml.org/lkml/2015/8/26/462
[4] http://patchwork.linux-mips.org/patch/11054/
[5] https://lkml.org/lkml/2015/8/26/744
[6] https://lkml.org/lkml/2015/8/26/118
[7] http://patchwork.linux-mips.org/patch/10896/
