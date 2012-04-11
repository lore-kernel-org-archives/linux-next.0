From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: triage for April 10, 2012
Date: Tue, 10 Apr 2012 22:50:44 -0400
Message-ID: <CAMjpGUetfGQxqTKVfLBtOdthxFtFv-knuXSWoNx0BKxJd=829Q@mail.gmail.com>
References: <20120410224543.GA11433@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:52781 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756109Ab2DKCvG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Apr 2012 22:51:06 -0400
In-Reply-To: <20120410224543.GA11433@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 10, 2012 at 18:45, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> bfin: 50% of builds
> =C2=A0 =C2=A0 =C2=A0 =C2=A0when: =C2=A0 Mar 31
> =C2=A0 =C2=A0 =C2=A0 =C2=A0why: =C2=A0 =C2=A0"Error: pcrel too far BF=
D_RELOC_BFIN_10" from kernel/time/timekeeping.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0status: unknown, binutils issue?
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fix:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ref: =C2=A0 =C2=A0http://kisskb.ellerman.i=
d.au/kisskb/buildresult/5981475/

that log file doesn't say anything about "BFD_RELOC_BFIN_10"

it does show the old L1 data overflow though ...

on a side note, the warning:
arch/blackfin/mm/init.c:79:9: warning: array subscript is above array
bounds [-Warray-bounds]
is a bad thing, but i've just pushed a fix for that ...
-mike
