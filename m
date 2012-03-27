From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: triage for March 26th, 2012
Date: Mon, 26 Mar 2012 22:26:08 -0400
Message-ID: <CAP=VYLrvnD7qWAPbCkf_4RtEgznF-tL=d+z4TaKt1QJ2TWs7AA@mail.gmail.com>
References: <20120327005307.GB26825@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:54072 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755133Ab2C0C0K convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Mar 2012 22:26:10 -0400
In-Reply-To: <20120327005307.GB26825@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Mon, Mar 26, 2012 at 8:53 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> New breakage since last report:
> =A0 =A0 =A0 =A0ARM:rpc_defconfig (scsi/arm/powertec.c: implicit 'seq_=
printf')
> =A0 =A0 =A0 =A0ARM:omap2plus_defconfig (board-omap4panda.c: 'btwilink=
_device' undecl)
> =A0 =A0 =A0 =A0m68k:sun3_defconfig,m68k_defconfig (sun3_NCR5380.c: st=
atic decl of
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 'sun3=
scsi_proc_info' follows non-static)
> =A0 =A0 =A0 =A0ia64:defconfig (asm-offsets.c:322: unterm arg list inv=
oking macro "DEFINE")

[...]

> ia64:defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 26
> =A0 =A0 =A0 =A0why: =A0 =A0asm-offsets.c:322: unterminated arg list i=
nvoking macro "DEFINE"
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref:

Cause and trivial fix is here:

          https://lkml.org/lkml/2012/3/26/496

Paul.
