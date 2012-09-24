From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH -next] MIPS: ptrace: Add missing #include <asm/syscall.h>
Date: Mon, 24 Sep 2012 11:23:40 -0700
Message-ID: <5060A52C.1050504@gmail.com>
References: <1347913216-11140-1-git-send-email-geert@linux-m68k.org> <20120923173609.GE13842@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33657 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755537Ab2IXSXo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Sep 2012 14:23:44 -0400
Received: by pbbrr4 with SMTP id rr4so7613845pbb.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 11:23:43 -0700 (PDT)
In-Reply-To: <20120923173609.GE13842@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org, linux-next@vger.kernel.org

On 09/23/2012 10:36 AM, Ralf Baechle wrote:
> On Mon, Sep 17, 2012 at 10:20:16PM +0200, Geert Uytterhoeven wrote:
>
>> arch/mips/kernel/ptrace.c: In function =E2=80=98syscall_trace_enter=E2=
=80=99:
>> arch/mips/kernel/ptrace.c:664: error: implicit declaration of functi=
on =E2=80=98__syscall_get_arch=E2=80=99
>> make[2]: *** [arch/mips/kernel/ptrace.o] Error 1
>
> Thanks, I already had fixed that in the linux-trace tree; the latest
> version just had not yet propagated yet to the other trees.
>

It is still not on mips-for-linux-next.  Perhaps we should arrange for=20
it to be there, so that the actual propagation may commence.

David Daney
