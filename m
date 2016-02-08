From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: linux-next: Tree for Feb 8
Date: Mon, 8 Feb 2016 15:51:49 +0100
Message-ID: <CAKv+Gu_fyMkvStHL6_z=_CJW-c=0qcJ845HKne=+JytptXZ=MQ@mail.gmail.com>
References: <20160208161756.6809f31a@canb.auug.org.au>
	<20160208115611.GA10929@sudip-pc>
	<20160208144232.GA5984@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35227 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074AbcBHOvu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2016 09:51:50 -0500
Received: by mail-io0-f180.google.com with SMTP id d63so196782048ioj.2
        for <linux-next@vger.kernel.org>; Mon, 08 Feb 2016 06:51:49 -0800 (PST)
In-Reply-To: <20160208144232.GA5984@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steven Miao <realmz6@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, adi-buildroot-devel@lists.sourceforge.net, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>

On 8 February 2016 at 15:43, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> On Mon, Feb 08, 2016 at 05:26:11PM +0530, Sudip Mukherjee wrote:
>> On Mon, Feb 08, 2016 at 04:17:56PM +1100, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Changes since 20160205:
>>
>> My blackfin defconfig build fails with:
>>
>> kallsyms failure: relative symbol value 0xffa00000 out of range in
>> relative mode
>>
>> build log at:
>> https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707060
>>
>> and tilegx defconfig fails with:
>> kallsyms failure: relative symbol value 0xfffffff700020000 out of range
>> in relative mode
>>
>> build log at:
>> https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707069
>>
>> I will do a bisect later today to see which has caused this.
>
> Bisected. And -
> de9d2352a3c9 ("kallsyms: add support for relative offsets in kallsyms address table")
> is introducing the message of "kallsyms failure: relative symbol value .... "
> and 9b461d6a3ab9 ("scripts/link-vmlinux.sh: force error on kallsyms failure")
> is causing the build failure.
>
> Just reverting de9d2352a3c9 is fixing these build failures.
>
> Adding Cc to Andrew, Guenter, Ard and Kees.
>

Thanks for the report. I will follow up today with a fix
