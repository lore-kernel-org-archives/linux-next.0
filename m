From: Mark Salter <msalter@redhat.com>
Subject: Re: linux-next build failure
Date: Mon, 12 May 2014 11:47:51 -0400
Message-ID: <1399909671.21547.83.camel@deneb.redhat.com>
References: <1399900722.21547.78.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44480 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751681AbaELPrw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2014 11:47:52 -0400
In-Reply-To: <1399900722.21547.78.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>

On Mon, 2014-05-12 at 09:18 -0400, Mark Salter wrote:
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
>=20
>=20

Of course, this is just a warning and not an error. My build failed and
the above was at the bottom of the log, but that was only because of th=
e
-j flag. The actual failure was elsewhere.
