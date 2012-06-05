From: MR Swami Reddy <MR.Swami.Reddy@ti.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 5 Jun 2012 12:25:07 +0530
Message-ID: <4FCDAD4B.4010808@ti.com>
References: <20120605112557.61c2aaea05db2684cecb9835@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:43922 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984Ab2FEGtQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jun 2012 02:49:16 -0400
In-Reply-To: <20120605112557.61c2aaea05db2684cecb9835@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, "Girdwood, Liam" <lrg@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deshpande A, Vishwas" <Vishwas.A.Deshpande@ti.com>

On Tuesday 05 June 2012 06:55 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> make[4]: *** No rule to make target `sound/soc/codecs/snd-soc-isabelle.c', needed by `sound/soc/codecs/snd-soc-isabelle.o'.  Stop.
>
> Caused by commit 4567db1722aa ("ASoC: Support TI Isabelle Audio
> driver").  Was this ever built?
>
> I have used the sound-asoc tree from next-20120601 again for today.
Hi Stephen,

There is a typo in the sound/soc/codecs/Makefile for isabelle.o

I will be sending the below patch is to fix the build issue.
--
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 196e939..fdc1ff6 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -17,7 +17,7 @@ snd-soc-cx20442-objs := cx20442.o
 snd-soc-da7210-objs := da7210.o
 snd-soc-dfbmcs320-objs := dfbmcs320.o
 snd-soc-dmic-objs := dmic.o
-snd-soc-isabelle := isabelle.o
+snd-soc-isabelle-objs := isabelle.o
 snd-soc-l3-objs := l3.o
 snd-soc-lm49453-objs := lm49453.o
 snd-soc-max98088-objs := max98088.o
---


Thanks
Swami
