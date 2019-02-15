From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] misc: fastrpc: minor fixes.
Date: Fri, 15 Feb 2019 10:40:05 +0000
Message-ID: <20190215104007.27103-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

Here are two minor fixes, one to fix build error on x86 platforms
which do not have CONFIG_DMA_SHARED_BUFFER selected,
and other is to hanle possiblity of running out of compute
context banks.

Thanks,
srini

Srinivas Kandagatla (1):
  misc: fastrpc: select CONFIG_DMA_SHARED_BUFFER

Thierry Escande (1):
  misc: fastrpc: Fix device_open when no session is available

 drivers/misc/Kconfig   |  1 +
 drivers/misc/fastrpc.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.20.1
