From: Guenter Roeck <private@roeck-us.net>
Subject: arc build failures in -next due to ARCv2 patch
Date: Fri, 26 Jun 2015 16:58:49 -0700
Message-ID: <558DE739.4020804@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60372 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755236AbbFZX6w (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2015 19:58:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Vineet Gupta <vgupta@synopsys.com>

Hi,

my arc test builds in -next now fail with

cc1: error: unrecognized command line option "-mno-ll64"
make[2]: *** [scripts/mod/empty.o] Error 1
make[1]: *** [scripts/mod] Error 2
make[1]: *** Waiting for unfinished jobs....
cc1: error: unrecognized command line option "-mno-ll64"
make[1]: *** [kernel/bounds.s] Error 1

due to commit 'ARCv2: Support for ARCv2 ISA and HS38x cores'.

This is with gcc 4.8.3 built from buildroot.

Do I now need a new compiler / toolchain to build the kernel ?
Any chance to make this change compatible to work with older
compilers ?

Thanks,
Guenter
