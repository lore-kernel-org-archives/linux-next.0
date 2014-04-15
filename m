From: Harini Katakam <harini.katakam@xilinx.com>
Subject: RE: linux-next: build failure after merge of the spi tree
Date: Tue, 15 Apr 2014 04:35:54 +0000
Message-ID: <77441af4-d070-4056-ae5d-ccfc945d9b1d@CH1EHSMHS018.ehs.local>
References: <20140415121703.055d54d52e9d2d325e9987f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140415121703.055d54d52e9d2d325e9987f0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "harinikatakamlinux@gmail.com" <harinikatakamlinux@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen/Mark,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, April 15, 2014 7:47 AM
> To: Mark Brown
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Harini
> Katakam
> Subject: linux-next: build failure after merge of the spi tree
> 
> Hi Mark,
> 
> After merging the spi tree, today's linux-next build (x86_64_allmodconfig)
> failed like this:
> 
> drivers/spi/spi-cadence.c: In function 'cdns_spi_write':
> drivers/spi/spi-cadence.c:135:2: error: implicit declaration of function
> 'writel_relaxed' [-Werror=implicit-function-declaration]
>   writel_relaxed(val, xspi->regs + offset);
>   ^
> 

I'm sorry - I just noticed that Soren's patches for I2C also gave a similar warning:
http://patchwork.ozlabs.org/patch/337285/

I will send a patch adding dependency on ARCH_ZYNQ.
Please let me know if you have a better suggestion.

Regards,
Harini
