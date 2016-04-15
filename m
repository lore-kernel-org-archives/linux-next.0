From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: Re: binary execution from DAX mount hang since next-20160407
Date: Fri, 15 Apr 2016 14:13:21 +0800
Message-ID: <CADJHv_uddEvHe0PfYnJPsyUUO=Ud5CdBNeqQOz4aB8_1cMJw2A@mail.gmail.com>
References: <CADJHv_sawA8SXviUX6My5MKeqWMLbWLG=DrM7RCgrjkjGj2f5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35254 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbcDOGNX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Apr 2016 02:13:23 -0400
In-Reply-To: <CADJHv_sawA8SXviUX6My5MKeqWMLbWLG=DrM7RCgrjkjGj2f5Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hugh Dickins <hughd@google.com>, Linux-Next <linux-next@vger.kernel.org>
Cc: linux-nvdimm@lists.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>

# cat /proc/cmdline
BOOT_IMAGE=/vmlinuz-4.6.0-rc3-next-20160414+
root=/dev/mapper/xxxxx--01-root ro crashkernel=auto
rd.lvm.lv=xxxxx-01/root rd.lvm.lv=xxxxxx/swap console=ttyS1,115200n81
memmap=10G!5G memmap=15G!15G selinux=0 LANG=en_US.UTF-8

# mkfs.ext4 -V
mke2fs 1.43-WIP (15-Mar-2016)
Using EXT2FS Library version 1.43-WIP

# mkfs.xfs -V
mkfs.xfs version 4.5.0


....
