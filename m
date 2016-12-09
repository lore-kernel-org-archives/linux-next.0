From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Fri, 9 Dec 2016 13:32:56 +1100
Message-ID: <20161209133256.7e8a5ead@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Mark,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/spi/spi-orion.c: In function 'orion_spi_baudrate_set':
drivers/spi/spi-orion.c:192:8: error: 'sspr' undeclared (first use in this function)
    if (sspr > 7)
        ^

Caused by commit

  d9fc6452af47 ("spi: mvebu: fix baudrate calculation for armada variants")

I have used the spi tree from next-20161208 for today.

-- 
Cheers,
Stephen Rothwell
