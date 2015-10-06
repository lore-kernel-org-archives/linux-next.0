From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the audit tree
Date: Tue, 6 Oct 2015 16:46:46 +1100
Message-ID: <20151006164646.5ad86a14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34387 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751009AbbJFFqs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2015 01:46:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

After merging the audit tree, today's linux-next build (i386 defconfig
and others) produced this warning:

security/lsm_audit.c: In function 'dump_common_audit_data':
security/lsm_audit.c:340:9: warning: passing argument 1 of 'unix_sk' discards 'const' qualifier from pointer target type
     u = unix_sk(sk);
         ^
In file included from security/lsm_audit.c:22:0:
include/net/af_unix.h:67:33: note: expected 'struct sock *' but argument is of type 'const struct sock *'
 static inline struct unix_sock *unix_sk(struct sock *sk)
                                 ^

Introduced by commit

  43cfd5e38587 ("audit: constify parts of common_audit_data and lsm_network_audit")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
