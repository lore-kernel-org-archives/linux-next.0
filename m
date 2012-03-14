From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: pktgen -- arm build failures (Was: linux-next: triage for March
 13, 2012)
Date: Tue, 13 Mar 2012 20:52:11 -0400
Message-ID: <CAP=VYLoQbNqHnc6_hzF5hYZq_=9L5qaGm7TNF1Mh5YZH57yjMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:54170 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758508Ab2CNAwO convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 20:52:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, tony@bakeyournoodle.com, netdev <netdev@vger.kernel.org>

[PG: adding netdev to CC list]

On Tue, Mar 13, 2012 at 8:41 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Tue, 13 Mar 2012 19:47:07 -0400 Paul Gortmaker <paul.gortmaker@win=
driver.com> wrote:
>>
>> ARM:netx_defconfig,pnx4008_defconfig
>> =A0 =A0 =A0 when: =A0 Mar 14, 02:43
>> =A0 =A0 =A0 why: =A0 =A0net/core/pktgen.c: can't find a register in =
class 'GENERAL_REGS'
>> =A0 =A0 =A0 status:
>> =A0 =A0 =A0 fix:
>> =A0 =A0 =A0 ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/5869486/
>
> This is this:
>
> net/core/pktgen.c:682:2775: error: can't find a register in class 'GE=
NERAL_REGS' while reloading 'asm'
> net/core/pktgen.c:682:3153: error: can't find a register in class 'GE=
NERAL_REGS' while reloading 'asm'
> net/core/pktgen.c:682:2775: error: 'asm' operand has impossible const=
raints
> net/core/pktgen.c:682:3153: error: 'asm' operand has impossible const=
raints
>
> Which is a do_div() call. =A0The relevant code does not appear to hav=
e
> changed, so this may well be a result of our toolchain changing from
> "arm-linux-gcc (GCC) 4.4.0, GNU ld (GNU Binutils) 2.19.1" to
> "arm-unknown-linux-gnueabi-gcc (GCC) 4.6.3, GNU ld (GNU Binutils) 2.2=
2".
>
> Anyone have any thoughts?
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
