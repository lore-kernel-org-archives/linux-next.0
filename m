From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Wed, 31 May 2017 12:23:32 +1000
Message-ID: <20170531122332.3f573f1d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/usb/typec/typec_wcove.c: In function 'wcove_typec_pr
obe':
drivers/usb/typec/typec_wcove.c:306:32: error: 'struct intel_soc_pmic' has no member named 'irq_chip_data_level2'
  ret = regmap_irq_get_virq(pmic->irq_chip_data_level2,
                                ^

Caused by commit

  aa32452e6ef9 ("mfd: intel_soc_pmic_bxtwc: Use chained irqs for second level irq chips")

interacting with commit

  d2061f9cc32d ("usb: typec: add driver for Intel Whiskey Cove PMIC USB Type-C PHY")

from Linus' tree (v4.12-rc1).  grep is your friend. :-)

I have used the mfd tree from next-20170530 for today.

-- 
Cheers,
Stephen Rothwell
