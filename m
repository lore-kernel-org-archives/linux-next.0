From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the drm tree
Date: Wed, 20 May 2015 20:51:27 +0100
Message-ID: <20150520195127.GV2067@n2100.arm.linux.org.uk>
References: <20150520163156.004a883c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:60509 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090AbbETTvg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 15:51:36 -0400
Content-Disposition: inline
In-Reply-To: <20150520163156.004a883c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 20, 2015 at 04:31:56PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/gpu/drm/i2c/tda998x_drv.c: In function 'tda998x_write_avi':
> drivers/gpu/drm/i2c/tda998x_drv.c:647:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t' [-Wformat=]
>    dev_err(&priv->hdmi->dev, "hdmi_avi_infoframe_pack() failed: %d\n", len);
>    ^
> 
> Introduced by commit 8c7a075da9f7 ("drm/i2c: tda998x: use drm_hdmi_avi_infoframe_from_display_mode()").

Thanks, I'll test a fix tonight and send it along in the next few days.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
