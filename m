Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60A39479F
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575843; cv=none; b=Bn2yHa5sLs/d7OA2I43DhIwLl/mp2rOjJSZeGewbdw3+7hRTiVcdwMXOejooJ5sxwdeI2a9FwUZDeIzlpGGJZsdheLy7IbytXcL2zp/lPPB2jitayBBBmsNMUK/sbjVkx+WB6H2AnxdVnNNdVDJsPlhekazIYcKn6VGq42HxTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575843; c=relaxed/simple;
	bh=sKpR4Y9doamF2RcA2DBuhBTQEfi2QpsVVkizlHY+1Gw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SnzdyuWyOP1gJWMLCghYr4lQW8MYpTR4NOEcAxV/lMSP1Zq9lA9WYndqjqAVhOXlJKd3+D6WZ6MRPE9X8Pu8qEk1JCq8sLy8wjQrFB/P3aZIngKZ4OMXz3rKQ3FoHImoSTgTUOkitb6JouQRxeo6LcjW3xsG2rwtITkE1GOBbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7d7f7164b12so7975818a34.1
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2026 08:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575830; x=1776180630;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TswUbMuxq7iLyPcrUrsO6SCuKSe2pAPcXo3/Ux/2lJ0=;
        b=oGcFBKDKB0rKJU5TNoBC3cTsrWX0RkwEj0Qvb3pmMNc6nzUiaTw15LonkYHQwVD5dS
         /g7q0sec2VALfGjItnsyeSPdkbnobOd3podKLsCeWREzMR/6LMlCRMK5GLq+I0hFVDxk
         6yLlT4la+ZGY3RQbvD8eGGrLDodWS/o6Qxd5dCMPDPY5X8cKa4gQny1pykHvDXqERN6K
         t2CAMliuvIjVz/GXKuIMdcW9IGaOOe6COnbI8LjifdnHnQaN221T6ouqnSwY6Ik6Nmte
         uta7Jl55dWdvT3SdIEPkSoy4Q+VfXWgW7gYdDU8xYKm5UBCWMfdlbdoeyHffqPvxShWT
         I0dg==
X-Forwarded-Encrypted: i=1; AJvYcCVYUqmuZcgLRngsoQnauG32k4KPxF3BDdaaAAfEF1bDY1eHl5aB+cs1wY3lzQJviK3wmNVQW0tpYO3j@vger.kernel.org
X-Gm-Message-State: AOJu0YydYoZ5zLwIP6pkQzlPEpM7megyf08cRlR/qvvcf6zbMtF8R80W
	F7jTMEfjRD+RHWWPDNsqA9c/e93qXLVkB1noIF3JNxE5zaabLbMDWqKn2VLyNVq4lOOIcpuAt2e
	OBwDYDdwYxvXvucr6ymqAdNCFKj6wiLjyfE5HcXv+nPoljIZycJtmRjCUXCc=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c86:b0:688:c97d:bfa9 with SMTP id
 006d021491bc7-688c98d044cmr460071eaf.8.1775575830657; Tue, 07 Apr 2026
 08:30:30 -0700 (PDT)
Date: Tue, 07 Apr 2026 08:30:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69d52316.050a0220.28fc4.0000.GAE@google.com>
Subject: [syzbot] [fuse?] linux-next test error: general protection fault in fuse_dev_alloc_install
From: syzbot <syzbot+9b639ce94c265f1daf1f@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, miklos@szeredi.hu, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f3e6330d7fe4 Add linux-next specific files for 20260407
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12f15302580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aaf410acb26eb1e9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b639ce94c265f1daf1f
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/49440d846e49/disk-f3e6330d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9eb3e67d6b50/vmlinux-f3e6330d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/162aa16f318d/bzImage-f3e6330d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b639ce94c265f1daf1f@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000046: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000230-0x0000000000000237]
CPU: 0 UID: 0 PID: 6098 Comm: syz.0.243 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
RIP: 0010:fuse_dev_install fs/fuse/dev.c:493 [inline]
RIP: 0010:fuse_dev_alloc_install+0x39/0x80 fs/fuse/dev.c:508
Code: e8 bc f8 ff ff 48 89 c3 48 85 c0 74 47 e8 7f 57 7f fe 49 8d be 30 02 00 00 48 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 05 e8 6c 94 e9 fe 49 8b 96 30 02 00 00 49 c7 86 30
RSP: 0018:ffffc90004977710 EFLAGS: 00010202
RAX: 0000000000000046 RBX: ffff88802a4e8700 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffffffff8e3178fe RDI: 0000000000000230
RBP: ffff888022375790 R08: ffffffff9074f1f7 R09: 1ffffffff20e9e3e
R10: dffffc0000000000 R11: fffffbfff20e9e3f R12: ffff888028058840
R13: ffff888028058810 R14: 0000000000000000 R15: ffff888028058800
FS:  0000555594717500(0000) GS:ffff888124dd9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcdea32ba40 CR3: 0000000030fc2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 cuse_channel_open+0x107/0x7c0 fs/fuse/cuse.c:524
 misc_open+0x2d5/0x350 drivers/char/misc.c:163
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:411
 do_dentry_open+0x785/0x14e0 fs/open.c:947
 vfs_open+0x3b/0x340 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2e08/0x3860 fs/namei.c:4858
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcdea39c819
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc7d8d7b88 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fcdea615fa0 RCX: 00007fcdea39c819
RDX: 0000000000000002 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007fcdea432c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcdea615fac R14: 00007fcdea615fa0 R15: 00007fcdea615fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:fuse_dev_install fs/fuse/dev.c:493 [inline]
RIP: 0010:fuse_dev_alloc_install+0x39/0x80 fs/fuse/dev.c:508
Code: e8 bc f8 ff ff 48 89 c3 48 85 c0 74 47 e8 7f 57 7f fe 49 8d be 30 02 00 00 48 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 05 e8 6c 94 e9 fe 49 8b 96 30 02 00 00 49 c7 86 30
RSP: 0018:ffffc90004977710 EFLAGS: 00010202
RAX: 0000000000000046 RBX: ffff88802a4e8700 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffffffff8e3178fe RDI: 0000000000000230
RBP: ffff888022375790 R08: ffffffff9074f1f7 R09: 1ffffffff20e9e3e
R10: dffffc0000000000 R11: fffffbfff20e9e3f R12: ffff888028058840
R13: ffff888028058810 R14: 0000000000000000 R15: ffff888028058800
FS:  0000555594717500(0000) GS:ffff888124dd9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056547c6ac660 CR3: 0000000030fc2000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	e8 bc f8 ff ff       	call   0xfffff8c1
   5:	48 89 c3             	mov    %rax,%rbx
   8:	48 85 c0             	test   %rax,%rax
   b:	74 47                	je     0x54
   d:	e8 7f 57 7f fe       	call   0xfe7f5791
  12:	49 8d be 30 02 00 00 	lea    0x230(%r14),%rdi
  19:	48 89 f8             	mov    %rdi,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 05                	je     0x35
  30:	e8 6c 94 e9 fe       	call   0xfee994a1
  35:	49 8b 96 30 02 00 00 	mov    0x230(%r14),%rdx
  3c:	49                   	rex.WB
  3d:	c7                   	.byte 0xc7
  3e:	86 30                	xchg   %dh,(%rax)


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
