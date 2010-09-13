From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Mon, 13 Sep 2010 15:59:15 +0200
Message-ID: <20100913135915.GI2555@sortiz-mobl>
References: <20100913115404.cfbe7182.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100913115404.cfbe7182.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Hannemann <arnd@arndnet.de>, Paul Mundt <lethal@linux-sh.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, Sep 13, 2010 at 11:54:04AM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next merge of the mfd tree got a conflict in
> arch/arm/mach-shmobile/board-ap4evb.c between commit
> 410d878bd05315a19894b8b4685107f2cd0712a5 ("ARM: mach-shmobile: ap4evb:
> fix write protect for SDHI1") from Linus' tree and commit
> c3cfb4003377a3397b27de0efe910c9abd838ac3 ("ARM: mach-shmobile: ap4evb:
> Fix hotplug for SDHI1") from the mfd tree.
The conflict should be merged by now. Thanks for the warning.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
