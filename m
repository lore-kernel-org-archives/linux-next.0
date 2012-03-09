From: David Daney <david.daney@cavium.com>
Subject: Re: linux-next: toolchain version for mips builds, esp. cavium
Date: Fri, 09 Mar 2012 14:44:34 -0800
Message-ID: <4F5A87D2.5010100@cavium.com>
References: <CAP=VYLpk9RonUUWmnC2-7wPi7Oqra_y7K4qQNLfMYqNKMo8QMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail3.caviumnetworks.com ([12.108.191.235]:12747 "EHLO
	mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803Ab2CIWof (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 17:44:35 -0500
In-Reply-To: <CAP=VYLpk9RonUUWmnC2-7wPi7Oqra_y7K4qQNLfMYqNKMo8QMg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 03/09/2012 02:01 PM, Paul Gortmaker wrote:
> Hi Stephen,
>
> The linux-next builds for cavium defconfig have been failing for
> quite some time now, since it tries to use gcc-4.2 and the option
> for the octeon didn't appear until gcc-4.4 ("-march=octeon")
>
> http://kisskb.ellerman.id.au/kisskb/target/5509/
>
> I'm not sure there is any real "best" choice (hence I cc'd David
> and Ralf) but I just tested by grabbing the toolchain from here:

As you note, The OCTEON kernel build currently requires -march=octeon, 
this is not gratuitous.  There is some asm code in there that requires 
OCTEON support in the toolchain.  So currently an attempt to use a 
toolchain that doesn't support -march=octeon will fail.

So there are a couple of choices:

1) Use a modern toolchain.

2) Figure out how to patch the kernel such that a modern toolchain is 
not needed.

I don't really plan on working on #2.

David Daney

>
> ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.2/
>
> and it seems fine with building the cavium.  I'm not sure if the
> kisskb does per-target toolchain, or needs it per-arch, but I would
> suspect that the above is fine for all of mips anyway.
>
> What is the process for getting a different toolchain building the
> cavium in linux-next?
>
> Thanks,
> Paul.
>
