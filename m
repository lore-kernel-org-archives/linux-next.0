From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next-20090630: audit/fsnotify build failure
Date: Tue, 30 Jun 2009 23:06:09 +0400
Message-ID: <a4423d670906301206o6caf4df1s1e1b15d0b7b94c6a@mail.gmail.com>
References: <a4423d670906300527w42557b9kf5a20e5b527fc1eb@mail.gmail.com>
	 <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:48190 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752514AbZF3TGH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 15:06:07 -0400
Received: by fxm18 with SMTP id 18so351806fxm.37
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2009 12:06:09 -0700 (PDT)
In-Reply-To: <1246384996.22562.19.camel@dhcp235-23.rdu.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>

2009/6/30 Eric Paris <eparis@redhat.com>:
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

Thanks Eric.
This config is not for a real kernel.
I just test randconfig build from time to time.
