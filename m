Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49E3822B4
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640399; cv=none; b=Q7PKUtEYoiSZzISf1WZI3AZFupgKDld1wyOzS/LvlPlerrhD9y/TTnsCmCfHmyrKzTZCqbVwE1ZEu9wf8LKj4wkJfyms0UmEtkTZ1acFoKwUZw128CU+3+o2R5MEBrIvq3Ly+wQVGvnzLK07eYhuVoOkxtIKXSH1tWqIsKwiKdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640399; c=relaxed/simple;
	bh=1Lq2USKfo2oVjKFp28IDEZO1ti0+NvJ1DZDrzr7vfu4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UfObpzPHgy+gqGk06LpuL7lcD0n+BQtARHwgMBQl1faIq9daencPY9CFX4LsX115ZwrIxPh86zzMlcpDqeXa23sFPqTaKJOgjgIPRSUXrIkYIZjJQv6gZ/DTeLAiv5DBG5h3kwAfMFQwcccgXoumi9LLbFPBY/Rj+FP2oJ1lxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-486a299a1b4so15976341b6e.1
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 13:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640395; x=1782245195;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZhGdYpKsnXV2doBfHgYPgyLJtDvO7tH5XIiO29ZTTg=;
        b=iFNNfW+XAjJ9Gea0YOJ1svmVp6rnF68x/XRlppWlPdzrmlkp4eVP8mBqnQQzY0tkaW
         1G3O387Qvohlepg+0DFI7569F0XfbU3FUkOlRpFuaKxxgjib2CP9oGb2szaDmkWdLZ9E
         04butnRvyhZZK3dah2v4gfVY7lgsaQiLZ2mN5edOZ1eMMWWYhS2sQVtCzwnHae6PJ5Nh
         X2DOkceis2dgGj4n3wI8ob3/24qa4CSSl+SyhyTrGTNngqODcWVP3epryvYfHRTFqift
         /mXaTsd0Lfl+6Hjlfw61OWFqzrpllQE62pXn2UOe3+f9mcnXspUhckZNakv5to4Ld2O/
         7skQ==
X-Forwarded-Encrypted: i=1; AFNElJ94YITf3jlSImonG1s+ino86THAqL/GntKvrmZFY3wAdE+GeAy/PcdvG/AewGSnV0OGkm5tls9X6sC9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xZJNqD3WIiZFyEEC43z1nBYlAy424aRqHjQecvVhe61Or9rA
	wHrNSDkRFPEV2xGlxHBgWPJOAQDL9AUed5iZXWIYDOh5XKQ2XRZpMHRRz2RkoviPc67eqjyzN8I
	O5vVZgX+giB4O2bDU83w6fLWMdigL+zS0MgcsHR0yXTaAasneWIuwyS4Zd6g=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3022:b0:479:d16e:9619 with SMTP id
 5614622812f47-48942b3597fmr839112b6e.43.1781640395493; Tue, 16 Jun 2026
 13:06:35 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:06:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a31accb.dc986f81.2c135.0004.GAE@google.com>
Subject: [syzbot] linux-next build error (26)
From: syzbot <syzbot+1f14a35d0c73d31555e4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4fa3f5fabb30 Add linux-next specific files for 20260616
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13c134ae580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bf71f65d7d65ae1
dashboard link: https://syzkaller.appspot.com/bug?extid=1f14a35d0c73d31555e4
compiler:       Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f14a35d0c73d31555e4@syzkaller.appspotmail.com

error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
error[E0560]: struct `blk_mq_tag_set` has no field named `nr_hw_queues`
error[E0560]: struct `blk_mq_tag_set` has no field named `timeout`
error[E0560]: struct `blk_mq_tag_set` has no field named `numa_node`
error[E0560]: struct `blk_mq_tag_set` has no field named `queue_depth`
error[E0560]: struct `blk_mq_tag_set` has no field named `cmd_size`
error[E0560]: struct `blk_mq_tag_set` has no field named `flags`
error[E0560]: struct `blk_mq_tag_set` has no field named `driver_data`
error[E0560]: struct `blk_mq_tag_set` has no field named `nr_maps`
error[E0609]: no field `su_group` on type `configfs_subsystem`
error[E0609]: no field `su_mutex` on type `configfs_subsystem`
error[E0609]: no field `driver_data` on type `acpi_device_id`
error[E0609]: no field `id` on type `acpi_device_id`
error[E0609]: no field `parent` on type `bindings::device`
error[E0609]: no field `release` on type `bindings::device`
error[E0609]: no field `logical_block_size` on type `bindings::queue_limits`
error[E0609]: no field `physical_block_size` on type `bindings::queue_limits`
error[E0609]: no field `features` on type `bindings::queue_limits`
error[E0609]: no field `fops` on type `gendisk`
error[E0609]: no field `disk_name` on type `gendisk`

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
