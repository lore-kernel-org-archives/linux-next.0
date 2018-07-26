From: "Agrawal, Akshu" <Akshu.Agrawal@amd.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 26 Jul 2018 11:28:24 +0530
Message-ID: <ebe278ff-becc-429f-f72b-3d1b6d9698a5@amd.com>
References: <20180726121942.0ab69aac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726121942.0ab69aac@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 7/26/2018 7:49 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> sound/soc/amd/acp-da7219-max98357a.c: In function 'cz_probe':
> sound/soc/amd/acp-da7219-max98357a.c:367:3: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    dev_err(&pdev->dev, "Failed to register regulator: %d\n",
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     ret);
>     ~~~~
> 
> Introduced by commit
> 
>   7b5317aa809f ("ASoC: AMD: Add a fix voltage regulator for DA7219 and ADAU7002")
> 
> This is a real bug.
> 
Posted the fix for the above warning message:
https://patchwork.kernel.org/patch/10545235/

Thanks,
Akshu
