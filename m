From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 16:27:49 +0400
Message-ID: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:59446 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846AbZF3M1s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 08:27:48 -0400
Received: by fxm18 with SMTP id 18so92748fxm.37
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2009 05:27:50 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Eric Paris <eparis@redhat.com>

Hi

kernel/audit_watch.c: In function 'audit_get_parent':
kernel/audit_watch.c:85: error: implicit declaration of function
'fsnotify_get_mark'
kernel/audit_watch.c: In function 'audit_put_parent':
kernel/audit_watch.c:91: error: implicit declaration of function
'fsnotify_put_mark'
kernel/audit_watch.c: In function 'audit_find_parent':
kernel/audit_watch.c:104: error: implicit declaration of function
'fsnotify_find_mark_entry'
kernel/audit_watch.c:104: warning: assignment makes pointer from
integer without a cast
kernel/audit_watch.c: In function 'audit_init_parent':
kernel/audit_watch.c:161: error: implicit declaration of function
'fsnotify_init_mark'
kernel/audit_watch.c:163: error: implicit declaration of function
'fsnotify_add_mark'
kernel/audit_watch.c: In function 'audit_remove_parent_watches':
kernel/audit_watch.c:354: error: implicit declaration of function
'fsnotify_destroy_mark_by_entry'
kernel/audit_watch.c: In function 'audit_watch_should_send_event':
kernel/audit_watch.c:513: warning: assignment makes pointer from
integer without a cast
kernel/audit_watch.c: In function 'audit_watch_init':
kernel/audit_watch.c:578: error: implicit declaration of function
'fsnotify_obtain_group'
kernel/audit_watch.c:579: warning: assignment makes pointer from
integer without a cast


$ egrep "NOTIFY|AUDIT" .config
CONFIG_AUDIT_ARCH=y
CONFIG_AUDIT=y
# CONFIG_AUDITSYSCALL is not set
# CONFIG_FSNOTIFY is not set
CONFIG_INOTIFY=y
