From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [RFC PATCH next] fix unpaired rcu lock in prepend_path()
Date: Wed, 13 Nov 2013 15:21:51 +0800
Message-ID: <1384327311.19669.8.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:39594 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758427Ab3KMHWJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2013 02:22:09 -0500
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Wed, 13 Nov 2013 17:22:06 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 2C6A72BB0052
	for <linux-next@vger.kernel.org>; Wed, 13 Nov 2013 18:21:56 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rAD747a27995892
	for <linux-next@vger.kernel.org>; Wed, 13 Nov 2013 18:04:08 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rAD7LsOP005715
	for <linux-next@vger.kernel.org>; Wed, 13 Nov 2013 18:21:54 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>

The patch tries to fix following complaint(next-1112) caused by unpaired
rcu_read_lock/unlock in function prepend_path():

[   19.611017] =====================================
[   19.612052] [ BUG: bad unlock balance detected! ]
[   19.612052] 3.12.0-next-20131112 #1 Tainted: G        W   
[   19.612052] -------------------------------------
[   19.612052] systemd/1 is trying to release lock (rcu_read_lock) at:
[   19.612052] [<ffffffff811cd22e>] d_path+0x17e/0x270
[   19.612052] but there are no more locks to release!
[   19.612052] 
other info that might help us debug this:
[   19.612052] 2 locks held by systemd/1:
[   19.612052]  #0:  (&p->lock){+.+.+.}, at: [<ffffffff811dd27d>] seq_read+0x3d/0x3c0
[   19.612052]  #1:  (&mm->mmap_sem){++++++}, at: [<ffffffff81228037>] m_start+0xa7/0x190
[   19.612052] 
stack backtrace:
[   19.612052] CPU: 0 PID: 1 Comm: systemd Tainted: G        W    3.12.0-next-20131112 #1
[   19.612052] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
[   19.612052]  ffffffff811cd22e ffff88011b07dbf8 ffffffff8154a067 0000000000000001
[   19.623937]  ffff880119cc0000 ffff88011b07dc28 ffffffff810a91ee ffffffff811ccace
[   19.623937]  ffffffff81a38a80 ffffffff811cd22e 00000000ffffffff ffff88011b07dcc8
[   19.623937] Call Trace:
[   19.623937]  [<ffffffff811cd22e>] ? d_path+0x17e/0x270
[   19.629627]  [<ffffffff8154a067>] dump_stack+0x4f/0x7c
[   19.629627]  [<ffffffff810a91ee>] print_unlock_imbalance_bug+0xfe/0x110
[   19.629627]  [<ffffffff811ccace>] ? prepend_path+0x25e/0x4a0
[   19.629627]  [<ffffffff811cd22e>] ? d_path+0x17e/0x270
[   19.629627]  [<ffffffff810ad70e>] lock_release_non_nested+0x1ee/0x310
[   19.629627]  [<ffffffff815519c5>] ? _raw_spin_unlock+0x35/0x60
[   19.629627]  [<ffffffff811ccace>] ? prepend_path+0x25e/0x4a0
[   19.629627]  [<ffffffff811cd219>] ? d_path+0x169/0x270
[   19.629627]  [<ffffffff811cd22e>] ? d_path+0x17e/0x270
[   19.629627]  [<ffffffff810ad8f4>] lock_release+0xc4/0x340
[   19.629627]  [<ffffffff811cd246>] d_path+0x196/0x270
[   19.629627]  [<ffffffff811dd651>] ? seq_path+0x51/0xd0
[   19.629627]  [<ffffffff811dd651>] seq_path+0x51/0xd0
[   19.629627]  [<ffffffff81228276>] show_map_vma+0x156/0x290
[   19.629627]  [<ffffffff81228037>] ? m_start+0xa7/0x190
[   19.629627]  [<ffffffff812283df>] show_map+0x2f/0x90
[   19.629627]  [<ffffffff81228473>] show_pid_map+0x13/0x20
[   19.629627]  [<ffffffff811dd486>] seq_read+0x246/0x3c0
[   19.629627]  [<ffffffff811b4030>] vfs_read+0xb0/0x180
[   19.629627]  [<ffffffff811b42a2>] SyS_read+0x52/0xa0
[   19.629627]  [<ffffffff8155a262>] tracesys+0xd0/0xd5
[   19.645347] ------------[ cut here ]------------

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
--- fs/dcache.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index ef2f32f..555a371 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2910,6 +2910,7 @@ static int prepend_path(const struct path *path,
 restart_mnt:
 	read_seqbegin_or_lock(&mount_lock, &m_seq);
 	seq = 0;
+	rcu_read_lock();
 restart:
 	bptr = *buffer;
 	blen = *buflen;
@@ -2957,6 +2958,9 @@ restart:
 		goto restart;
 	}
 	done_seqretry(&rename_lock, seq);
+
+	if (!(m_seq & 1))
+		rcu_read_unlock();
 	if (need_seqretry(&mount_lock, m_seq)) {
 		m_seq = 1;
 		goto restart_mnt;
