From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
Date: Tue, 27 Jun 2017 16:47:57 -0700
Message-ID: <20170627234757.GO18666@tuxbook>
References: <20170627144339.614f7236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170627144339.614f7236@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
List-Id: linux-next.vger.kernel.org

On Mon 26 Jun 21:43 PDT 2017, Stephen Rothwell wrote:

> Hi Bjorn,
> 
> After merging the rpmsg tree, today's linux-next build
> (arm_multi_v7_defconfig) produced this warning:
> 
> drivers/i2c/Kconfig:7:error: recursive dependency detected!

Thanks Stephen, I've updated the branch to work around the two issues
you found.

Regards,
Bjorn
