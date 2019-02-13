From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 13 Feb 2019 11:35:25 +0100
Message-ID: <d5c9f73e-8a60-c268-87b2-1ca98e86bfb1@samsung.com>
References: <CGME20190213013212epcas5p436da6762dea86287ed3aea31ef2bb830@epcas5p4.samsung.com>
        <20190213123129.2961c236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190213123129.2961c236@canb.auug.org.au>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 2/13/19 02:31, Stephen Rothwell wrote:
> After merging the sound-asoc tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> sound/soc/samsung/i2s.c: In function 'samsung_i2s_remove':
> sound/soc/samsung/i2s.c:1469:27: warning: unused variable 'priv' [-Wunused-variable]
>   struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
                            ^~~~
> 
> Introduced by commit
> 
>   a404b72d2bdd ("ASoC: samsung: i2s: Convert to single component with multiple DAIs")

Thanks for the information. Due to my messed up rebase the line
quoted above ended up in the above mentioned commit instead of 
in the next on in the series, which has not yet been applied:

"ASoC: samsung: i2s: Restore support for the secondary PCM"

-- 
Regards
Sylwester
