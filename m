From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: VFIO compile failure on i386 allmodconfig in linux-next
Date: Thu, 28 Jun 2012 13:57:12 -0400
Message-ID: <20120628175712.GA20250@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:49444 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704Ab2F1R5P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jun 2012 13:57:15 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: alex.williamson@redhat.com
Cc: linux-next@vger.kernel.org

Hi Alex,

Just a heads up that the i386 allmodconfig failed on VFIO, in case
you didn't see it.

http://kisskb.ellerman.id.au/kisskb/buildresult/6603285/

arch/x86/include/asm/uaccess_32.h:211:26: error: call to 'copy_from_user_overflow' declared with attribute error: copy_from_user() buffer size is not provably correct
make[4]: *** [drivers/vfio/pci/vfio_pci_config.o] Error 1

Paul.
