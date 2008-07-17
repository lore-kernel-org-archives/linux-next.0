From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: GFS2: new warnings in -next
Date: Thu, 17 Jul 2008 14:08:31 -0700
Message-ID: <1216328912.6029.18.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.169]:37113 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752453AbYGQVId (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 17:08:33 -0400
Received: by wf-out-1314.google.com with SMTP id 27so88030wfd.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 14:08:32 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>

Appeared in next-20080717

> fs/gfs2/ops_inode.c:1153:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1153:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1153:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1172:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1172:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1172:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1184:16: warning: incorrect type in initializer (different argument counts)
> fs/gfs2/ops_inode.c:1184:16:    expected int ( *permission )( ... )
> fs/gfs2/ops_inode.c:1184:16:    got int ( static [toplevel] *<noident> )( ... )
> fs/gfs2/ops_inode.c:1153: warning: initialization from incompatible pointer type
> fs/gfs2/ops_inode.c:1172: warning: initialization from incompatible pointer type
> fs/gfs2/ops_inode.c:1184: warning: initialization from incompatible pointer type

Cheers,

Harvey
