From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Thu, 17 Aug 2017 10:57:43 -0700
Message-ID: <20170817175743.GA5980@kroah.com>
References: <20170731150227.58ea271b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52357 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753449AbdHQR5n (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Aug 2017 13:57:43 -0400
Content-Disposition: inline
In-Reply-To: <20170731150227.58ea271b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, JB Van Puyvelde <jbvanpuyvelde@gmail.com>

On Mon, Jul 31, 2017 at 03:02:27PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/staging/media/atomisp/i2c/imx/imx.c:1087:12: warning: 'imx_vcm_power_up' defined but not used [-Wunused-function]
>  static int imx_vcm_power_up(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1095:12: warning: 'imx_vcm_power_down' defined but not used [-Wunused-function]
>  static int imx_vcm_power_down(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1103:12: warning: 'imx_vcm_init' defined but not used [-Wunused-function]
>  static int imx_vcm_init(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1111:12: warning: 'imx_t_focus_vcm' defined but not used [-Wunused-function]
>  static int imx_t_focus_vcm(struct v4l2_subdev *sd, u16 val)
>             ^
> 
> Introduced by commit
> 
>   9a5a6911aa3f ("staging: imx: fix non-static declarations")

Sorry for the delay, now dropped from my tree, I shouldn't have taken it
in the first place :(

greg k-h
