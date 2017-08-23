From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the security tree
Date: Wed, 23 Aug 2017 21:12:13 +1000
Message-ID: <20170823211213.0b014b1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52315 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753691AbdHWLMQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 07:12:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Johansen <john.johansen@canonical.com>

Hi James,

After merging the security tree, today's linux-next build (sparc64
allmodconfig) failed like this:

In file included from security/apparmor/ipc.c:23:0:
security/apparmor/include/sig_names.h:26:3: error: 'SIGSTKFLT' undeclared here (not in a function)
  [SIGSTKFLT] = 16, /* -, 16, - */
   ^
security/apparmor/include/sig_names.h:26:3: error: array index in initializer not of integer type
security/apparmor/include/sig_names.h:26:3: note: (near initialization for 'sig_map')
security/apparmor/include/sig_names.h:51:3: error: 'SIGUNUSED' undeclared here (not in a function)
  [SIGUNUSED] = 34, /* -, 31, - */
   ^
security/apparmor/include/sig_names.h:51:3: error: array index in initializer not of integer type
security/apparmor/include/sig_names.h:51:3: note: (near initialization for 'sig_map')

Caused by commit

  c6bf1adaecaa ("apparmor: add the ability to mediate signals")

-- 
Cheers,
Stephen Rothwell
