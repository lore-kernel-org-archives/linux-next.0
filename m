From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Mon, 16 May 2016 12:08:31 +1000
Message-ID: <20160516120831.375203a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Roese <sr@denx.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/spi/spi-orion.c: In function 'orion_spi_write_read':
drivers/spi/spi-orion.c:407:3: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
   writesl(orion_spi->direct_access[cs].vaddr, xfer->tx_buf, cnt);
   ^
drivers/spi/spi-orion.c:411:4: error: implicit declaration of function 'writesb' [-Werror=implicit-function-declaration]
    writesb(orion_spi->direct_access[cs].vaddr, &buf[cnt],
    ^

Caused by commit

  dbf24b7c0d94 ("spi: orion: Add direct access mode")

I have merged the version fof the spi tree from next-20160513 for today.

-- 
Cheers,
Stephen Rothwell
