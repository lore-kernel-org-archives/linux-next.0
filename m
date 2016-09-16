From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Fri, 16 Sep 2016 09:34:44 +0100
Message-ID: <20160916083444.GA4730@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20160916131834.1ecb0eeb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160916131834.1ecb0eeb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Vinod & Stephen,

On Fri, 16 Sep 2016, Stephen Rothwell wrote:

> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (arm
> multi_v7_defconfig build) failed like this:

FYI Patch 17 of 19 in the fdma series "drm/virtio: kconfig: Fix recursive dependency
issue." [1], fixes this issue. It looks like that hasn't been applied. I should have
made it clearer that this was a depedency (and the other white drm/kconfig white
space fixup obviously isn't).

https://lkml.org/lkml/2016/9/5/328

regards,

Peter.
