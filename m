From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: Tree for Feb 12
Date: Sat, 13 Feb 2016 06:57:24 -0800
Message-ID: <CALCETrUWRJR5=4sXsg=KYX6mYRrXkvXSOgccX+PVQa7dHXQYxw@mail.gmail.com>
References: <20160212162035.1e0260cd@canb.auug.org.au> <20160212060241.GA1390@sudip-pc>
 <20160213074935.GA27448@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35670 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243AbcBMO5o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Feb 2016 09:57:44 -0500
Received: by mail-ob0-f175.google.com with SMTP id xk3so158927730obc.2
        for <linux-next@vger.kernel.org>; Sat, 13 Feb 2016 06:57:44 -0800 (PST)
In-Reply-To: <20160213074935.GA27448@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>

On Fri, Feb 12, 2016 at 11:49 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Feb 12, 2016 at 11:32:42AM +0530, Sudip Mukherjee wrote:
>> On Fri, Feb 12, 2016 at 04:20:35PM +1100, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Changes since 20160211:
>>
>> since last few days with gcc-4.6.3, x86_64 and i386 defconfig and
>> allmodconfig builds are failing with the error:
>> "arch/x86/include/asm/tlbflush.h:26:18: error: memory input 0 is not
>> directly addressable"
>>
>> But with gcc-4.8.2 and later it builds fine. Should I try to bisect and
>> find the problem or its not worth for gcc-4.6.3 ?
>>
> Bisect log attached. Looks like older versions of gcc (or at least 4.6.3)
> don't like the newly introduced __invpcid().
>
> Guenter
>
> ---
> # bad: [64d9a3617b3b8bc0734ba97caeb433b7019c6187] Add linux-next specific files for 20160212
> # good: [388f7b1d6e8ca06762e2454d28d6c3c55ad0fe95] Linux 4.5-rc3
> git bisect start 'HEAD' 'v4.5-rc3'
> # good: [597dc9d36e8bc04941b61b26ac7aa3f8a33aba53] Merge remote-tracking branch 'sound-asoc/for-next'
> git bisect good 597dc9d36e8bc04941b61b26ac7aa3f8a33aba53
> # bad: [91fe8ea815243ec595753ccf7e14126b6f87f2bf] Merge remote-tracking branch 'usb-chipidea-next/ci-for-usb-next'
> git bisect bad 91fe8ea815243ec595753ccf7e14126b6f87f2bf
> # bad: [1d6796e67f265e835bcb1a19d27ba0433dbd75e4] Merge remote-tracking branch 'tip/auto-latest'
> git bisect bad 1d6796e67f265e835bcb1a19d27ba0433dbd75e4
> # good: [4abecd5aab4960c786530db5ce4ca332ceba2b73] Merge branch 'x86/microcode'
> git bisect good 4abecd5aab4960c786530db5ce4ca332ceba2b73
> # good: [84d5092d655bc9532c5fc88e7b2308090889187d] Merge remote-tracking branch 'kgdb/kgdb-next'
> git bisect good 84d5092d655bc9532c5fc88e7b2308090889187d
> # good: [e4e0cfcfc9fd3885ff7dadfb5a4b553495d011e4] Merge remote-tracking branch 'iommu/next'
> git bisect good e4e0cfcfc9fd3885ff7dadfb5a4b553495d011e4
> # good: [e908e75fc3833b413837aca4667db96c372c843e] Merge remote-tracking branch 'spi/topic/ti-qspi' into spi-next
> git bisect good e908e75fc3833b413837aca4667db96c372c843e
> # good: [88e2211191dabe9ae2a953d5a4326d3e4b7f2901] Merge remote-tracking branch 'trivial/for-next'
> git bisect good 88e2211191dabe9ae2a953d5a4326d3e4b7f2901
> # good: [d12a72b844a49d4162f24cefdab30bed3f86730e] x86/mm: Add a 'noinvpcid' boot option to turn off INVPCID
> git bisect good d12a72b844a49d4162f24cefdab30bed3f86730e
> # good: [a135746b7d4386c17290e0344440101d037e86f8] Merge remote-tracking branch 'dt-rh/for-next'
> git bisect good a135746b7d4386c17290e0344440101d037e86f8
> # bad: [ce1143aa60273220a9f89012f2aaaed04f97e9a2] x86/dmi: Switch dmi_remap() from ioremap() [uncached] to ioremap_cache()
> git bisect bad ce1143aa60273220a9f89012f2aaaed04f97e9a2
> # bad: [d8bced79af1db6734f66b42064cc773cada2ce99] x86/mm: If INVPCID is available, use it to flush global mappings
> git bisect bad d8bced79af1db6734f66b42064cc773cada2ce99
> # first bad commit: [d8bced79af1db6734f66b42064cc773cada2ce99] x86/mm: If INVPCID is available, use it to flush global mappings

I think Borislav's patch should fix this.

--Andy

-- 
Andy Lutomirski
AMA Capital Management, LLC
