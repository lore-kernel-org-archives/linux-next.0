From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: Re: [tip:x86/vdso] x86, vdso: Reimplement vdso.so preparation in
 build-time C
Date: Thu, 29 May 2014 15:43:17 -0400
Message-ID: <CA+5PVA6m4tauyVpHQsTNeaEo08hWquVaOuWhrbuByxVVJMn_-A@mail.gmail.com>
References: <2c4fcf45524162a34d87fdda1eb046b2a5cecee7.1399317206.git.luto@amacapital.net>
	<tip-6f121e548f83674ab4920a4e60afb58d4f61b829@git.kernel.org>
	<CAP=VYLrzMP23B9NVnu4N3NYsoU+ai1K9HpAE_eXQzXESUUZ-Lg@mail.gmail.com>
	<CALCETrWuHGnekoYZKJ6DAGtE8fQRMiPz590VQGctunvgee+uuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:40759 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932342AbaE2TnR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 15:43:17 -0400
In-Reply-To: <CALCETrWuHGnekoYZKJ6DAGtE8fQRMiPz590VQGctunvgee+uuA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "H. Peter Anvin" <hpa@linux.intel.com>, "linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, May 29, 2014 at 3:32 PM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Thu, May 29, 2014 at 12:17 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> On Mon, May 5, 2014 at 6:25 PM, tip-bot for Andy Lutomirski
>> <tipbot@zytor.com> wrote:
>>> Commit-ID:  6f121e548f83674ab4920a4e60afb58d4f61b829
>>> Gitweb:     http://git.kernel.org/tip/6f121e548f83674ab4920a4e60afb58d4f61b829
>>> Author:     Andy Lutomirski <luto@amacapital.net>
>>> AuthorDate: Mon, 5 May 2014 12:19:34 -0700
>>> Committer:  H. Peter Anvin <hpa@linux.intel.com>
>>> CommitDate: Mon, 5 May 2014 13:18:51 -0700
>>>
>>> x86, vdso: Reimplement vdso.so preparation in build-time C
>>
>> Just a heads up in case it hasn't been mentioned already;
>> the x86 builds in linux-next which IIRC are done as cross
>> compile on a powerpc box are failing as follows:
>>
>>   VDSO2C  arch/x86/vdso/vdso-image-64.c
>> /bin/sh: line 1: 15995 Segmentation fault      arch/x86/vdso/vdso2c
>> arch/x86/vdso/vdso64.so.dbg arch/x86/vdso/vdso-image-64.c
>> make[3]: *** [arch/x86/vdso/vdso-image-64.c] Error 139
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/11265454/
>>
>
> Egads.  This wouldn't be a big-endian host by any chance?

Likely if it's really a cross compile on a powerpc machine.  Virtually
all existing powerpc machines are big-endian.

josh
