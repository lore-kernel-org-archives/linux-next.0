From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH] fbdev: matroxfb: Fix compilation after fb_var_screeninfo
 change
Date: Wed, 21 Dec 2011 21:44:41 +0000
Message-ID: <4EF25349.1090002@gmx.de>
References: <1324407611-6886-1-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:45777 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754265Ab1LUVoq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Dec 2011 16:44:46 -0500
In-Reply-To: <1324407611-6886-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/20/2011 07:00 PM, Laurent Pinchart wrote:
> Commit fb21c2f42879 ("fbdev: Add FOURCC-based format configuration API")
> modified the layout of the fb_var_screeninfo structure. Remove zero
> fields from the static initializers in the matroxfb driver accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied.


Thanks,

Florian Tobias Schandinat

> ---
>  drivers/video/matrox/matroxfb_base.c  |    1 -
>  drivers/video/matrox/matroxfb_crtc2.c |    1 -
>  2 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/matrox/matroxfb_base.c b/drivers/video/matrox/matroxfb_base.c
> index 44bf8d4..401a56e 100644
> --- a/drivers/video/matrox/matroxfb_base.c
> +++ b/drivers/video/matrox/matroxfb_base.c
> @@ -147,7 +147,6 @@ static struct fb_var_screeninfo vesafb_defined = {
>  	39721L,48L,16L,33L,10L,
>  	96L,2L,~0,	/* No sync info */
>  	FB_VMODE_NONINTERLACED,
> -	0, {0,0,0,0,0}
>  };
>  
>  
> diff --git a/drivers/video/matrox/matroxfb_crtc2.c b/drivers/video/matrox/matroxfb_crtc2.c
> index d7112c3..02796a4 100644
> --- a/drivers/video/matrox/matroxfb_crtc2.c
> +++ b/drivers/video/matrox/matroxfb_crtc2.c
> @@ -593,7 +593,6 @@ static struct fb_var_screeninfo matroxfb_dh_defined = {
>  		39721L,48L,16L,33L,10L,
>  		96L,2,0,	/* no sync info */
>  		FB_VMODE_NONINTERLACED,
> -		0, {0,0,0,0,0}
>  };
>  
>  static int matroxfb_dh_regit(const struct matrox_fb_info *minfo,
