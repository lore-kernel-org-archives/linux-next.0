From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 0/2] iio: adc: stm32-dfsdm: fix build dependencies
Date: Mon, 15 Apr 2019 15:00:49 +0200
Message-ID: <1555333251-4422-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, rdunlap@infradead.org
Cc: sfr@canb.auug.org.au, benjamin.gaignard@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com, olivier.moysan@st.com
List-Id: linux-next.vger.kernel.org

This series fixes two build dependencies:
- IIO_BUFFER needs to be selected along with IIO_BUFFER_HW_CONSUMER
- IIO_TRIGGERED_BUFFER needs to be selected now that it supports triggered
  buffer mode.

Fabrice Gasnier (2):
  iio: adc: stm32-dfsdm: fix unmet direct dependencies detected
  iio: adc: stm32-dfsdm: fix triggered buffer build dependency

 drivers/iio/adc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4
