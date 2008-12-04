From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-12-04: ca0106 compile fix
Date: Thu, 4 Dec 2008 17:00:10 +0300
Message-ID: <20081204140010.GA13953@x200.localdomain>
References: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.173]:4534 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754501AbYLDNz7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 08:55:59 -0500
Received: by ug-out-1314.google.com with SMTP id 39so3773884ugf.37
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2008 05:55:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.de

Please, fold into 2c5dd6425e72a6e97d9fb9fee9910a58f02d77df
aka "ALSA: ca0106 - Add power-amangement support"
			      ^^

  CC [M]  sound/pci/ca0106/ca0106_main.o
sound/pci/ca0106/ca0106_main.c:1809: error: 'snd_ca0106_suspend' undeclared here (not in a function)
sound/pci/ca0106/ca0106_main.c:1810: error: 'snd_ca0106_resume' undeclared here (not in a function)

--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1806,8 +1806,10 @@ static struct pci_driver driver = {
 	.id_table = snd_ca0106_ids,
 	.probe = snd_ca0106_probe,
 	.remove = __devexit_p(snd_ca0106_remove),
+#ifdef CONFIG_PM
 	.suspend = snd_ca0106_suspend,
 	.resume = snd_ca0106_resume,
+#endif
 };
 
 // initialization of the module
