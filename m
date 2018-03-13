From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 13 Mar 2018 08:52:12 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A0337014C1D9561@SW-EX-MBX01.diasemi.com>
References: <20180313170922.2fa1ea99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313170922.2fa1ea99@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
List-Id: linux-next.vger.kernel.org

On 13 March 2018 06:09, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> sound/soc/codecs/da7219.o: In function `.da7219_remove':
> da7219.c:(.text+0xcbc): undefined reference to `.clkdev_drop'
> 
> Caused by commit
> 
>   fc8f7ea2d6c0 ("ASoC: da7219: Add common clock usage for providing DAI clks")
> 
> CONFIG_CLKDEV_LOOKUP is not set for this build.
> 
> I have reverted that commit for today.

My bad. Apologies for this. :(

Mark, I'll send a follow up patch to fix this ASAP.
