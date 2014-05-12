From: Mark Salter <msalter@redhat.com>
Subject: linux-next build failure
Date: Mon, 12 May 2014 09:18:42 -0400
Message-ID: <1399900722.21547.78.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60701 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756090AbaELNSo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2014 09:18:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>

I'm seeing a build failure in linux-net for c6x (!CONFIG_MMU):

  fs/binfmt_elf_fdpic.c: In function =E2=80=98elf_fdpic_dump_segments=E2=
=80=99:
  fs/binfmt_elf_fdpic.c:1490:17: warning: unused variable =E2=80=98addr=
=E2=80=99 [-Wunused-variable]
     unsigned long addr;
                 ^
This was introduced by this patch:

  Author: Al Viro <viro@zeniv.linux.org.uk>
  Date:   Sat Oct 5 18:58:47 2013 -0400

      convert the rest of binfmt_elf_fdpic to dump_emit()
