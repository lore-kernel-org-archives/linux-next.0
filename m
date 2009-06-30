From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 12:06:48 -0700
Message-ID: <4A4A6248.90706@oracle.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com> <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:46414 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826AbZF3THJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 15:07:09 -0400
In-Reply-To: <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next <linux-next@vger.kernel.org>

Eric Paris wrote:
> On Tue, 2009-06-30 at 16:27 +0400, Alexander Beregalov wrote:
>> Hi
>>
>> kernel/audit_watch.c: In function 'audit_get_parent':
>> kernel/audit_watch.c:85: error: implicit declaration of function
>> 'fsnotify_get_mark'
> 
> Should be fixed for you by:
> 
> http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=aae48cb2b8719e8a374faea141373b7ce0b89bc6
> http://git.infradead.org/users/eparis/notify.git?a=commitdiff;h=de85e5bc3690c3063aea790279e898adb5bac0ba
> 
>> $ egrep "NOTIFY|AUDIT" .config
>> CONFIG_AUDIT_ARCH=y
>> CONFIG_AUDIT=y
>> # CONFIG_AUDITSYSCALL is not set
>> # CONFIG_FSNOTIFY is not set
>> CONFIG_INOTIFY=y
> 
> Unrelated note, CONFIG_INOTIFY in linux-next is completely and totally
> useless.....

Please explain.
Looks like it still controls building fs/notify/inotify/inotify.o,
based on fs/notify/inotify/Makefile.

-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
