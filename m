From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 19 Jun 2017 14:01:14 -0700
Message-ID: <CAGXu5j++TJ1uVhs3iWpPFrRtcOrpwdDXsH5Jb470Br9+id=9zg@mail.gmail.com>
References: <20170616113032.306720bf@canb.auug.org.au> <1497581467.17727.7.camel@gmail.com>
 <CAGXu5j+gcoqVT6sA-_Eu-Nm5P+58FuVfW=yof1ufpXaZeXC8zA@mail.gmail.com>
 <20170616133144.535aa23a@canb.auug.org.au> <20170619102307.32daa88d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:33021 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbdFSVBV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2017 17:01:21 -0400
Received: by mail-it0-f48.google.com with SMTP id g184so14207449ita.0
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2017 14:01:21 -0700 (PDT)
In-Reply-To: <20170619102307.32daa88d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Micay <danielmicay@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, Jun 18, 2017 at 5:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Stephen,
>
> On Fri, 16 Jun 2017 13:31:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Kees,
>>
>> On Thu, 15 Jun 2017 20:20:47 -0700 Kees Cook <keescook@google.com> wrote:
>> >
>> > I'm so confused -- isn't this in next? All the build tests I did were
>> > against yesterday's -next which includes this from what I can see...
>>
>> It is in next, but gets merged after the kspp tree ... so, this is when
>> inter-tree dependencies are a pain - I can merge the kspp tree later,
>> but then you have to remember which trees Linus must merge before you
>> send your pull request.  That's why we like to have all trees be
>> effectively stand alone (as much as possible).
>
> OK, for now I have moved the merging of the kspp tree to after
> everything else (except Andrew's quilt series).  This will
> (unfortunately) hide some dependencies between trees.

In the other thread Andrew asked that I just have it all go through
-mm, so I've removed it from KSPP and sent the series his way (with
you in Cc).

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
