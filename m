Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A03BC4DC;
	Wed, 21 Jan 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011812; cv=none; b=aNgvPYtSenr0DxMoER4taAY8YzStlouyGXPfg4GyZqId0fqJ9u0nxmNJtN6/F+3NeANFILvad4cCt94vH3/jGa5PBlUj7Busyy+G1GrhNCOxeBtJ9qbpH7rmjN2zUutSyWZ48alMTylIEMQRorHEMR0qm/1eNlgmJFgY2TKAdNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011812; c=relaxed/simple;
	bh=BJaroC3FZx1wx4czM9tRyTXiFzYbekv96aSMWNFNKrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHkbIqlflmpGczjCoac4anYY1zr9fUkrnu28JX0QSF+CfgfFY9/2yuSMzE4gy2vIaDdIFEL3jRywE+njOTrMnC1p+2j80S6UxxRTsQ1GMlsippKvqt/RlnchrxfuI2G5Lug9hH2WiXqlK+4xZKO7keCGdQpj/gnx1OBYbUpaPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb2E3/LJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb2E3/LJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D10C4AF09;
	Wed, 21 Jan 2026 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011812;
	bh=BJaroC3FZx1wx4czM9tRyTXiFzYbekv96aSMWNFNKrU=;
	h=Date:From:To:Cc:Subject:From;
	b=Xb2E3/LJzaj0h5DjYRC57RJVUq3uQxS5x/qVAZ43tZDX9sGqKCni6SqUuypN0xqdm
	 qXv4aaRSs/J2RtTUfl3w5vwWXNg6A6WwEVcRhm0C2DnonWZIN/QK+PlvIiyAu3JtW9
	 JXEAGHbg3kUtgNsd0nbUVzxqqUsHzs3MbI+dFs65alwFt5pislHtq7j9uVi71wD/s+
	 Rp7r2ZKJiAxpgOEOsLfdjHpF1NaMfyAqYxHNRx7Gv3oeDx6sM/UJBQGtbp/IT4tLkd
	 wd8O0a0QcjSBMXgpPuxjGNQa2yyp2vg6FXMYIUCD/ny8X+t7tNMfD+yKO3lC/662v9
	 1RCG0c32JlF/Q==
Date: Wed, 21 Jan 2026 16:10:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Kiran Venkatappa <quic_kiranv@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <aXD6X23btw8s-RZP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the char-misc tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:23:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   23 |                 .auto_queue = false,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:37:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   37 |                 .auto_queue = true,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:88:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   88 |                 .auto_queue = false,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:102:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
  102 |                 .auto_queue = true,
      |                  ^~~~~~~~~~


Caused by commit

  4a9ba211d0264 (bus: mhi: host: Drop the auto_queue support)

interacting with commit

  a72027045263f (wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components)

from the net-next tree.  I have applied a fixup:

From 3cf082adcac859e3c68956352688074c2046bba4 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Wed, 21 Jan 2026 15:31:33 +0000
Subject: [PATCH] bus: mhi: Fix up interaction with net-next tree

/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:23:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   23 |                 .auto_queue = false,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:37:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   37 |                 .auto_queue = true,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:88:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
   88 |                 .auto_queue = false,
      |                  ^~~~~~~~~~
/tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:102:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
  102 |                 .auto_queue = true,
      |                  ^~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
index b8d972659314b..988affafcfd1b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
@@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = false,
 	},
 	{
 		.num = 21,
@@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
 		.lpm_notify = false,
 		.offload_channel = false,
 		.doorbell_mode_switch = false,
-		.auto_queue = true,
 	},
 };
 
-- 
2.47.3

