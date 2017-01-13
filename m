From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Fri, 13 Jan 2017 14:18:09 +1100
Message-ID: <20170113141809.4784c004@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from drivers/rtc/rtc-stm32.c:14:0:
drivers/rtc/rtc-stm32.c: In function 'stm32_rtc_probe':
drivers/rtc/rtc-stm32.c:653:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
  regmap_update_bits(rtc->dbp, PWR_CR, PWR_CR_DBP, ~PWR_CR_DBP);
                                                   ^
include/linux/regmap.h:73:42: note: in definition of macro 'regmap_update_bits'
  regmap_update_bits_base(map, reg, mask, val, NULL, false, false)
                                          ^
drivers/rtc/rtc-stm32.c: In function 'stm32_rtc_remove':
drivers/rtc/rtc-stm32.c:675:51: warning: large integer implicitly truncated to unsigned type [-Woverflow]
  regmap_update_bits(rtc->dbp, PWR_CR, PWR_CR_DBP, ~PWR_CR_DBP);
                                                   ^
include/linux/regmap.h:73:42: note: in definition of macro 'regmap_update_bits'
  regmap_update_bits_base(map, reg, mask, val, NULL, false, false)
                                          ^

Introduced by commit

  4e64350f42e2 ("rtc: add STM32 RTC driver")

-- 
Cheers,
Stephen Rothwell
