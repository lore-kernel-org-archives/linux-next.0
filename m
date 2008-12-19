From: "Jaswinder Singh" <jaswinderlinux@gmail.com>
Subject: Firmware patches for DVB
Date: Sat, 20 Dec 2008 01:33:44 +0530
Message-ID: <3f9a31f40812191203v22401bb5j7a8809a5125de3ce__13188.5945717388$1229717236$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.175]:1087 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555AbYLSUDp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Dec 2008 15:03:45 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com, David Woodhouse <dwmw2@infradead.org>, Jaswinder Singh <jaswinder@infradead.org>LKML <linux->

Hello all,

These DVB's firmware patches are floating in linux-next from long time :

1. firmware: convert av7110 driver to request_firmware()
http://git.kernel.org/?p=linux/kernel/git/sfr/linux-next.git;a=commit;h=402669d75012c5f12c27b799145c10db79715f51
2. Remove fdump tool for av7110 firmware
http://git.kernel.org/?p=linux/kernel/git/sfr/linux-next.git;a=commit;h=43b0a12fa4ac50f6875ea5a238f9e9e26f3fe390

Should I need to resend these patches to merge main-stream.

Thank you,

Jaswinder Singh.
