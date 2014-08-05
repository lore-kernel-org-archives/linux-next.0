From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failures after merge of the drm tree
Date: Tue, 5 Aug 2014 05:20:25 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1408050519270.22643@skynet.skynet.ie>
References: <20140805130926.4e8c8fe5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140805130926.4e8c8fe5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Wood <thomas.wood@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Russell King <rmk+kernel@arm.linux.org.uk>, YoungJun Cho <yj44.cho@samsung.com>, Inki Dae <daeinki@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-next.vger.kernel.org


> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "drm_sysfs_connector_remove" [drivers/gpu/drm/i2c/tda998x.ko] undefined!
> ERROR: "drm_sysfs_connector_add" [drivers/gpu/drm/i2c/tda998x.ko] undefined!
> 

I've fixed this, caught it myself a few mins after push,

The other I'm not sure about, I'll hope the exynos guys know what is going 
on.

Thanks,
Dave.
