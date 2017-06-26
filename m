From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 26 Jun 2017 11:19:15 -0700
Message-ID: <CAGXu5jLneuMbmEOvYNKU1Q0wwe55uV7hCzQ+jCGFQ35_Zd=eeA@mail.gmail.com>
References: <20170620145655.4b7f3efb@canb.auug.org.au> <fbcb7bd9-ca6e-eab1-350e-974c9df2875a@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34459 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751335AbdFZSTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2017 14:19:16 -0400
Received: by mail-io0-f174.google.com with SMTP id r36so5482014ioi.1
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2017 11:19:16 -0700 (PDT)
In-Reply-To: <fbcb7bd9-ca6e-eab1-350e-974c9df2875a@canonical.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: John Johansen <john.johansen@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 19, 2017 at 10:39 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 06/19/2017 09:56 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the kspp tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> security/apparmor/file.c: In function 'aa_path_link':
>> security/apparmor/file.c:475:23: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path link = { new_dir->mnt, new_dentry };
>>                        ^
>> security/apparmor/file.c:475:23: note: (near initialization for 'link')
>> security/apparmor/file.c:475:37: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path link = { new_dir->mnt, new_dentry };
>>                                      ^
>> security/apparmor/file.c:475:37: note: (near initialization for 'link')
>> security/apparmor/file.c:476:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path target = { new_dir->mnt, old_dentry };
>>                          ^
>> security/apparmor/file.c:476:25: note: (near initialization for 'target')
>> security/apparmor/file.c:476:39: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path target = { new_dir->mnt, old_dentry };
>>                                        ^
>> security/apparmor/file.c:476:39: note: (near initialization for 'target')
>>
>> Caused by commit
>>
>>   1a12979f61e4 ("randstruct: Mark various structs for randomization")
>>
>> interacting with commit
>>
>>   8014370f1257 ("apparmor: move path_link mediation to using labels")
>>
>> from the security tree.
>>
>> I added the following merge fix patch for today:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 20 Jun 2017 14:50:36 +1000
>> Subject: [PATCH] apparmor: put back designators in struct initialisers
>>
>> Fixes: 8014370f1257 ("apparmor: move path_link mediation to using labels")
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Acked-by: John Johansen <john.johansen@canonical.com>

Hi James,

Just a ping; this needs to get into -next to avoid build errors.
Please consider it also:

Acked-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
