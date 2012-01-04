From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the  arm
 tree
Date: Wed, 4 Jan 2012 15:08:31 -0800
Message-ID: <20120104230831.GH24583@kroah.com>
References: <20111228163545.7034aa9b783d46ac4b46c545@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228163545.7034aa9b783d46ac4b46c545@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 28, 2011 at 04:35:45PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/arm/mach-s5pv210/common.c between commit 37775320458e ("ARM: 7252/1:
> restart: S5PV210: use new restart hook") from the arm tree and commit
> 4a858cfc9af8 ("arm: convert sysdev_class to a regular subsystem") from
> the driver-core tree (where it is called arch/arm/mach-s5pv210/cpu.c).
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good, thanks.

greg k-h
