Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3703A0B36
	for <linux-next@vger.kernel.org>; Sun, 19 Jul 2026 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481096; cv=none; b=ps/xFIaiWnG3fzYZd92jtBJKfSqJGft+HbK9pjZ38acAa4XScrYg87yFglyTYx5F9JUIBkoMrZDvnmV7MA8k6tlpVDQbVqt+dDMnonY7BjuMyg95N1xvqagPUXXqhwjD4+GD2d4pORvbR2JfuDpQaM3hZ1DcY60RksTQB09qiao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481096; c=relaxed/simple;
	bh=JBduvcBpAzt0nb8cCS1EPnyNaBDUEJNlFntVtyIrlHw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=l+ThRZoKxxoMdl1sbPjlyPRJHBbw9p5BuwX2hkne4KR9SIiK6Qvx7BV61s+ZX1NFOCeAHeF/JOcRGzYqYQMP60FcHV/aWpaFemDS/bLAP5/Oz/VVBRhCtsSieIRxVvw0hwdeEuGsKEKD20Z3YB1bZBK1wURPnriYYg8EPM7jYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7e9f6a49e69so7888433a34.0
        for <linux-next@vger.kernel.org>; Sun, 19 Jul 2026 10:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784481094; x=1785085894;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BQcefzpD21oTep1ua4pACn1Zh/JefrOarGjSiHQSZU=;
        b=WDLMfExDfYkuR+QRJLRpKdHtR7dM4QgpA1aNRnHbqWs9j3gCa2aPMfVGzsp6yY//+3
         Lo9Rf7fUyAx0YNSzGTkzLYnwTTpHLLxpCvNs9paXPEEDjFHVjssYmwg1ExnI4mLCuSiW
         NQKe+SEqUm+qlSj78bk6p39HmLMtZuQmUCyAzjTZi4i6e0k3yV9iMPFAcSIqf2Fz8++S
         Wg1epweBTI46jnv2/anGnmWnOhrSXjTF+VAfkAQX63DNPJaMztc7GumIzolE5BUXyUnC
         RGL8HBc4FVEyp7Twsah+EVrt4YrJqkCF7UIIJGDuzcXrIIBjYnV/uRv1ynZ+mIVTpVWe
         ZcwA==
X-Forwarded-Encrypted: i=1; AHgh+RoY2CBYYv1+4Lo6PiBiE0ne4RaPBvxDvVqXrXF4k3KuZBWAomSB1ktASeEcuUnaeL4Hv1G24ix1+Qn5@vger.kernel.org
X-Gm-Message-State: AOJu0YzvaHboFuiIbKEGmQLtDnyNdEIJcpUVXL9xFrC/tQtuOvB6fTRQ
	XJ/NIXqPzKiWaxBG4qpDWg1doxDUcFm4V2R5nTUvJTzA/Jk/lF98m6eZAj7hqRbnu0BimKPLsoq
	AIt/MtCc6kbssO3x8dZHcvW6eJBFNd1oIw8BxcIkabANQIhqA2h5Bg5EBt4I=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8d:b0:497:df42:1dee with SMTP id
 5614622812f47-4a4d040ef1emr6595795b6e.35.1784481093959; Sun, 19 Jul 2026
 10:11:33 -0700 (PDT)
Date: Sun, 19 Jul 2026 10:11:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a5d0545.5028b7d0.1f0bb.0246.GAE@google.com>
Subject: [syzbot] [dri?] linux-next test error: WARNING in drm_mode_config_validate
From: syzbot <syzbot+6245cb95ae707991bffa@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, louis.chauvet@bootlin.com, 
	maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com, mripard@kernel.org, 
	sfr@canb.auug.org.au, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    0718283ab28b Add linux-next specific files for 20260717
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D16351c32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D2f6d4fd2982f997=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D6245cb95ae707991b=
ffa
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/83fbf4236ddb/disk-=
0718283a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/53d15a8f3db7/vmlinux-=
0718283a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d826bc7a4a27/bzI=
mage-0718283a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+6245cb95ae707991bffa@syzkaller.appspotmail.com

