From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tegra tree with the  tree
Date: Wed, 12 Sep 2012 09:12:19 -0700
Message-ID: <20120912161219.GB7273@kroah.com>
References: <20120912164353.6fb8b35ff534088a79792acd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120912164353.6fb8b35ff534088a79792acd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>, Felipe Balbi <balbi@ti.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 12, 2012 at 04:43:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tegra tree got a conflict in
> arch/arm/mach-tegra/devices.c arch/arm/mach-tegra/devices.h between
> commits 2db4ddfe6e23 ("ARM: pmu: remove arm_pmu_type enumeration") from
> the arm-perf tree and 1ba8216f0bc0 ("usb: move phy driver from mach-tegra
> to drivers/usb") from the usb tree and commit ba07ee57d4bc ("ARM: tegra:
> remove dead code") from the tegra tree.
> 
> The latter removed the files, so I did that (no action is required).

Stephen (Warren that is), should be fixing this up in his tree soon, as
he will be including the same patchset that caused this problem in his
tree to resolve this.

thanks,

greg k-h
