From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the cgroup tree
Date: Fri, 15 Dec 2017 10:58:04 +0100
Message-ID: <CAK8P3a1v59UJ1XhgGELZbFNDyv0SNm2hM2Tghnq4+4Own57CBA@mail.gmail.com>
References: <20171213145627.656e3909@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:37822 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756385AbdLOJ6F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Dec 2017 04:58:05 -0500
In-Reply-To: <20171213145627.656e3909@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ma Shimiao <mashimiao.fnst@cn.fujitsu.com>

On Wed, Dec 13, 2017 at 4:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Tejun,
>
> After merging the cgroup tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> kernel/cgroup/cgroup.c: In function 'init_cgroup_root':
> kernel/cgroup/cgroup.c:1867:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
>    strscpy(root->release_agent_path, opts->release_agent, PATH_MAX);
>    ^
> kernel/cgroup/cgroup.c:1869:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
>    strscpy(root->name, opts->name, MAX_CGROUP_ROOT_NAMELEN);
>    ^
> kernel/cgroup/cgroup.c: In function 'cgroup_file_name':
> kernel/cgroup/cgroup.c:1400:3: warning: ignoring return value of 'strscpy', declared with attribute warn_unused_result [-Wunused-result]
>    strscpy(buf, cft->name, CGROUP_FILE_NAME_MAX);
>    ^
>
> Introduced by commit
>
>   e7fd37ba1217 ("cgroup: avoid copying strings longer than the buffers")

As long as cft->name is guaranteed to be NUL-terminated, using strlcpy() would
work just as well and avoid that warning, so the change below could be folded
into that commit.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index dc442a5d88b9..3cced1259cd3 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1397,7 +1397,7 @@ static char *cgroup_file_name(struct cgroup
*cgrp, const struct cftype *cft,
                         cgroup_on_dfl(cgrp) ? ss->name : ss->legacy_name,
                         cft->name);
        else
-               strscpy(buf, cft->name, CGROUP_FILE_NAME_MAX);
+               strlcpy(buf, cft->name, CGROUP_FILE_NAME_MAX);
        return buf;
 }

@@ -1874,9 +1874,9 @@ void init_cgroup_root(struct cgroup_root *root,
struct cgroup_sb_opts *opts)

        root->flags = opts->flags;
        if (opts->release_agent)
-               strscpy(root->release_agent_path, opts->release_agent,
PATH_MAX);
+               strlcpy(root->release_agent_path, opts->release_agent,
PATH_MAX);
        if (opts->name)
-               strscpy(root->name, opts->name, MAX_CGROUP_ROOT_NAMELEN);
+               strlcpy(root->name, opts->name, MAX_CGROUP_ROOT_NAMELEN);
        if (opts->cpuset_clone_children)
                set_bit(CGRP_CPUSET_CLONE_CHILDREN, &root->cgrp.flags);
 }
