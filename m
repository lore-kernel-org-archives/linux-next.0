From: Gabriel C <nix.or.die@googlemail.com>
Subject: linux-next: sound/pcmcia/vx build error
Date: Wed, 21 May 2008 19:47:04 +0200
Message-ID: <48346018.5040800@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.189]:14960 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989AbYEURrX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 13:47:23 -0400
Received: by fk-out-0910.google.com with SMTP id 18so2870799fkq.5
        for <linux-next@vger.kernel.org>; Wed, 21 May 2008 10:47:21 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Hi,

I got the following error with a randconfig on linux-next-20080521

...

sound/built-in.o: In function `vxpocket_detach':
vxpocket.c:(.text+0x20cfa): undefined reference to `pcmcia_disable_device'
sound/built-in.o: In function `vxpocket_probe':
vxpocket.c:(.text+0x20f46): undefined reference to `pcmcia_request_io'
vxpocket.c:(.text+0x20f5a): undefined reference to `pcmcia_request_irq'
vxpocket.c:(.text+0x20f73): undefined reference to `pcmcia_request_configuration'
vxpocket.c:(.text+0x2101f): undefined reference to `cs_error'
vxpocket.c:(.text+0x21027): undefined reference to `pcmcia_disable_device'
sound/built-in.o: In function `init_vxpocket':
vxpocket.c:(.init.text+0x75b): undefined reference to `pcmcia_register_driver'
sound/built-in.o: In function `exit_vxpocket':
vxpocket.c:(.exit.text+0x28c): undefined reference to `pcmcia_unregister_driver'
make: *** [.tmp_vmlinux1] Error 1

...


config -> http://frugalware.org/~crazy/linux-next/randconfig/bad33_config


Regards,

Gabriel
