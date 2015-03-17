From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the irqchip tree with the tegra tree
Date: Tue, 17 Mar 2015 13:21:29 +0000
Message-ID: <20150317132129.GB3368@io.lakedaemon.net>
References: <20150316145508.62cad7d0@canb.auug.org.au>
 <20150316100457.GF30817@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150316100457.GF30817@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bob Mottram <bob.mottram@codethink.co.uk>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 16, 2015 at 11:04:58AM +0100, Thierry Reding wrote:
> On Mon, Mar 16, 2015 at 02:55:08PM +1100, Stephen Rothwell wrote:
> > * PGP Signed by an unknown key
> > 
> > Hi Jason,
> > 
> > Today's linux-next merge of the irqchip tree got a conflict in
> > arch/arm/mach-tegra/irq.c between commit 0a63e1e0617f ("ARM: tegra: Fix
> > big-endian issue with IRQ code") from the tegra tree and commit
> > 1a703bffd82e ("ARM: tegra: remove old LIC support") from the irqchip
> > tree.
> > 
> > I fixed it up (the latter removed the code changed by the former) and
> > can carry the fix as necessary (no action is required).
> 
> Hi Jason,
> 
> There's a chance that we might get a couple of other patches for Tegra
> that conflict with this series. Would you be able to provide a stable
> branch that I can pull into the Tegra tree to resolve those.

  git://git.infradead.org/users/jcooper/linux.git irqchip/stacked-tegra

is now stable.  It's based on v4.0-rc1 and only contains this series.

thx,

Jason.
