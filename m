From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH -next] MIPS: ptrace: Add missing #include <asm/syscall.h>
Date: Sun, 23 Sep 2012 19:36:09 +0200
Message-ID: <20120923173609.GE13842@linux-mips.org>
References: <1347913216-11140-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([78.24.191.182]:52890 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119Ab2IWRgP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 23 Sep 2012 13:36:15 -0400
Received: from localhost.localdomain ([127.0.0.1]:34084 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S1903364Ab2IWRgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Sep 2012 19:36:12 +0200
Content-Disposition: inline
In-Reply-To: <1347913216-11140-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mips@linux-mips.org, linux-next@vger.kernel.org

On Mon, Sep 17, 2012 at 10:20:16PM +0200, Geert Uytterhoeven wrote:

> arch/mips/kernel/ptrace.c: In function =E2=80=98syscall_trace_enter=E2=
=80=99:
> arch/mips/kernel/ptrace.c:664: error: implicit declaration of functio=
n =E2=80=98__syscall_get_arch=E2=80=99
> make[2]: *** [arch/mips/kernel/ptrace.o] Error 1

Thanks, I already had fixed that in the linux-trace tree; the latest
version just had not yet propagated yet to the other trees.

  Ralf
