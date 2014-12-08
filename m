From: Laurentiu Palcu <laurentiu.palcu@intel.com>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Mon, 8 Dec 2014 15:56:38 +0200
Message-ID: <20141208135638.GG15450@lpalcu-linux>
References: <20141208230517.13ebfe4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141208230517.13ebfe4f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 08, 2014 at 11:05:17PM +1100, Stephen Rothwell wrote:
> Hi Mark,
> 
> After merging the spi tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/spi/spi-dln2.c: In function 'dln2_spi_copy_from_buf':
> drivers/spi/spi-dln2.c:415:4: error: implicit declaration of function 'get_unaligned_le32' [-Werror=implicit-function-declaration]
>     *d++ = get_unaligned_le32(s++);
>     ^
> 
> Caused by commit ffb9ad0a47b4 ("spi: add support for DLN-2 USB-SPI adapter").

Re-sent the patch with the asm/unaligned.h header included and I build tested
for PPC to make sure.

Sorry for the trouble... :/
laurentiu
