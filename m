From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next build failure
Date: Mon, 12 May 2014 18:05:20 +0100
Message-ID: <20140512170520.GE18016@ZenIV.linux.org.uk>
References: <1399900722.21547.78.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:33458 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932563AbaELRFV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2014 13:05:21 -0400
Content-Disposition: inline
In-Reply-To: <1399900722.21547.78.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>

On Mon, May 12, 2014 at 09:18:42AM -0400, Mark Salter wrote:
> I'm seeing a build failure in linux-net for c6x (!CONFIG_MMU):
>=20
>   fs/binfmt_elf_fdpic.c: In function =E2=80=98elf_fdpic_dump_segments=
=E2=80=99:
>   fs/binfmt_elf_fdpic.c:1490:17: warning: unused variable =E2=80=98ad=
dr=E2=80=99 [-Wunused-variable]
>      unsigned long addr;
>                  ^
> This was introduced by this patch:
>=20
>   Author: Al Viro <viro@zeniv.linux.org.uk>
>   Date:   Sat Oct 5 18:58:47 2013 -0400
>=20
>       convert the rest of binfmt_elf_fdpic to dump_emit()

=2E.. in the mainline since 3.13.  What has changed in -next?

We could put ifndef CONFIG_MMU around that declaration, I guess...

PS: Pity that we can't really use -std=3Dgnu99 - use of compound litera=
ls
in initializers is too widespread ;-/  The last time I tried to do some=
thing
about that, I gave up when I got to __pgprot() users; in principle, we
could switch pgprot_t to a bitwise type and let sparse take care of the
typechecking, but it was too much work to pull off.  Might be worth
trying again someday...