smbdirect: subsystem loaded
Key type cifs.spnego registered
Key type cifs.idmap registered
ntfs3: Enabled Linux POSIX ACLs support
ntfs3: Read-only LZX/Xpress compression included
jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red Hat, Inc.
romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
QNX4 filesystem 0.2.3 registered.
qnx6: QNX6 filesystem 1.0.0 registered.
fuse: init (API version 7.45)
orangefs_debugfs_init: called with debug mask: :none: :0:
orangefs_init: module version upstream loaded
JFS: nTxBlock =3D 8192, nTxLock =3D 65536
SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no =
debug enabled
9p: Installing v9fs 9p2000 file system support
NILFS version 2 loaded
befs: version: 0.9.3
ocfs2: Registered cluster interface o2cb
ocfs2: Registered cluster interface user
OCFS2 User DLM kernel interface loaded
gfs2: GFS2 installed
ceph: loaded (mds proto 32)
NET: Registered PF_ALG protocol family
async_tx: api initialized (async)
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Asymmetric key parser 'pkcs8' registered
Key type pkcs7_test registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 239)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
raid6: skipped pq benchmark and selected avx2x4
input: Power Button as /devices/platform/LNXPWRBN:00/input/input0
ACPI: button: Power Button [PWRF]
input: Sleep Button as /devices/platform/LNXSLPBN:00/input/input1
ACPI: button: Sleep Button [SLPF]
ioatdma: Intel(R) QuickData Technology Driver 5.00
N_HDLC line discipline registered with maxframe=3D4096
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:02: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud =3D 115200) is a 16550A
00:03: ttyS1 I/O:0x2f8 (irq =3D 3, base_baud =3D 115200) is a 16550A
00:04: ttyS2 I/O:0x3e8 (irq =3D 6, base_baud =3D 115200) is a 16550A
00:05: ttyS3 I/O:0x2e8 (irq =3D 7, base_baud =3D 115200) is a 16550A
Non-volatile memory driver v1.3
usbcore: registered new interface driver xillyusb
ACPI: bus type drm_connector registered
[drm] Initialized vgem 1.0.0 for vgem on minor 0
------------[ cut here ]------------
[PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup
WARNING: drivers/gpu/drm/drm_mode_config.c:873 at validate_blend_mode_for_a=
lpha_formats drivers/gpu/drm/drm_mode_config.c:872 [inline], CPU#0: swapper=
/0/1
WARNING: drivers/gpu/drm/drm_mode_config.c:873 at drm_mode_config_validate+=
0x1c6a/0x1e60 drivers/gpu/drm/drm_mode_config.c:938, CPU#0: swapper/0/1
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full)=
=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 06/25/2026
RIP: 0010:validate_blend_mode_for_alpha_formats drivers/gpu/drm/drm_mode_co=
nfig.c:872 [inline]
RIP: 0010:drm_mode_config_validate+0x1cab/0x1e60 drivers/gpu/drm/drm_mode_c=
onfig.c:938
Code: 0f 85 ae 00 00 00 4d 8d 77 10 8b 6d 00 4c 89 f0 48 c1 e8 03 80 3c 18 =
00 74 08 4c 89 f7 e8 4d 08 a9 fc 49 8b 16 4c 89 ef 89 ee <67> 48 0f b9 3a e=
b 05 e8 39 fe 3a fc 49 bd 00 00 00 00 00 fc ff df
RSP: 0000:ffffc90000067810 EFLAGS: 00010246
RAX: 1ffff11004d63408 RBX: dffffc0000000000 RCX: ffff88801daeddc0
RDX: ffff8880268100e0 RSI: 0000000000000023 RDI: ffffffff9063bf50
RBP: 0000000000000023 R08: ffff888023a4e3ab R09: 1ffff11004749c75
R10: dffffc0000000000 R11: ffffed1004749c76 R12: dffffc0000000000
R13: ffffffff9063bf50 R14: ffff888026b1a040 R15: ffff888026b1a030
FS:  0000000000000000(0000) GS:ffff888124f37000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e946000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 drm_dev_register+0x7c/0xd80 drivers/gpu/drm/drm_drv.c:1075
 vkms_create+0x40d/0x4f0 drivers/gpu/drm/vkms/vkms_drv.c:208
 vkms_init+0x57/0x80 drivers/gpu/drm/vkms/vkms_drv.c:240
 do_one_initcall+0x250/0x870 init/main.c:1357
 do_initcall_level+0x10a/0x1a0 init/main.c:1419
 do_initcalls+0x59/0xa0 init/main.c:1435
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1670
 kernel_init+0x22/0x1d0 init/main.c:1560
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f 85 ae 00 00 00    	jne    0xb4
   6:	4d 8d 77 10          	lea    0x10(%r15),%r14
   a:	8b 6d 00             	mov    0x0(%rbp),%ebp
   d:	4c 89 f0             	mov    %r14,%rax
  10:	48 c1 e8 03          	shr    $0x3,%rax
  14:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
  18:	74 08                	je     0x22
  1a:	4c 89 f7             	mov    %r14,%rdi
  1d:	e8 4d 08 a9 fc       	call   0xfca9086f
  22:	49 8b 16             	mov    (%r14),%rdx
  25:	4c 89 ef             	mov    %r13,%rdi
  28:	89 ee                	mov    %ebp,%esi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 05                	jmp    0x36
  31:	e8 39 fe 3a fc       	call   0xfc3afe6f
  36:	49 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%r13
  3d:	fc ff df


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
