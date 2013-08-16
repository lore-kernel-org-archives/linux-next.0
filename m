From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [RFC PATCH next]cgroup: use css_get() in cgroup_create() to check
 CSS_ROOT
Date: Fri, 16 Aug 2013 17:57:14 +0800
Message-ID: <1376647034.2642.22.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:46975 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529Ab3HPJ5X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2013 05:57:23 -0400
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Fri, 16 Aug 2013 19:46:27 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 8CA562CE8051
	for <linux-next@vger.kernel.org>; Fri, 16 Aug 2013 19:57:19 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r7G9fRrL52101170
	for <linux-next@vger.kernel.org>; Fri, 16 Aug 2013 19:41:28 +1000
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r7G9vI2n006935
	for <linux-next@vger.kernel.org>; Fri, 16 Aug 2013 19:57:19 +1000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>

It seems that the root css doesn't have refcnt allocated(not needed?),
and would cause the booting error attached.

This patch tries to use css_get() to not increase the refcnt if parent
is root.

[    0.792038] BUG: unable to handle kernel NULL pointer dereference at           (null)
[    0.792937] IP: [<ffffffff810b37cc>] cgroup_mkdir+0x37c/0x740
[    0.793027] PGD 0 
[    0.793027] Oops: 0002 [#1] 
[    0.793027] Modules linked in:
[    0.793027] CPU: 0 PID: 1 Comm: systemd Not tainted 3.11.0-rc5-next-20130815+ #1
[    0.793027] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
[    0.793027] task: ffff88007f868000 ti: ffff88007f864000 task.ti: ffff88007f864000
[    0.793027] RIP: 0010:[<ffffffff810b37cc>]  [<ffffffff810b37cc>] cgroup_mkdir+0x37c/0x740
[    0.793027] RSP: 0018:ffff88007f865df8  EFLAGS: 00010246
[    0.793027] RAX: 0000000000000000 RBX: ffffffff81a46ee0 RCX: 0000000000000001
[    0.793027] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff81a415c0
[    0.793027] RBP: ffff88007f865ec8 R08: 0000000000000001 R09: 0000000000000000
[    0.793027] R10: ffff88007ce6d060 R11: 0000000000000000 R12: ffff88007ce6d000
[    0.793027] R13: ffff88007ce6d060 R14: ffffffff81a46d80 R15: ffff88007c6e8018
[    0.793027] FS:  00007f13dbf6f840(0000) GS:ffffffff81a23000(0000) knlGS:0000000000000000
[    0.793027] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.793027] CR2: 0000000000000000 CR3: 000000007b7e5000 CR4: 00000000000006b0
[    0.793027] Stack:
[    0.793027]  ffffffff810b380d 0000000000000002 ffff88007f865e18 ffffffff81167069
[    0.793027]  ffff88007f865ed8 ffffffff8116a3f5 ffff880037454400 ffff88007c6e8018
[    0.793027]  ffff88007c6e8028 ffff88007c6e8328 ffff88007c6e8000 ffff88007ce6d000
[    0.793027] Call Trace:
[    0.793027]  [<ffffffff810b380d>] ? cgroup_mkdir+0x3bd/0x740
[    0.793027]  [<ffffffff81167069>] ? lookup_hash+0x19/0x20
[    0.793027]  [<ffffffff8116a3f5>] ? kern_path_create+0x95/0x170
[    0.793027]  [<ffffffff8116ce3e>] vfs_mkdir+0x9e/0xf0
[    0.793027]  [<ffffffff8116d7a0>] SyS_mkdirat+0x60/0xe0
[    0.793027]  [<ffffffff8116d839>] SyS_mkdir+0x19/0x20
[    0.793027]  [<ffffffff814c960d>] tracesys+0xcf/0xd4
[    0.793027] Code: ad 70 ff ff ff 48 89 9d 60 ff ff ff 4d 89 d5 4c 8b bd 68 ff ff ff 4c 8b 65 88 eb 50 0f 1f 00 48 8b 43 18 a8 03 0f 85 6c 03 00 00 <ff> 00 e8 1d 0a fb ff 85 c0 74 0d 80 3d f0 45 a1 00 00 0f 84 4c 
[    0.793027] RIP  [<ffffffff810b37cc>] cgroup_mkdir+0x37c/0x740
[    0.793027]  RSP <ffff88007f865df8>
[    0.793027] CR2: 0000000000000000
[    0.827296] ---[ end trace a4b14b49bc46fd60 ]---


Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 kernel/cgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup.c b/kernel/cgroup.c
index 723194f..781f8cd 100644
--- a/kernel/cgroup.c
+++ b/kernel/cgroup.c
@@ -4485,7 +4485,7 @@ static long cgroup_create(struct cgroup *parent, struct dentry *dentry,
 		struct cgroup_subsys_state *css = css_ar[ss->subsys_id];
 
 		dget(dentry);
-		percpu_ref_get(&css->parent->refcnt);
+		css_get(css->parent);
 	}
 
 	/* hold a ref to the parent's dentry */
