From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH v2 0/2] x86,vdso: vdso build fixes and improvements
Date: Fri, 30 May 2014 08:48:47 -0700
Message-ID: <cover.1401464755.git.luto@amacapital.net>
References: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:46422 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933149AbaE3Psy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2014 11:48:54 -0400
Received: by mail-pa0-f48.google.com with SMTP id rd3so1837926pab.35
        for <linux-next@vger.kernel.org>; Fri, 30 May 2014 08:48:53 -0700 (PDT)
In-Reply-To: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>

Patch 1 causes make;make to behave similarly to make if vdso2c fails.
Patch 2 hopefully fixes x86 crossbuilds on big-endian machines.  I don't
have a big-endian machine to test on, though.

Changes from v1: Add two missing endian fixes

Andy Lutomirski (2):
  x86,vdso: When vdso2c fails, unlink the output
  x86,vdso: Fix cross-compilation from big-endian architectures

 arch/x86/vdso/vdso2c.c | 35 +++++++++++++++++-------
 arch/x86/vdso/vdso2c.h | 73 ++++++++++++++++++++++++++------------------------
 2 files changed, 64 insertions(+), 44 deletions(-)

-- 
1.9.3
