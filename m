From: Vinson Lee <vlee@twopensource.com>
Subject: next-20150918 build error "page-types.c:45:28: fatal error:
 api/fs/debugfs.h: No such file or directory"
Date: Thu, 17 Sep 2015 23:54:34 -0700
Message-ID: <CAHTgTXV=TAbwCKs2TG44MzPSNsqisrhmPLh=So+McYOjLZHw4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:32831 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbbIRGyf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2015 02:54:35 -0400
Received: by lbbvu2 with SMTP id vu2so20518881lbb.0
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2015 23:54:34 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi.

I get this tools build error with next-20150918.

$ make -C tools/vm
[...]
page-types.c:45:28: fatal error: api/fs/debugfs.h: No such file or directory
 #include <api/fs/debugfs.h>
                            ^

Cheers,
Vinson
