From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 12 Sep 2016 15:10:16 +1000
Message-ID: <20160912151016.4ce05e9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751677AbcILFKS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Sep 2016 01:10:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, Hans Verkuil <hans.verkuil@cisco.com>

Hi all,

After merging the dax-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/media/platform/soc_camera/built-in.o:(.opd+0x678): multiple definition of `soc_mbus_config_compatible'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x78): first defined here
drivers/media/platform/soc_camera/built-in.o:(.opd+0x630): multiple definition of `soc_mbus_image_size'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x30): first defined here
drivers/media/platform/soc_camera/built-in.o:(.opd+0x600): multiple definition of `soc_mbus_samples_per_pixel'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x0): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_bytes_per_line':
(.text+0x4d20): multiple definition of `.soc_mbus_bytes_per_line'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x120): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_get_fmtdesc':
(.text+0x4f90): multiple definition of `.soc_mbus_get_fmtdesc'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x390): first defined here
drivers/media/platform/soc_camera/built-in.o:(.opd+0x660): multiple definition of `soc_mbus_get_fmtdesc'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x60): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_image_size':
(.text+0x4e10): multiple definition of `.soc_mbus_image_size'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x210): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_samples_per_pixel':
(.text+0x4c00): multiple definition of `.soc_mbus_samples_per_pixel'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x0): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_config_compatible':
(.text+0x5030): multiple definition of `.soc_mbus_config_compatible'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x430): first defined here
drivers/media/platform/soc_camera/built-in.o: In function `.soc_mbus_find_fmtdesc':
(.text+0x4ec0): multiple definition of `.soc_mbus_find_fmtdesc'
drivers/media/platform/soc_camera/soc_mediabus.o:(.text+0x2c0): first defined here
drivers/media/platform/soc_camera/built-in.o:(.opd+0x648): multiple definition of `soc_mbus_find_fmtdesc'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x48): first defined here
drivers/media/platform/soc_camera/built-in.o:(.opd+0x618): multiple definition of `soc_mbus_bytes_per_line'
drivers/media/platform/soc_camera/soc_mediabus.o:(.opd+0x18): first defined here

Caused by commit

  4bb738f228b3 ("[media] media: platform: pxa_camera: move pxa_camera out of soc_camera")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
