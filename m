From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the security tree
Date: Thu, 17 Aug 2017 12:51:40 +1000
Message-ID: <20170817125140.7d705af8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751621AbdHQCvm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Aug 2017 22:51:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

Hi James,

After merging the security tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from samples/seccomp/bpf-fancy.c:12:0:
samples/seccomp/bpf-fancy.c: In function 'main':
samples/seccomp/bpf-helper.h:47:26: error: 'SECCOMP_RET_KILL_THREAD' undeclared (first use in this function)
  BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL_THREAD)
                          ^
./usr/include/linux/filter.h:48:59: note: in definition of macro 'BPF_STMT'
 #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
                                                           ^
samples/seccomp/bpf-fancy.c:41:3: note: in expansion of macro 'DENY'
   DENY,  /* Don't passthrough into a label */
   ^~~~
samples/seccomp/bpf-helper.h:47:26: note: each undeclared identifier is reported only once for each function it appears in
  BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_KILL_THREAD)
                          ^
./usr/include/linux/filter.h:48:59: note: in definition of macro 'BPF_STMT'
 #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
                                                           ^
samples/seccomp/bpf-fancy.c:41:3: note: in expansion of macro 'DENY'
   DENY,  /* Don't passthrough into a label */
   ^~~~

[Note: this is a cross build, if that is relevant ...]

Presumably caused by commit

  fd76875ca289 ("seccomp: Rename SECCOMP_RET_KILL to SECCOMP_RET_KILL_THREAD")

I have used the security tree from next-20170816 for today.

-- 
Cheers,
Stephen Rothwell
