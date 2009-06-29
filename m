From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 12:31:23 +0200
Message-ID: <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.de.ibm.com ([195.212.17.161]:43935 "EHLO
	mtagate1.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753532AbZF2KbV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2009 06:31:21 -0400
Content-Disposition: inline
In-Reply-To: <4A488D08.30307@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>, Nick Piggin <npiggin@suse.de>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 03:14:40PM +0530, Sachin Sant wrote:
> I still have problems booting next with SLQB on a s390 box.
>
> Write protected kernel read-only data: 0x12000 - 0x446fff
> Experimental hierarchical RCU implementation.
> Experimental hierarchical RCU init done.
> console =DDttyS0=A8 enabled
> Unable to handle kernel pointer dereference at virtual kernel address=
 (null)
> Oops: 0004 #1=A8 SMP
> Modules linked in:
> CPU: 0 Not tainted 2.6.31-rc1-autotest-next-20090629 #1
> Process swapper (pid: 0, task: 0000000000447700, ksp: 000000000049800=
0)
> Krnl PSW : 0700200180000000 00000000002be00c (init_section_page_cgrou=
p+0x8c/0x10
> c)
>           R:0 T:1 IO:1 EX:1 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 EA:3
> Krnl GPRS: 0000000000000000 0000000000000028 0000000000000010 0000000=
000000010
>           000003e040000000 0000000000010000 0000000000498a28 00000000=
00000000
>           00000000004cc000 00000000004bb408 00000000004cc010 00000000=
80808000
>           0000000000280000 00000000002d1cf0 00000000004aa69e 00000000=
00497ed0
> Krnl Code: 00000000002be000: a7c90000           lghi    %r12,0
>           00000000002be004: a7f40031           brc     15,2be066
>           00000000002be008: 41102018           la      %r1,24(%r2)
>          >00000000002be00c: e34020100024       stg     %r4,16(%r2)
>           00000000002be012: a7a90000           lghi    %r10,0
>           00000000002be01c: e3a020000024       stg     %r10,0(%r2)
>           00000000002be022: a74b0038           aghi    %r4,56
> Call Trace:
> (<00000000004b0bbe>=A8 console_init+0x36/0x50)
> <000000000049897a>=A8 start_kernel+0x312/0x3c0
> <0000000000012020>=A8 _ehead+0x20/0x80
> Last Breaking-Event-Address:
> <00000000002be07c>=A8 init_section_page_cgroup+0xfc/0x10c
>
> --- end trace 31fd0ba7d8756001 =A8---
> Kernel panic - not syncing: Attempted to kill the idle task!
> CPU: 0 Tainted: G      D    2.6.31-rc1-autotest-next-20090629 #1
> Process swapper (pid: 0, task: 0000000000447700, ksp: 000000000049800=
0)
> 0000000000000005 0000000000497b20 0000000000000002 0000000000000000
>       0000000000497bc0 0000000000497b38 0000000000497b38 000000000004=
9fc2
>       00000000002c7cf0 0000000000000000 0000000000000000 000000000000=
000b
>       0000000000000008 0000000000000000 0000000000497b20 000000000049=
7b98
>       00000000002c7c78 00000000000163aa 0000000000497b20 000000000049=
7b70
> Call Trace:
> (<000000000001630c>=A8 show_trace+0xdc/0xec)
> <0000000000048eb0>=A8 panic+0x84/0x1c0
> <000000000004ce70>=A8 do_exit+0x74/0x6f0
> <0000000000016862>=A8 die+0x152/0x154
> <000000000001298c>=A8 do_no_context+0xa0/0xac
> <00000000000131aa>=A8 do_protection_exception+0x252/0x260
> <0000000000025f7c>=A8 sysc_return+0x0/0x8
> <00000000002be00c>=A8 init_section_page_cgroup+0x8c/0x10c
> (<00000000004b0bbe>=A8 console_init+0x36/0x50)
> <000000000049897a>=A8 start_kernel+0x312/0x3c0
> <0000000000012020>=A8 _ehead+0x20/0x80
> 01: HCPGIR450W CP entered; disabled wait PSW 00020001 80000000 000000=
00 00020E3E
>
> With SLUB machine boots fine. Should i be testing this(SLQB/s390)
> combination ?

No, just stay with SLUB/SLAB for the time being.
Maybe the backtrace looks familiar to Nick?
