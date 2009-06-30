From: Eric Paris <eparis@redhat.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 14:03:16 -0400
Message-ID: <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46332 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752435AbZF3SD3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 14:03:29 -0400
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

Should be fixed for you by:

http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=aae48cb2b8719e8a374faea141373b7ce0b89bc6
http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=de85e5bc3690c3063aea790279e898adb5bac0ba

> $ egrep "NOTIFY|AUDIT" .config
> CONFIG_AUDIT_ARCH=y
> CONFIG_AUDIT=y
> # CONFIG_AUDITSYSCALL is not set
> # CONFIG_FSNOTIFY is not set
> CONFIG_INOTIFY=y

Unrelated note, CONFIG_INOTIFY in linux-next is completely and totally
useless.....

-Eric
