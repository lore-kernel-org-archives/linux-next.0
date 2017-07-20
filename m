From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the userns tree
Date: Thu, 20 Jul 2017 13:25:49 +1000
Message-ID: <20170720132549.0f086e4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53191 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932172AbdGTDZv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Jul 2017 23:25:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kirill Tkhai <ktkhai@virtuozzo.com>

Hi Eric,

After merging the userns tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/pid_namespace.c: In function 'create_pid_namespace':
kernel/pid_namespace.c:105:7: error: too many arguments to function 'in_userns'
  if (!in_userns(parent_pid_ns->user_ns, user_ns))
       ^
In file included from kernel/pid_namespace.c:13:0:
include/linux/user_namespace.h:148:20: note: declared here
 static inline bool in_userns(const struct user_namespace *target_ns)
                    ^

Caused by commit

  1f1b28d80cd9 ("userns,pidns: Verify the userns for new pid namespaces")

I have used the userns tree from next-20170719 for today.

-- 
Cheers,
Stephen Rothwell
