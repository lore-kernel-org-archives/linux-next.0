From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: commit "GFS2: Clean up log write code path" breakage
Date: Wed, 18 Apr 2012 21:26:10 -0400
Message-ID: <CAP=VYLoD6yLQkLO0Q=wGQ5yag9e9qw-5iwHLGgcck60Efy5-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:52676 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750976Ab2DSB0m (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Apr 2012 21:26:42 -0400
Received: by lahj13 with SMTP id j13so6201960lah.19
        for <linux-next@vger.kernel.org>; Wed, 18 Apr 2012 18:26:41 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: swhiteho@redhat.com
Cc: linux-next@vger.kernel.org, cluster-devel@redhat.com

Hi Steven,

When you have a chance can you look at this? Git bisect says that
this commit:

----------
commit e80623efc450fb615d1496774c8d5c063a50fb3a
Author: Steven Whitehouse <swhiteho@redhat.com>
Date:   Mon Apr 16 09:28:31 2012 +0100

    GFS2: Clean up log write code path
----------

has caused the failure seen in several allmodconfigs (sparc, m68k).

fs/gfs2/lops.c:379:42: error: request for member 'virtual' in
something not a structure or union
make[3]: *** [fs/gfs2/lops.o] Error 1

Here are some examples:

http://kisskb.ellerman.id.au/kisskb/buildresult/6131431/
http://kisskb.ellerman.id.au/kisskb/buildresult/6131694/
http://kisskb.ellerman.id.au/kisskb/buildresult/6131511/

Thanks,
Paul.
