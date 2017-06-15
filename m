From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 08:19:46 -0700
Message-ID: <CAGXu5jK0o1xJRZ6XZpM0hLrOnHUn-9JG=ZYwkk94axHrx_t67g@mail.gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au> <20170615113548.3e4edcf4@canb.auug.org.au>
 <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
 <20170615120631.121c6c9b@canb.auug.org.au> <CAGXu5jK2N349VCRb6ROAa=mMvF7bPqjEs3HofXVjzPQqWzRD3A@mail.gmail.com>
 <1497496709.1435.7.camel@gmail.com> <87k24dpzer.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:37407 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752409AbdFOPTr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2017 11:19:47 -0400
Received: by mail-it0-f42.google.com with SMTP id m47so12785860iti.0
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2017 08:19:47 -0700 (PDT)
In-Reply-To: <87k24dpzer.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Daniel Micay <danielmicay@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

]

On Wed, Jun 14, 2017 at 10:56 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Daniel Micay <danielmicay@gmail.com> writes:
>> ...
>>
>> The arch mailing list was pinged about this which is how the powerpc
>> folks got involved and fixed the issues there, including at least one
>> runtime one. Not sure where (if anywhere) those are queued up, but Kees
>> could pick those up too.
>
> I was expecting Kees to pick them up.

Okay, cool. I'll get them into the kspp tree.

-Kees

-- 
Kees Cook
Pixel Security
