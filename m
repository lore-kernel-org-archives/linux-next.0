From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the x86 tree
Date: Wed, 3 Jun 2009 17:18:30 +1000
Message-ID: <20090603171830.b2f80b02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42104 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753263AbZFCHSb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 03:18:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Jan Blunck <jblunck@suse.de>, Dmitry Adamushko <dmitry.adamushko@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
arch/x86/kernel/microcode_core.c between commit
871b72dd1e12afc3f024479531d25a9339d2e3f9 ("x86: microcode: use
smp_call_function_single instead of set_cpus_allowed, cleanup of
synchronization logic") from the x86 tree and commit
3b5f472624ad5b54753388bb3c563a8f308eed88 ("Driver Core: misc: add
nodename support for misc devices") from the driver-core tree.

Just white space changes overlapping an addition.  I fixed it up (see
below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/microcode_core.c
index 9c44615,75bb914..0000000
--- a/arch/x86/kernel/microcode_core.c
+++ b/arch/x86/kernel/microcode_core.c
@@@ -234,9 -171,10 +234,10 @@@ static const struct file_operations mic
  };
  
  static struct miscdevice microcode_dev = {
 -	.minor		= MICROCODE_MINOR,
 -	.name		= "microcode",
 -	.devnode	= "cpu/microcode",
 -	.fops		= &microcode_fops,
 +	.minor			= MICROCODE_MINOR,
 +	.name			= "microcode",
++	.devnode		= "cpu/microcode",
 +	.fops			= &microcode_fops,
  };
  
  static int __init microcode_dev_init(void)
