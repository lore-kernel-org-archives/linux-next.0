From: Gabriel C <nix.or.die@googlemail.com>
Subject: linux-next: UML build error
Date: Wed, 21 May 2008 19:26:09 +0200
Message-ID: <48345B31.50904@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.156]:12796 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761651AbYEUR03 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 13:26:29 -0400
Received: by fg-out-1718.google.com with SMTP id 19so2387843fgg.17
        for <linux-next@vger.kernel.org>; Wed, 21 May 2008 10:26:26 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jdike@addtoit.com
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net

Hi,

I get the following UML compile error on linux-next-20080521 , 64bit box :

...

  CC      arch/um/sys-x86_64/ksyms.o
arch/um/sys-x86_64/ksyms.c:5: error: '__memcpy' undeclared here (not in a function)
arch/um/sys-x86_64/ksyms.c:5: warning: type defaults to 'int' in declaration of '__memcpy'
make[1]: *** [arch/um/sys-x86_64/ksyms.o] Error 1
make: *** [arch/um/sys-x86_64] Error 2

...

config is UM's defconfig.


Regards,

Gabriel 
