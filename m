From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Feb 12
Date: Sun, 14 Feb 2016 00:25:24 +0530
Message-ID: <56BF7C1C.8080407@gmail.com>
References: <20160212162035.1e0260cd@canb.auug.org.au> <20160212060241.GA1390@sudip-pc> <20160213074935.GA27448@roeck-us.net> <CALCETrUWRJR5=4sXsg=KYX6mYRrXkvXSOgccX+PVQa7dHXQYxw@mail.gmail.com> <20160213155028.GA17704@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:32850 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbcBMSzg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Feb 2016 13:55:36 -0500
In-Reply-To: <20160213155028.GA17704@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@amacapital.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>

On Saturday 13 February 2016 09:20 PM, Borislav Petkov wrote:
> On Sat, Feb 13, 2016 at 06:57:24AM -0800, Andy Lutomirski wrote:
>> I think Borislav's patch should fix this.
>
> Yeah, guys, can you give it a try:
>
> https://lkml.kernel.org/r/20160210145116.GF23914@pd.tnic

Its late night in our time so I could only test with i386 defconfig and 
it builds fine with gcc-4.6.3

regards
sudip
