From: Kees Cook <keescook@chromium.org>
Subject: Re: randconfig build error with next-20141113, in fs/pstore/inode.c
Date: Thu, 13 Nov 2014 11:21:18 -0800
Message-ID: <CAGXu5jLsd3G3+PCwFSUGDxxbfnJwx8G8X4chH0WK21-kv+_ecA@mail.gmail.com>
References: <CA+r1ZhjO=kxcyjRb3=d7ozZ_VT9a+iCUy27zPZ2WGVMMzP6OVA@mail.gmail.com>
	<3908561D78D1C84285E8C5FCA982C28F3292CD43@ORSMSX114.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:52759 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754164AbaKMTVT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2014 14:21:19 -0500
Received: by mail-ob0-f179.google.com with SMTP id m8so11369542obr.38
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2014 11:21:19 -0800 (PST)
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F3292CD43@ORSMSX114.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "yath@yath.de" <yath@yath.de>, "ccross@android.com" <ccross@android.com>, "anton@enomsg.org" <anton@enomsg.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>

On Thu, Nov 13, 2014 at 11:18 AM, Luck, Tony <tony.luck@intel.com> wrote:
>> Building with the attached random configuration file,
>>
>> fs/built-in.o: In function `pstore_check_syslog_permissions':
>> inode.c:(.text+0x13a1bd): undefined reference to `check_syslog_permissions'
>> make: *** [vmlinux] Error 1
>
> Sebastian,
>
> This looks to come from your "Honor dmesg_restrict sysctl on dmesg dumps" patch
>
> The randconfig doesn't have CONFIG_PRINTK.  I guess we need to provide a stub
> in <linux/syslog.h> to cover this.

Without CONFIG_PRINTK, check_syslog_permissions should probably fail.

-Kees

-- 
Kees Cook
Chrome OS Security
