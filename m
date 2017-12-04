From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 4 Dec 2017 12:50:45 +1100
Message-ID: <20171204125045.59e1a704@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751465AbdLDBus (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 20:50:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/adc/meson_saradc.c

between commit:

  d85eed9f5763 ("iio: adc: meson-saradc: initialize the bandgap correctly on older SoCs")

from the staging.current tree and commit:

  930df4d853a8 ("iio: adc: meson-saradc: remove irrelevant clock "sana"")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/iio/adc/meson_saradc.c
index 36047147ce7c,f0b6502a8904..000000000000
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@@ -762,9 -732,8 +755,7 @@@ static int meson_sar_adc_hw_enable(stru
  err_adc_clk:
  	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
  			   MESON_SAR_ADC_REG3_ADC_EN, 0);
 -	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 -			   MESON_SAR_ADC_REG11_BANDGAP_EN, 0);
 +	meson_sar_adc_set_bandgap(indio_dev, false);
- 	clk_disable_unprepare(priv->sana_clk);
- err_sana_clk:
  	clk_disable_unprepare(priv->core_clk);
  err_core_clk:
  	regulator_disable(priv->vref);
@@@ -787,10 -756,9 +778,9 @@@ static int meson_sar_adc_hw_disable(str
  
  	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
  			   MESON_SAR_ADC_REG3_ADC_EN, 0);
 -	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 -			   MESON_SAR_ADC_REG11_BANDGAP_EN, 0);
 +
 +	meson_sar_adc_set_bandgap(indio_dev, false);
  
- 	clk_disable_unprepare(priv->sana_clk);
  	clk_disable_unprepare(priv->core_clk);
  
  	regulator_disable(priv->vref);
