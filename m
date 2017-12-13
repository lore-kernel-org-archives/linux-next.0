From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the cgroup tree
Date: Wed, 13 Dec 2017 14:56:27 +1100
Message-ID: <20171213145627.656e3909@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751577AbdLMD43 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 22:56:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ma Shimiao <mashimiao.fnst@cn.fujitsu.com>

Hi Tejun,

After merging the cgroup tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

kernel/cgroup/cgroup.c: In function 'init_cgroup_root':
kernel/cgroup/cgroup.c:1867:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
   strscpy(root->release_agent_path, opts->release_agent, PATH_MAX);
   ^
kernel/cgroup/cgroup.c:1869:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
   strscpy(root->name, opts->name, MAX_CGROUP_ROOT_NAMELEN);
   ^
kernel/cgroup/cgroup.c: In function 'cgroup_file_name':
kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
   strscpy(buf, cft->name, CGROUP_FILE_NAME_MAX);
   ^

Introduced by commit

  e7fd37ba1217 ("cgroup: avoid copying strings longer than the buffers")

-- 
Cheers,
Stephen Rothwell
