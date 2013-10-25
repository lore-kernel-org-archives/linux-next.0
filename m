From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the mfd-lj tree
Date: Fri, 25 Oct 2013 15:03:41 +0200
Message-ID: <1382706224-8859-3-git-send-email-treding@nvidia.com>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
 <1382706224-8859-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382706224-8859-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Mark Brown <broonie@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the mfd-lj tree got conflicts in

	sound/soc/codecs/mc13783.c

caused by commits 9f6f0af (ASoC: mc13783: add spi errata fix), fd792f8
(mfd: mc13xxx: Move SPI erratum workaround into SPI I/O function) and
2d9215c (ASoC: mc13783: Use regmap directly from ASoC).

I fixed it up and the diff turned up empty, so I think it can't be all
that wrong.

Thanks,
Thierry
