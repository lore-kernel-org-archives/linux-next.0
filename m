From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
Date: Thu, 17 Jan 2019 08:36:58 +0800
Message-ID: <20190117003655.GA19069@dragon>
References: <20190117075459.50e6a22f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117075459.50e6a22f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 17, 2019 at 07:54:59AM +1100, Stephen Rothwell wrote:
> Hi Shawn,
> 
> Commit
> 
>   fde7ed930ca2 ("arm64: dts: imx8qxp: Fix MU4_INT number")
> 
> has a malformed Fixes tag.
> 
> The SHA1 should be at least 12 digits long.

Fixed.  Thanks for spotting it, Stephen.

Shawn
