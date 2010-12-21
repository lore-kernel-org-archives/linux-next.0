From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Tue, 21 Dec 2010 09:44:40 +0100
Message-ID: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:34960 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153Ab0LUIol (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2010 03:44:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@kernel.dk>
Cc: systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com

Against linux-next (next-20101210) it should look like:

$ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
--- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
 2010-12-21 09:31:38.649601964 +0100
+++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
 2010-12-21 09:40:21.151033232 +0100
@@ -83,7 +83,7 @@
                inode->i_size = 0;
                inode->i_fop = &cgroup_file_operations;
        }
--      dentry->d_op = &cgroup_dops;
+-      d_set_d_op(dentry, &cgroup_dops);
        d_instantiate(dentry, inode);
        dget(dentry);   /* Extra count - pin the dentry in core */
        return 0;

- Sedat -
