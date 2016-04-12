From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Wed, 13 Apr 2016 09:59:10 +1000
Message-ID: <20160413095910.43ee010b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Staring with Linus' tree, today's (and presumably previous) linux-next
build (arm multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/msm_drv.c: In function 'msm_preclose':
drivers/gpu/drm/msm/msm_drv.c:468:18: warning: unused variable 'kms' [-Wunused-variable]
  struct msm_kms *kms = priv->kms;
                  ^

Introduced by commit

  4016260ba47a ("rm/msm: fix bug after preclose removal")

merged into v4.6-rc2.

-- 
Cheers,
Stephen Rothwell
