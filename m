From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH 0/2] x86,vdso: vdso build fixes and improvements
Date: Thu, 29 May 2014 14:57:16 -0700
Message-ID: <cover.1401400316.git.luto@amacapital.net>
References: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:65083 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754328AbaE2V5W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 17:57:22 -0400
Received: by mail-pa0-f53.google.com with SMTP id kp14so940515pab.12
        for <linux-next@vger.kernel.org>; Thu, 29 May 2014 14:57:21 -0700 (PDT)
In-Reply-To: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>

Patch 1 causes make;make to behave similarly to make if vdso2c fails.
Patch 2 hopefully fixes x86 crossbuilds on big-endian machines.  I don't
have a big-endian machine to test on, though.

Andy Lutomirski (2):
  x86,vdso: When vdso2c fails, unlink the output
  x86,vdso: Fix cross-compilation from big-endian architectures

 arch/x86/vdso/vdso2c.c | 35 ++++++++++++++++++-------
 arch/x86/vdso/vdso2c.h | 69 ++++++++++++++++++++++++++------------------------
 2 files changed, 62 insertions(+), 42 deletions(-)

-- 
1.9.3
