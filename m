Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154730AAA6
	for <linux-next@vger.kernel.org>; Tue, 26 May 2026 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774937; cv=none; b=Bu7lCB+4Ce19e52N4PL/oYrxOQbTRzOTWaYMUvOJXnHZ36bzZu7Zm1VWc4WpOG41D8g7huZJIrpnAYJdh82UW4fO8+WlkciBER21WE9C7uIDHm/AvKZG1x7C+N0lFGXuhZ1AvRn/BNX4/8W2g1Xtd9BQ0796imU1WfN1122atMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774937; c=relaxed/simple;
	bh=lMCSEFV8+pa3wLR02ydXBcrxsbQfQFc6e2X+5TSNbUw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Aux/TefaQ5Kj2rxTNutbVXv+rzoGE7RSx6SZLIcLa6z6/aZgFT1YiBSyHGPJe3iXnfSz0sRv/cRBIvUZrbKgFt6M+RnX/hoPmKBHx991bENMovSodje6PzrLFyXkxCW2Z+1sm8+vqeEyDVciOEpF2P8VVo7Rc5gFCSN0mPPi1cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7de44ba64e7so16750955a34.1
        for <linux-next@vger.kernel.org>; Mon, 25 May 2026 22:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774935; x=1780379735;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW+p/sMFy0G3Hc6tzw3Lf+oD5Ghr4Guq54Wea1fhZq4=;
        b=CO6MyIsRiLHNaXknK2xeKoBLChl4ZVAIcbFE8k2K2O8baxqroKYNUXYDBLwzel5ZfV
         22Psz2skT5BiY/YtlhGUuCa1dNPAuyh9db/GgbIWqV/K+1ne2EpZmp8+h7Z+XwVdjBRm
         GOQ1AJ6jaTg0HyTjstEJKlR1mf5omWgopIfzltwde4x7wqTLZuumzn45e2S/9IBee2lB
         0jxTfK3n+XZvoA4QV5BTKG5J32EKP+tr9kSQhFaFz6PeNyR9Y/bsR9p2m/FpeKA01ROj
         pQBOlrFzENeiJTl9Daz4v/C9OAzj0d6Dm1bHmeoVlP/mLmpcUEsiwlzWSYc0gZNBi0b1
         BBJw==
X-Forwarded-Encrypted: i=1; AFNElJ9ga1JB8Segg7jmNu+dLKCJuRHDzCYOPA8/HLZovn+IQAp+5auuxt+i6lmIdjMrqmWAd6CSzWvMFMaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxMgO6QfHYD11ChNKDAS4ToyWq6dG4UpFoNtZYCs27qhwCfzaEH
	ZGRbP89f8MbJupFFileWpuNsBtJ/xGsn51JXrPritDGc8yJoVKjyqmq+PTVHeIX3HXURg9q/jTk
	owY66P35s5OJ+lZKcqPjOF4+ZuXJ+CkgVuQlz/8ZTvf5+92kmbtZRgtDgX3I=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:458d:b0:69d:7bdb:adf7 with SMTP id
 006d021491bc7-69d7ec67604mr7183412eaf.38.1779774935007; Mon, 25 May 2026
 22:55:35 -0700 (PDT)
Date: Mon, 25 May 2026 22:55:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in class_for_each_device
From: syzbot <syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, rafael@kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d387b06f7c15 Add linux-next specific files for 20260525
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15eb7796580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8dd72cf810e753a6
dashboard link: https://syzkaller.appspot.com/bug?extid=50b5f81fff158669504a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/39490dfbc250/disk-d387b06f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0789ac7ac5fc/vmlinux-d387b06f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4464df9f5ccf/bzImage-d387b06f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com

------------[ cut here ]------------
class_for_each_device called for class 'devlink' before it was registered
WARNING: drivers/base/class.c:416 at class_for_each_device+0x2d8/0x390 drivers/base/class.c:415, CPU#1: kworker/1:1/37
Modules linked in:
CPU: 1 UID: 0 PID: 37 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Workqueue: events deferred_probe_timeout_work_func
RIP: 0010:class_for_each_device+0x2fc/0x390 drivers/base/class.c:415
Code: 8d 1d 38 5c 0e 0a 4c 89 e8 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 ef e8 62 fc a5 fc 49 8b 55 00 48 89 df 48 c7 c6 f1 46 5d 8d <67> 48 0f b9 3a b8 ea ff ff ff eb 1b e8 93 79 3b fc 49 81 c6 90 00
RSP: 0000:ffffc90000ac7a20 EFLAGS: 00010246
RAX: 1ffffffff17865d4 RBX: ffffffff8f984790 RCX: ffff88801e2e9f00
RDX: ffffffff8bc34360 RSI: ffffffff8d5d46f1 RDI: ffffffff8f984790
RBP: ffffc90000ac7af8 R08: ffffc90000ac7a7f R09: 0000000000000000
R10: ffffc90000ac7a60 R11: fffff52000158f50 R12: ffffc90000ac7a60
R13: ffffffff8bc32ea0 R14: 1ffff92000158f48 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125fdb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000ddb8000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 fw_devlink_drivers_done+0x35/0x50 drivers/base/core.c:1837
 deferred_probe_timeout_work_func+0x21/0x220 drivers/base/dd.c:305
 process_one_work+0x98b/0x1630 kernel/workqueue.c:3318
 process_scheduled_works kernel/workqueue.c:3401 [inline]
 worker_thread+0xb49/0x1140 kernel/workqueue.c:3482
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	8d 1d 38 5c 0e 0a    	lea    0xa0e5c38(%rip),%ebx        # 0xa0e5c3e
   6:	4c 89 e8             	mov    %r13,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  12:	74 08                	je     0x1c
  14:	4c 89 ef             	mov    %r13,%rdi
  17:	e8 62 fc a5 fc       	call   0xfca5fc7e
  1c:	49 8b 55 00          	mov    0x0(%r13),%rdx
  20:	48 89 df             	mov    %rbx,%rdi
  23:	48 c7 c6 f1 46 5d 8d 	mov    $0xffffffff8d5d46f1,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  34:	eb 1b                	jmp    0x51
  36:	e8 93 79 3b fc       	call   0xfc3b79ce
  3b:	49                   	rex.WB
  3c:	81                   	.byte 0x81
  3d:	c6                   	(bad)
  3e:	90                   	nop


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
