From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Building tilegx defconfig gets init/exit section errors in xfs.
Date: Sun, 25 Mar 2012 14:20:35 -0400
Message-ID: <4F6F61F3.40903@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:36560 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756676Ab2CYSUq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Mar 2012 14:20:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, cmetcalf@tilera.com

Hi All,

Recently the tilegx defconfig was added to the linux-next build
coverage, which exposed this.
 
LD      .tmp_vmlinux1
`xfs_qm_exit' referenced in section `.init.text' of fs/built-in.o:
 defined in discarded section `.exit.text' of fs/built-in.o
make[1]: *** [.tmp_vmlinux1] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/5941293/

It seemed odd to me, since I didn't think there was anything arch
specific in the init/exit sectioning, so I thought I'd mention it
here, just in case it hasn't been brought up before.

Thanks,
Paul.
