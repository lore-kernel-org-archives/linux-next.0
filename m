From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 0/2] x86,vdso: vdso build fixes and improvements
Date: Thu, 29 May 2014 18:41:36 -0400
Message-ID: <5387B7A0.3030302@windriver.com>
References: <CALCETrXef77JLoEp5hCXSdMAk7usWsL-sUG6NrcgLgrz3krfag@mail.gmail.com> <cover.1401400316.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:55327 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbaE2Wlx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 18:41:53 -0400
In-Reply-To: <cover.1401400316.git.luto@amacapital.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On 14-05-29 05:57 PM, Andy Lutomirski wrote:
> Patch 1 causes make;make to behave similarly to make if vdso2c fails.
> Patch 2 hopefully fixes x86 crossbuilds on big-endian machines.  I don't
> have a big-endian machine to test on, though.

Since the x86 builds are unconditionally failing as-is now in
linux-next, perhaps Stephen [Cc'd] can layer these on the top of
the tree he'll be making within the next couple of hours to give
them a big-endian test.

Paul.
--

> 
> Andy Lutomirski (2):
>   x86,vdso: When vdso2c fails, unlink the output
>   x86,vdso: Fix cross-compilation from big-endian architectures
> 
>  arch/x86/vdso/vdso2c.c | 35 ++++++++++++++++++-------
>  arch/x86/vdso/vdso2c.h | 69 ++++++++++++++++++++++++++------------------------
>  2 files changed, 62 insertions(+), 42 deletions(-)
> 
