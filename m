From: Jiri Slaby <jirislaby@gmail.com>
Subject: writable limits into -next
Date: Mon, 19 Jul 2010 18:54:28 +0200
Message-ID: <4C448344.9020807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36283 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688Ab0GSQyb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2010 12:54:31 -0400
Received: by bwz1 with SMTP id 1so2401225bwz.19
        for <linux-next@vger.kernel.org>; Mon, 19 Jul 2010 09:54:29 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hello,

could I ask you to include wrlimits tree into the -next. I refactored it
according to comments and will try to merge it on my own (as nobody is
willing to merge it apparently).

It's at:
git://decibel.fi.muni.cz/~xslaby/linux#writable_limits

There will be merge conflicts in unistd files with "unistd: add
__NR_prlimit64 syscall numbers". You can take a look at
http://decibel.fi.muni.cz/cgi-bin/gitweb.cgi?p=mm.git;a=shortlog;h=refs/heads/devel
to see how it looks like in -next.

thanks,
-- 
js
