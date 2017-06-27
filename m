From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rpmsg tree
Date: Tue, 27 Jun 2017 14:43:39 +1000
Message-ID: <20170627144339.614f7236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36643 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750829AbdF0Enm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 00:43:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>

Hi Bjorn,

After merging the rpmsg tree, today's linux-next build
(arm_multi_v7_defconfig) produced this warning:

drivers/i2c/Kconfig:7:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/i2c/Kconfig:7:	symbol I2C is selected by FB_DDC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:63:	symbol FB_DDC is selected by FB_CYBER2000_DDC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:390:	symbol FB_CYBER2000_DDC depends on FB_CYBER2000
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:378:	symbol FB_CYBER2000 depends on FB
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELPER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:72:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:66:	symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/virtio/Kconfig:1:	symbol DRM_VIRTIO_GPU depends on VIRTIO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/virtio/Kconfig:1:	symbol VIRTIO is selected by RPMSG_VIRTIO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/rpmsg/Kconfig:35:	symbol RPMSG_VIRTIO is selected by KEYSTONE_REMOTEPROC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:74:	symbol KEYSTONE_REMOTEPROC depends on RESET_CONTROLLER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/reset/Kconfig:4:	symbol RESET_CONTROLLER is selected by QCOM_SCM
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/firmware/Kconfig:205:	symbol QCOM_SCM is selected by VIDEO_QCOM_VENUS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/media/platform/Kconfig:474:	symbol VIDEO_QCOM_VENUS depends on V4L_MEM2MEM_DRIVERS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/media/platform/Kconfig:162:	symbol V4L_MEM2MEM_DRIVERS depends on VIDEO_V4L2
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/media/v4l2-core/Kconfig:6:	symbol VIDEO_V4L2 depends on I2C

and more ...

Probably introduced by commit

  e88bb8f7a12c ("remoteproc/keystone: Add a remoteproc driver for Keystone 2 DSPs")

-- 
Cheers,
Stephen Rothwell
