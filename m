From: Tero Saarni <tero.saarni@gmail.com>
Subject: Re: linux-next: input tree build warnings
Date: Sat, 13 Jun 2009 00:54:50 +0300
Message-ID: <1244843690.3224.10.camel@hp>
References: <20090612170536.109df1d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.155]:6699 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903AbZFLVyv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2009 17:54:51 -0400
In-Reply-To: <20090612170536.109df1d8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2009-06-12 at 17:05 +1000, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> drivers/input/evdev.c: In function 'evdev_do_ioctl':
> drivers/input/evdev.c:632: warning: comparison of distinct pointer types lacks a cast
> drivers/input/evdev.c:660: warning: comparison of distinct pointer types lacks a cast
> 
> Introduced by commit 61c7bfcdf5acee06f58b246d6615989134719d19 ("Input:
> synaptics - add support for reporting x/y resolution").

My mistake, thanks for the heads up!


Input: fix warning: comparison of distinct pointer types

Signed-off-by: Tero Saarni <tero.saarni@gmail.com>
---
 drivers/input/evdev.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 7e46b96..7e8d218 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -628,8 +628,9 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
                                abs.flat = dev->absflat[t];
                                abs.resolution = dev->absres[t];
 
-                               if (copy_to_user(p, &abs,
-                                               min(_IOC_SIZE(cmd), sizeof(struct input_absinfo))))
+                               if (copy_to_user(p, &abs, min_t(size_t,
+                                                               _IOC_SIZE(cmd),
+                                                               sizeof(struct input_absinfo))))
                                        return -EFAULT;
 
                                return 0;
@@ -656,8 +657,9 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 
                                t = _IOC_NR(cmd) & ABS_MAX;
 
-                               if (copy_from_user(&abs, p,
-                                               min(_IOC_SIZE(cmd), sizeof(struct input_absinfo))))
+                               if (copy_from_user(&abs, p, min_t(size_t,
+                                                               _IOC_SIZE(cmd),
+                                                               sizeof(struct input_absinfo))))
                                        return -EFAULT;
 
                                /*
-- 
1.6.0.4
