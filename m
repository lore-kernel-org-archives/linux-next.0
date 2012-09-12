From: Stephen Warren <swarren@nvidia.com>
Subject: RE: linux-next: manual merge of the tegra tree with the  tree
Date: Wed, 12 Sep 2012 09:14:24 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17EF013AC6@HQMAIL01.nvidia.com>
References: <20120912164353.6fb8b35ff534088a79792acd@canb.auug.org.au>
 <20120912161219.GB7273@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate04.nvidia.com ([216.228.121.35]:16435 "EHLO
	hqemgate04.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab2ILQPA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Sep 2012 12:15:00 -0400
In-Reply-To: <20120912161219.GB7273@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Felipe Balbi <balbi@ti.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Will Deacon <will.deacon@arm.com>

Greg KH wrote at Wednesday, September 12, 2012 10:12 AM:
> On Wed, Sep 12, 2012 at 04:43:53PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the tegra tree got a conflict in
> > arch/arm/mach-tegra/devices.c arch/arm/mach-tegra/devices.h between
> > commits 2db4ddfe6e23 ("ARM: pmu: remove arm_pmu_type enumeration") from
> > the arm-perf tree and 1ba8216f0bc0 ("usb: move phy driver from mach-tegra
> > to drivers/usb") from the usb tree and commit ba07ee57d4bc ("ARM: tegra:
> > remove dead code") from the tegra tree.
> >
> > The latter removed the files, so I did that (no action is required).
> 
> Stephen (Warren that is), should be fixing this up in his tree soon, as
> he will be including the same patchset that caused this problem in his
> tree to resolve this.

This issue is something else; the issue we've been discussing doesn't 
cause any merge conflict in linux-next, but rather causes a build failure
once the two trees are merged together (due to a new #include of a file
that got renamed elsewhere). I've already re-generated my for-next to
avoid that issue in tomorrow's linux-next.

-- 
nvpublic
