From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the cgroup tree
Date: Mon, 1 May 2017 14:53:40 +1000
Message-ID: <20170501145340.17e8ef86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50523 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1427143AbdEAExn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 00:53:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Tejun,

After merging the cgroup tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

kernel/cgroup/cgroup.c:439:13: warning: 'cgroup_get' defined but not used [-Wunused-function]
 static void cgroup_get(struct cgroup *cgrp)
             ^

Introduced by commit

  a590b90d472f ("cgroup: fix spurious warnings on cgroup_is_dead() from cgroup_sk_alloc()")

CONFIG_SOCK_CGROUP_DATA is not set for this build.

-- 
Cheers,
Stephen Rothwell
