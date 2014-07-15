From: Jim Davis <jim.epost@gmail.com>
Subject: make mandocs fails with next-20140715
Date: Tue, 15 Jul 2014 14:15:18 -0700
Message-ID: <CA+r1Zhg9wwv6qUcRMWNBadE=dWFjbb45J+SwRpV7xg8AmgSEpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:65268 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbaGOVPU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2014 17:15:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rdunlap@infradead.org, linux-doc <linux-doc@vger.kernel.org>

jim@krebstar:~/linux2$ make mandocs
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/docproc
  DOCPROC Documentation/DocBook/z8530book.xml
  MAN     Documentation/DocBook/z8530book.9
Warn: AUTHOR sect.: no personblurb|contrib for Alan Cox

[... ]

Note: Writing spans_boundary.9
  DOCPROC Documentation/DocBook/device-drivers.xml
docproc: .//kernel/timer.c: No such file or directory
make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1
make: *** [mandocs] Error 2
