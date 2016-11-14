From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 14 Nov 2016 09:45:14 +0000
Message-ID: <1479116714.18450.11.camel@rf-debian.wolfsonmicro.main>
References: <20161114112801.46392f36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161114112801.46392f36@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Yes, it's because Mark applied a chain of patches but missed the first
patch in the chain that added the wm_coeff_base_reg() function

On Mon, 2016-11-14 at 11:28 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/soc/codecs/wm_adsp.c: In function 'wm_coeff_write_acked_control':
> sound/soc/codecs/wm_adsp.c:791:8: error: implicit declaration of function 'wm_coeff_base_reg' [-Werror=implicit-function-declaration]
>   ret = wm_coeff_base_reg(ctl, &reg);
>         ^
> 
> Caused by commit
> 
>   f4f0c4c60c39 ("ASoC: wm_adsp: Signal firmware shutdown through event control")
> 
> I have used the sound-asoc tree from next-20161111 for today.
> 
