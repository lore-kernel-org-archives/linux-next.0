From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 27 Apr 2017 07:57:01 +0530
Message-ID: <20170427022701.GI6263@localhost>
References: <20170427112920.3c51a6e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170427112920.3c51a6e0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, G Kranthi <gudishax.kranthikumar@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 27, 2017 at 11:29:20AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> sound/soc/intel/skylake/bxt-sst.c: In function 'bxt_sst_dsp_init':
> sound/soc/intel/skylake/bxt-sst.c:567:14: warning: 'skl' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    dev_err(skl->dev, "%s: no device\n", __func__);
>               ^
> 

Yeah looks like that is the case, fortunately fix is quite simple, I will
send out soon

Thanks for reporting

> Introduced by commit
> 
>   9fe9c7119283 ("ASoC: Intel: Skylake: Move sst common initialization to a helper function")
> 
> This looks like an actual bug ...
> 
> -- 
> Cheers,
> Stephen Rothwell

-- 
~Vinod
