Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B753E317B
	for <linux-next@vger.kernel.org>; Wed, 15 Apr 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268180; cv=none; b=dfLXffFaIuKHvUsq7HPKuaWtYJrm1+nYKc0ztI3OpMMy0pDL/iAA7lum2atW/YFZLKCmkKb1q31nMmNnNiMZO29FlxS91nPcYR40xK8gvrGgmlTu78RxAdWnkBwLjy3LzLHVJn6WHT0duq5tF5gyCQXPo6VLX36x8l+dWWAaR48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268180; c=relaxed/simple;
	bh=+g6XMLTylpWWr7PaGvjg6GlRUR0gsvXb29tdvldILwo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KyEdpH6/SgetC03K31pfZk+z64kPhYiWmr2bqXCYlLIkcbati6DkXhC8XEojqQ1SE2zT7M8cokKo807KX4beCMcWv38G+Ajrc2DEi3JVJZx8Lipd9I8xDoj/PtV74Qd0P1TGd83fv7z4SgB3690zT0dpdsJWFfCqtL3MMBX4d/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-69271008251so3788167eaf.2
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2026 08:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268173; x=1776872973;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99hNkWY0Q+eVdLpDuachQrZ2MvVNwXoikg3P0685CEU=;
        b=cUtqD2YJ2r28MfRny0lo1CkK4E4/RmI6FtdCO/hwRR/oj5bwrORtPdugowCsWCfa46
         DX2ZxeSXZ1EWciUyuj8ZBnb9eYn583l7bC5iWivXBP4RJt9q26y8Jd84Eh7kCz4fyn1o
         i60kBBBK3YjqgCrXxBcAl5z4n1sOr0KKbdCRihlYd+IlnhIMDVbihPuKWdcSV6KnbhuT
         tDSWBK7FgF4W6eaG9Q83xfobX/7YRhpqgb7YWEBFnUSHNuwlVEu2yhoccswiwZNRUP/r
         mxP9c6OvBdu/dV/W5TyyoKzIDqOi/iGppHHclTwQqukxfrxDjwozRwBuUnA0ofLqn5MM
         h77A==
X-Forwarded-Encrypted: i=1; AFNElJ8zZB+JV6PQPcMy85xvLNnaA0JNOE6VJ2w6KHi+8JKubzxgRHzwpR6A6daUXG+WrH1l8k13bWQFLOeY@vger.kernel.org
X-Gm-Message-State: AOJu0YyosRz7vd9lBzrFz4d83W+Gdu9737NunUreEZ5WhLgN07IANDgT
	we0gSsTPZX9ZMC4Q9LvWJ6AMzX+zuIrLOYNY5BPjoXb98hKSIox7Go2xVyhdZ2EKq6M8ShU99Qj
	1SEr4S8wmBWPcHL1B6gAqqO2H2+EQuvwnwPPoohnIwcSwjiYYXj/8NeM1tBY=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:62a:b0:67e:313e:22c4 with SMTP id
 006d021491bc7-68be85d32e6mr12168340eaf.47.1776268173581; Wed, 15 Apr 2026
 08:49:33 -0700 (PDT)
Date: Wed, 15 Apr 2026 08:49:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69dfb38d.a00a0220.8f24c.016f.GAE@google.com>
Subject: [syzbot] [fuse?] linux-next test error: WARNING in fuse_dev_install_with_pq
From: syzbot <syzbot+a761f017e231803b82cd@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, miklos@szeredi.hu, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    936c21068d7a Add linux-next specific files for 20260415
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14940702580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20564048a4030a77
dashboard link: https://syzkaller.appspot.com/bug?extid=a761f017e231803b82cd
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/65e69b0763ee/disk-936c2106.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eec951f96cd3/vmlinux-936c2106.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d1e1822e93a4/bzImage-936c2106.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a761f017e231803b82cd@syzkaller.appspotmail.com

------------[ cut here ]------------
fud->pq.processing
WARNING: fs/fuse/dev.c:482 at fuse_dev_install_with_pq+0x23b/0x270 fs/fuse/dev.c:482, CPU#1: syz.4.290/6132
Modules linked in:
CPU: 1 UID: 0 PID: 6132 Comm: syz.4.290 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
RIP: 0010:fuse_dev_install_with_pq+0x23b/0x270 fs/fuse/dev.c:482
Code: 85 6d fe ff ff e8 55 84 84 fe 4d 85 ed 0f 94 c0 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8 36 84 84 fe 90 <0f> 0b 90 41 80 3c 2e 00 0f 85 8a fe ff ff e9 8d fe ff ff 44 89 f1
RSP: 0018:ffffc90005357660 EFLAGS: 00010293
RAX: ffffffff83401a0a RBX: ffff88802cb4b000 RCX: ffff88802d041ec0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffff88802804d50f R09: 1ffff11005009aa1
R10: dffffc0000000000 R11: ffffed1005009aa2 R12: ffff88802d2a2000
R13: ffff88802804d598 R14: 1ffff11005009ab3 R15: ffff88802804d500
FS:  0000555556ded500(0000) GS:ffff888125fbc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f58e1e0ba40 CR3: 000000003e02c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 fuse_dev_install fs/fuse/dev.c:496 [inline]
 fuse_dev_alloc_install+0x61/0x80 fs/fuse/dev.c:508
 cuse_channel_open+0x124/0x7b0 fs/fuse/cuse.c:524
 misc_open+0x2de/0x350 drivers/char/misc.c:163
 chrdev_open+0x4d0/0x5f0 fs/char_dev.c:411
 do_dentry_open+0x83d/0x13e0 fs/open.c:947
 vfs_open+0x3b/0x350 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2e43/0x38a0 fs/namei.c:4858
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f58e1e7c819
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdb95bfa38 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f58e20f5fa0 RCX: 00007f58e1e7c819
RDX: 0000000000000002 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007f58e1f12c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f58e20f5fac R14: 00007f58e20f5fa0 R15: 00007f58e20f5fa0
 </TASK>


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
