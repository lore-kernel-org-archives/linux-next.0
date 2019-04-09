From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Apr 9
Date: Tue, 9 Apr 2019 11:25:24 -0700
Message-ID: <20190409182524.GA18518@roeck-us.net>
References: <20190409180042.15bb90b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409180042.15bb90b6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, "J. Bruce Fields" <bfields@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 09, 2019 at 06:00:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190408:
> 
> The mac80211-next tree gained a conflict against the mac80211 tree.
> 
> The drm tree still had its build failure for which I disabled a driver.
> 
> The drm-misc tree gained conflicts against the drm tree and also a build
> failure for which I marked a driver as BROKEN.
> 
> The scsi-mkp tree gained a build failure for which I reverted a commit.
> 
> The rtc tree gained a conflict against the omap tree.
> 
> Non-merge commits (relative to Linus' tree): 5587
>  5386 files changed, 176906 insertions(+), 87493 deletions(-)
> 

This one deserves a reply.

Build results:
	total: 159 pass: 144 fail: 15
Failed builds: 
	<many>
Qemu test results:
	total: 345 pass: 227 fail: 118
Failed tests: 
	<many>

Build failure is:

s/nfsd/nfssvc.c: In function 'nfsd_support_acl_version':
fs/nfsd/nfssvc.c:145:14: error: 'NFSD_ACL_MINVERS' undeclared

and similar. Build failures and (many ? most ? all ?) of the qemu failures
are due to commit 55d4c716ea ("nfsd: Add custom rpcbind callbacks for
knfsd").

Guenter
