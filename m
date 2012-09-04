From: Jerry Snitselaar <dev@snitselaar.org>
Subject: linux-next for Sept 4, recursive dependency detected
Date: Tue, 4 Sep 2012 03:28:33 -0700
Message-ID: <20120904102833.GA7095@cantor.Home>
Reply-To: Jerry Snitselaar <dev@snitselaar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48614 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253Ab2IDK2i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 06:28:38 -0400
Received: by pbbrr13 with SMTP id rr13so9270217pbb.19
        for <linux-next@vger.kernel.org>; Tue, 04 Sep 2012 03:28:37 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

make allyesconfig gives the following output:

Switched to a new branch 'next'
snits@cantor:~/dev/uek=>make allyesconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --allyesconfig Kconfig
drivers/gpu/drm/udl/Kconfig:1:error: recursive dependency detected!
drivers/gpu/drm/udl/Kconfig:1:	     symbol DRM_UDL depends on USB_ARCH_HAS_HCD
drivers/usb/Kconfig:76:		     symbol USB_ARCH_HAS_HCD depends on USB_SUPPORT
drivers/usb/Kconfig:58:		     symbol USB_SUPPORT is selected by DRM_USB
drivers/gpu/drm/Kconfig:22:	     symbol DRM_USB is selected by DRM_UDL
#
# configuration written to .config
#
