From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 18 (drm drivers and vgacon)
Date: Fri, 18 May 2012 18:02:13 -0700
Message-ID: <4FB6F115.70703@xenotime.net>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:57116 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S965436Ab2ESBCH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 May 2012 21:02:07 -0400
In-Reply-To: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On 05/18/2012 01:49 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 201205017:


When CONFIG_VGA_CONSOLE is not enabled:

drivers/gpu/drm/cirrus/cirrus_drv.c:87:2: error: implicit declaration of function 'vgacon_text_force'
drivers/gpu/drm/ast/ast_drv.c:224:2: error: implicit declaration of function 'vgacon_text_force'
drivers/gpu/drm/mgag200/mgag200_drv.c:96:2: error: implicit declaration of function 'vgacon_text_force'


-- 
~Randy
