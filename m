From: Eric Paris <eparis@redhat.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 08:31:46 -0400
Message-ID: <1246365106.754.304.camel@dhcp235-23.rdu.redhat.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:47039 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752134AbZF3Mbq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 08:31:46 -0400
In-Reply-To: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>

On Tue, 2009-06-30 at 16:27 +0400, Alexander Beregalov wrote:
> Hi
> 
> kernel/audit_watch.c: In function 'audit_get_parent':
> kernel/audit_watch.c:85: error: implicit declaration of function
> 'fsnotify_get_mark'
> kernel/audit_watch.c: In function 'audit_put_parent':
> kernel/audit_watch.c:91: error: implicit declaration of function
> 'fsnotify_put_mark'
> kernel/audit_watch.c: In function 'audit_find_parent':
> kernel/audit_watch.c:104: error: implicit declaration of function
> 'fsnotify_find_mark_entry'
> kernel/audit_watch.c:104: warning: assignment makes pointer from
> integer without a cast
> kernel/audit_watch.c: In function 'audit_init_parent':
> kernel/audit_watch.c:161: error: implicit declaration of function
> 'fsnotify_init_mark'
> kernel/audit_watch.c:163: error: implicit declaration of function
> 'fsnotify_add_mark'
> kernel/audit_watch.c: In function 'audit_remove_parent_watches':
> kernel/audit_watch.c:354: error: implicit declaration of function
> 'fsnotify_destroy_mark_by_entry'
> kernel/audit_watch.c: In function 'audit_watch_should_send_event':
> kernel/audit_watch.c:513: warning: assignment makes pointer from
> integer without a cast
> kernel/audit_watch.c: In function 'audit_watch_init':
> kernel/audit_watch.c:578: error: implicit declaration of function
> 'fsnotify_obtain_group'
> kernel/audit_watch.c:579: warning: assignment makes pointer from
> integer without a cast

audit now depends on FSNOTIFY.  Will fix for tomorrow.  (and I'll try to
break audit_watches out to their own config option so you don't have to
have notification.

Sorry for the breakage.

-Eric
