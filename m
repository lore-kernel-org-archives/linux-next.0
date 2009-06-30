From: Eric Paris <eparis@redhat.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 15:17:56 -0400
Message-ID: <1246389476.22562.24.camel@dhcp235-23.rdu.redhat.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
	 <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
	 <4A4A6248.90706@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:45936 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752959AbZF3TR7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 15:17:59 -0400
In-Reply-To: <4A4A6248.90706@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next <linux-next@vger.kernel.org>

On Tue, 2009-06-30 at 12:06 -0700, Randy Dunlap wrote:
> Eric Paris wrote:
> > On Tue, 2009-06-30 at 16:27 +0400, Alexander Beregalov wrote:
> >> Hi
> >>
> >> kernel/audit_watch.c: In function 'audit_get_parent':
> >> kernel/audit_watch.c:85: error: implicit declaration of function
> >> 'fsnotify_get_mark'
> > 
> > Should be fixed for you by:
> > 
> > http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=aae48cb2b8719e8a374faea141373b7ce0b89bc6
> > http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=de85e5bc3690c3063aea790279e898adb5bac0ba
> > 
> >> $ egrep "NOTIFY|AUDIT" .config
> >> CONFIG_AUDIT_ARCH=y
> >> CONFIG_AUDIT=y
> >> # CONFIG_AUDITSYSCALL is not set
> >> # CONFIG_FSNOTIFY is not set
> >> CONFIG_INOTIFY=y
> > 
> > Unrelated note, CONFIG_INOTIFY in linux-next is completely and totally
> > useless.....
> 
> Please explain.
> Looks like it still controls building fs/notify/inotify/inotify.o,
> based on fs/notify/inotify/Makefile.

Which in turn is used by nothing.  Although it is EXPORT_SYMBOL_GPL, so
you could have some out of tree module that uses it, but I haven't found
one....
