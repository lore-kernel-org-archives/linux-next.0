From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Wed, 6 Jan 2016 14:34:44 +1100
Message-ID: <20160106143444.273f4ee1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Sperl <kernel@martin.sperl.org>
List-Id: linux-next.vger.kernel.org

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/spi/spi-loopback-test.c: In function 'spi_loopback_test_probe':
drivers/spi/spi-loopback-test.c:292:7: error: 'check_rx_buf' undeclared (first use in this function)
  if (!check_rx_buf && (spi->master->mode_bits & SPI_LOOP)) {
       ^

Caused by commit

  b0632bfe5ec4 ("spi: loopback-test: added support for HW-loopback mode")

I have used the spi tree from next-20160105 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
