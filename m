From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: linux-next tree addition request (fbdev)
Date: Wed, 24 Aug 2011 13:40:46 +0000
Message-ID: <4E54FF5E.5050308@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:36515 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751050Ab1HXNkv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Aug 2011 09:40:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>

Hi Stephen,

can you please add

    git://github.com/schandinat/linux-2.6.git fbdev-next

to linux-next. It collects patches for the frame buffer subsystem.
Can you please add the linux-fbdev@vger.kernel.org mailing list as additional
contact for warnings/errors/problems?

You probably want to drop Paul's fbdev branches as they contain some outdated
patches that will conflict with the newer versions.


Thanks,

Florian Tobias Schandinat
