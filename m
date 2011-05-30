From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: only use new asm-generic/ptrace.h
 api when needed
Date: Mon, 30 May 2011 12:28:17 -0400
Message-ID: <BANLkTind_F4-5sLUO1GVxK_yY_eXz_J0Vg@mail.gmail.com>
References: <20110527151135.cd6f758a.sfr@canb.auug.org.au> <1306591465-9622-1-git-send-email-vapier@gentoo.org>
 <4DE3688A.4040600@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64018 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753383Ab1E3Q2i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 May 2011 12:28:38 -0400
In-Reply-To: <4DE3688A.4040600@mvista.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: kgdb-bugreport@lists.sourceforge.net, Jason Wessel <jason.wessel@windriver.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 30, 2011 at 05:51, Sergei Shtylyov wrote:
> On 28-05-2011 18:04, Mike Frysinger wrote:
>> The new instruction_pointer_set helper is defined for people who hav=
e
>> converted to asm-generic/ptrace.h, so don't use it generally unless
>> the arch needs it (in which case it has been converted). =C2=A0This =
should
>> fix building of kgdb tests for arches not yet converted.
>
>> --- a/drivers/misc/kgdbts.c
>> +++ b/drivers/misc/kgdbts.c
>> @@ -304,7 +304,10 @@ static int check_and_rewind_pc(char *put_str, c=
har
>> *arg)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Readjust the instruction pointer if ne=
eded */
>> - =C2=A0 =C2=A0 =C2=A0 instruction_pointer_set(&kgdbts_regs, ip + of=
fset);
>> + =C2=A0 =C2=A0 =C2=A0 ip +=3D offset;
>
> =C2=A0 Since '=C3=ADp' is local, incrementing it is pointless here un=
less you have
> GDB_ADJUSTS_BREAK_OFFSET defined. Why not keep instruction_pointer_se=
t()
> call as is?

i prefer to have as much outside of ifdefs as possible.  gcc optimizes
the result away, so it isnt a code size problem.
-mike
