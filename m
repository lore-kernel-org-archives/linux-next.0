From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 29 Apr 2016 08:26:25 +0200
Message-ID: <20160429062625.GA27916@gmail.com>
References: <20160429161248.7e17f45b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32803 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753190AbcD2G0a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2016 02:26:30 -0400
Content-Disposition: inline
In-Reply-To: <20160429161248.7e17f45b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Ard Biesheuvel <ard.biesheuvel@linaro.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/efi.h
> 
> between commit:
> 
>   2c23b73c2d02 ("Ard Biesheuvel <ard.biesheuvel@linaro.org>")
> 
> from the tip tree and commit:
> 
>   9f2c36a7b097 ("include/linux/efi.h: redefine type, constant, macro from generic code")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Btw., while looking at this, I noticed that akpm-current introduced this namespace 
collision:

include/acpi/acconfig.h:#define UUID_STRING_LENGTH          36  /* Total length of a UUID string */
include/linux/uuid.h:#define    UUID_STRING_LEN         36

I suspect the include/acpi/acconfig.h define should be renamed:

	UUID_STRING_LENGTH -> ACPI_UUID_STRING_LENGTH
	UUID_BUFFER_LENGTH -> ACPI_UUID_BUFFER_LENGTH

... before the collision causes any trouble.

Thanks,

	Ingo
