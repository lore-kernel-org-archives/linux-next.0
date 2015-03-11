From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 11 (arm:multi_v5_defconfig build
 failure)
Date: Wed, 11 Mar 2015 08:55:48 -0700
Message-ID: <20150311155548.GB22446@roeck-us.net>
References: <20150311163558.6a09cfcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150311163558.6a09cfcc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Guinot <simon.guinot@sequanux.org>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150310:
> 
> New tree: drm-exynos
> 
> The sound-asoc tree still had its build failure so I used the version from
> next-20150306.
> 
> The regulator tree lost its build failure.
> 
> The tip tree gained a conflict against the usb-gadget-fixes tree.
> 
> The staging tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 3446
>  3448 files changed, 138744 insertions(+), 73083 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Building arm:multi_v5_defconfig ... failed
--------------
Error log:
arch/arm/boot/dts/kirkwood-nas2big.dts:15:43: fatal error:
	dt-bindings/leds/leds-netxbig.h: No such file or directory
 #include <dt-bindings/leds/leds-netxbig.h>

Caused by commit a9e58557e99 ("ARM: Kirkwood: add DT description for nas2big").
Yes, that file doesn't exist.

Guenter
