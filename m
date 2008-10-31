From: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: linux-next: sound tree build failure
Date: Fri, 31 Oct 2008 13:49:44 -0700
Message-ID: <490B6F68.8090806@boundarydevices.com>
References: <20081031144106.f66b7084.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fbr02.csee.onr.siteprotect.com ([64.26.60.146]:35703 "EHLO
	fbr02.csee.onr.siteprotect.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751640AbYJaVUq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 17:20:46 -0400
Received: from smtpauth03.csee.onr.siteprotect.com (smtpauth03.csee.onr.siteprotect.com [64.26.60.137])
	by fbr02.csee.onr.siteprotect.com (Postfix) with ESMTP id 909DA3252AE
	for <linux-next@vger.kernel.org>; Fri, 31 Oct 2008 15:51:11 -0500 (CDT)
In-Reply-To: <20081031144106.f66b7084.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Takashi,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> sound/soc/soc-dapm.c: In function 'snd_soc_dapm_sys_add':
> sound/soc/soc-dapm.c:828: error: 'ret' undeclared (first use in this function)
> 
> Caused by commit 12ef193d5817504621e503e78d641265f6a86ac4 ("ASoC: Allow
> setting codec register with debugfs filesystem") which removed the
> declaration.
> 
> I applied the following patch.  More care required.

My patch had
@@ -822,23 +818,9 @@ static DEVICE_ATTR(dapm_widget, 0444, dapm_widget_show, NULL);

 int snd_soc_dapm_sys_add(struct device *dev)
 {
-	int ret = 0;
-
 	if (!dapm_status)
 		return 0;
-
-	ret = device_create_file(dev, &dev_attr_dapm_widget);
-	if (ret != 0)
-		return ret;
-
-	asoc_debugfs = debugfs_create_dir("asoc", NULL);
-	if (!IS_ERR(asoc_debugfs))
-		debugfs_create_u32("dapm_pop_time", 0744, asoc_debugfs,
-				   &pop_time);
-	else
-		asoc_debugfs = NULL;
-
-	return 0;
+	return device_create_file(dev, &dev_attr_dapm_widget);
 }



which somehow got changed to
@@ -821,23 +817,13 @@ static DEVICE_ATTR(dapm_widget, 0444, dapm_widget_show, NULL);

 int snd_soc_dapm_sys_add(struct device *dev)
 {
-	int ret = 0;
-
 	if (!dapm_status)
 		return 0;

 	ret = device_create_file(dev, &dev_attr_dapm_widget);
 	if (ret != 0)
 		return ret;
-
-	asoc_debugfs = debugfs_create_dir("asoc", NULL);
-	if (!IS_ERR(asoc_debugfs) && asoc_debugfs)
-		debugfs_create_u32("dapm_pop_time", 0744, asoc_debugfs,
-				   &pop_time);
-	else
-		asoc_debugfs = NULL;
-
-	return 0;
+	return device_create_file(dev, &dev_attr_dapm_widget);
 }


which will call device_create_file twice

Troy
