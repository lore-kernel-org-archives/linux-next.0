From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for December 12 (drm)
Date: Fri, 12 Dec 2008 20:55:54 -0800
Message-ID: <4943405A.4080009@xenotime.net>
References: <20081212185654.0af8b4a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:43001 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754127AbYLMEzy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2008 23:55:54 -0500
Received: from ::ffff:71.117.247.66 ([71.117.247.66]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 12 Dec 2008 20:55:52 -0800
In-Reply-To: <20081212185654.0af8b4a1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jesse.barnes@intel.com, airlied@linux.ie

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081211:
> 
> Undropped tree:
> 	drm

oops    ^^^


When I2C=n, and drm is built-in or modular, this build error
happens:

(drm built-in:)

build-r7079.out:(.text+0x47e5f): undefined reference to `i2c_transfer'
7080	same
7086	same
7089	same
(from gpu/drm/drm_edid.c)


(drm modular:)

build-r7103.out:ERROR: "i2c_transfer" [drivers/gpu/drm/drm.ko] undefined!
(from gpu/drm/drm_edid.c)


~Randy
