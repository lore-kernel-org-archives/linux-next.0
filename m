From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: xtensa: switch to generic clone()
Date: Tue, 27 Nov 2012 08:48:24 +0300
Message-ID: <CAMo8BfLK4syxXEjwWXixdxMaPrVgec1u7pTHqTvWO4zfpYLEsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:50372 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755608Ab2K0Fs0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 00:48:26 -0500
Received: by mail-qa0-f46.google.com with SMTP id c11so3495419qad.19
        for <linux-next@vger.kernel.org>; Mon, 26 Nov 2012 21:48:24 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, Chris Zankel <chris@zankel.net>

Hi Al,

looks like the following hunk is missing in the commit
  a4bcde6 xtensa: switch to generic clone()
found in the linux-next tree next-20121126, which breaks xtensa builds.

---
diff --git a/arch/xtensa/include/asm/syscall.h
b/arch/xtensa/include/asm/syscall.h
index b00c928..cd53ec2 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -8,6 +8,8 @@
  * Copyright (C) 2001 - 2007 Tensilica Inc.
  */

+#include <asm-generic/syscalls.h>
+
 struct pt_regs;
 struct sigaction;
 asmlinkage long xtensa_ptrace(long, long, long, long);


-- 
Thanks.
-- Max
