From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 11 May 2016 09:08:14 +0530
Message-ID: <20160511033814.GO2274@localhost>
References: <20160511110702.7ed8b139@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:57993 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751768AbcEKDcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 May 2016 23:32:07 -0400
Content-Disposition: inline
In-Reply-To: <20160511110702.7ed8b139@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ramesh Babu <ramesh.babu@intel.com>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, Mengdong Lin <mengdong.lin@linux.intel.com>

On Wed, May 11, 2016 at 11:07:02AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/soc/intel/boards/bxt_rt298.c:257:3: error: unknown field 'be_id' specified in initializer
>    .be_id = 0,
>    ^
> sound/soc/intel/boards/bxt_rt298.c:274:3: error: unknown field 'be_id' specified in initializer
>    .be_id = 1,
>    ^
> sound/soc/intel/boards/bxt_rt298.c:274:12: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>    .be_id = 1,
>             ^
> sound/soc/intel/boards/bxt_rt298.c:274:12: note: (near initialization for 'broxton_rt298_dais[7].stream_name')
> sound/soc/intel/boards/bxt_rt298.c:285:3: error: unknown field 'be_id' specified in initializer
>    .be_id = 3,
>    ^
> sound/soc/intel/boards/bxt_rt298.c:285:12: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>    .be_id = 3,
>             ^
> sound/soc/intel/boards/bxt_rt298.c:285:12: note: (near initialization for 'broxton_rt298_dais[8].stream_name')
> sound/soc/intel/boards/bxt_rt298.c:296:3: error: unknown field 'be_id' specified in initializer 
>    .be_id = 4,
>    ^
> sound/soc/intel/boards/bxt_rt298.c:296:12: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>    .be_id = 4,
>             ^
> sound/soc/intel/boards/bxt_rt298.c:296:12: note: (near initialization for 'broxton_rt298_dais[9].stream_name')
> sound/soc/intel/boards/bxt_rt298.c:307:3: error: unknown field 'be_id' specified in initializer 
>    .be_id = 5,
>    ^
> sound/soc/intel/boards/bxt_rt298.c:307:12: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>    .be_id = 5,
>             ^
> 
> Caused by commit
> 
>   76016322ec56 ("ASoC: Intel: Add Broxton-P machine driver")
> 
> interacting with commit
> 
>   2f0ad49104cb ("ASoC: Change DAI link's be_id to a generic id")

My bad, patch was generated against topic/intel of Mark's tree and I should
have checked the -next branch as well

> 
> I applied the following fix patch that should have happened in the
> merge commit
> 
>   8554363b9f0f ("Merge remote-tracking branches 'asoc/topic/dai-link', 'asoc/topic/davinci', 'asoc/topic/dwc' and 'asoc/topic/es8328' into asoc-next")
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 11 May 2016 11:03:25 +1000
> Subject: [PATCH] ASoC: Intel: fix up for DAI link's be_id change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Vinod Koul <vinod.koul@intel.com>

I guess Mark you will merge this as well?


> ---
>  sound/soc/intel/boards/bxt_rt298.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
> index 1b845ff779f3..f4787515c0ed 100644
> --- a/sound/soc/intel/boards/bxt_rt298.c
> +++ b/sound/soc/intel/boards/bxt_rt298.c
> @@ -254,7 +254,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
>  	{
>  		/* SSP5 - Codec */
>  		.name = "SSP5-Codec",
> -		.be_id = 0,
> +		.id = 0,
>  		.cpu_dai_name = "SSP5 Pin",
>  		.platform_name = "0000:00:0e.0",
>  		.no_pcm = 1,
> @@ -271,7 +271,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
>  	},
>  	{
>  		.name = "dmic01",
> -		.be_id = 1,
> +		.id = 1,
>  		.cpu_dai_name = "DMIC01 Pin",
>  		.codec_name = "dmic-codec",
>  		.codec_dai_name = "dmic-hifi",
> @@ -282,7 +282,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
>  	},
>  	{
>  		.name = "iDisp1",
> -		.be_id = 3,
> +		.id = 3,
>  		.cpu_dai_name = "iDisp1 Pin",
>  		.codec_name = "ehdaudio0D2",
>  		.codec_dai_name = "intel-hdmi-hifi1",
> @@ -293,7 +293,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
>  	},
>  	{
>  		.name = "iDisp2",
> -		.be_id = 4,
> +		.id = 4,
>  		.cpu_dai_name = "iDisp2 Pin",
>  		.codec_name = "ehdaudio0D2",
>  		.codec_dai_name = "intel-hdmi-hifi2",
> @@ -304,7 +304,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
>  	},
>  	{
>  		.name = "iDisp3",
> -		.be_id = 5,
> +		.id = 5,
>  		.cpu_dai_name = "iDisp3 Pin",
>  		.codec_name = "ehdaudio0D2",
>  		.codec_dai_name = "intel-hdmi-hifi3",
> -- 
> 2.7.0
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks
-- 
~Vinod
