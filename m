From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH V3 0/2] Squashfs: Add support for LZMA compressed
 filesystems
Date: Wed, 13 Jan 2010 20:18:50 +0000
Message-ID: <4b4e2aaa.CMX8OUQixp12onkQ%phillip@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from anchor-post-2.mail.demon.net ([195.173.77.133]:39210 "EHLO
	anchor-post-2.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756255Ab0AMUUL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jan 2010 15:20:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: phillip.lougher@gmail.com

Hi

This is a respin of two of my Squashfs LZMA decompression support patches
(in linux-next).  These patches have been updated to accommodate the
addition of the lzo decompressor to the mainline kernel.

lzma: Make lzma available to non initramfs/initrd code
lzma: make lzma reentrant

Changes: a new unlzo_mm.h file has been added.

Thanks

Phillip
