From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [s390x] Next June 18: boot failure
Date: Mon, 22 Jun 2009 09:27:05 +0200
Message-ID: <20090622072705.GA4940@osiris.boeblingen.de.ibm.com>
References: <20090618145949.d933719a.sfr@canb.auug.org.au> <4A3A335E.1040300@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.de.ibm.com ([195.212.29.157]:45754 "EHLO
	mtagate8.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750872AbZFVH1s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2009 03:27:48 -0400
Content-Disposition: inline
In-Reply-To: <4A3A335E.1040300@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Thu, Jun 18, 2009 at 06:00:22PM +0530, Sachin Sant wrote:
> Today's Next tree failed to boot on a s390x box.
>
> 00: Booting default (autotest)...
>           00000000002baf7a: a74b0038           aghi    %r4,56
> Call Trace:
> (<00000000004afc36>=A8 console_init+0x36/0x50)
> <0000000000498b86>=A8 start_kernel+0x53e/0x5ec
> <0000000000012020>=A8 _ehead+0x20/0x80
> Last Breaking-Event-Address:
> <00000000002bafd4>=A8 init_section_page_cgroup+0xfc/0x10c
>
> --- end trace 31fd0ba7d8756001 =A8---
> Kernel panic - not syncing: Attempted to kill the idle task!
> CPU: 0 Tainted: G      D    2.6.30-autotest-next-20090618 #1
> Process swapper (pid: 0, task: 0000000000445700, ksp: 000000000049800=
0)
> 0000000000000005 0000000000497b10 0000000000000002 0000000000000000
>       0000000000497bb0 0000000000497b28 0000000000497b28 000000000004=
a01e
>       00000000002c4d08 0000000000000000 0000000000000000 000000000000=
000b
>       0000000000000008 0000000000000000 0000000000497b10 000000000049=
7b88
>       00000000002c4c90 00000000000163aa 0000000000497b10 000000000049=
7b60
> Call Trace:
> (<000000000001630c>=A8 show_trace+0xdc/0xec)
> <0000000000048f10>=A8 panic+0x84/0x1c0
> <000000000004ce3c>=A8 do_exit+0x74/0x6f0
> <0000000000016862>=A8 die+0x152/0x154
> <000000000001298c>=A8 do_no_context+0xa0/0xac
> <00000000000131aa>=A8 do_protection_exception+0x252/0x260
> <0000000000025fa8>=A8 sysc_return+0x0/0x8
> <00000000002baf64>=A8 init_section_page_cgroup+0x8c/0x10c
> (<00000000004afc36>=A8 console_init+0x36/0x50)
> <0000000000498b86>=A8 start_kernel+0x53e/0x5ec
> <0000000000012020>=A8 _ehead+0x20/0x80
> 00: HCPGIR450W CP entered; disabled wait PSW 00020001 80000000 000000=
00
> 00020E76
>
> I haven't played with a s390 box before so not sure if this
> is a new problem or me not compiling the kernel properly.
> Let me know what other information is required.

Could you try using SLAB/SLUB instead of SLQB?
