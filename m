From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 25 Apr 2019 20:14:13 -0700
Message-ID: <20190426031413.GA2572@Asurada-CZ80>
References: <20190426130549.59f7e604@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426130549.59f7e604@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2019 at 01:05:49PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> sound/soc/fsl/fsl_sai.c: In function 'fsl_sai_remove':
> sound/soc/fsl/fsl_sai.c:921:1: warning: no return statement in function returning non-void [-Wreturn-type]
>  }
>  ^
> 
> Introduced by commit
> 
>   812ad463e089 ("ASoC: fsl_sai: Add support for runtime pm")

Thanks. I am submitting a fix.
