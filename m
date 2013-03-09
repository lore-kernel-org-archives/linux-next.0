From: Li Zefan <lizefan@huawei.com>
Subject: Re: [PATCH -next] res_counter: Add missing #include <linux/errno.h>
Date: Sat, 9 Mar 2013 18:41:12 +0800
Message-ID: <513B11C8.5030504@huawei.com>
References: <1362819077-14211-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([119.145.14.64]:8317 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756419Ab3CIKlh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Mar 2013 05:41:37 -0500
In-Reply-To: <1362819077-14211-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 2013/3/9 16:51, Geert Uytterhoeven wrote:
> Commit 9259826ccb8165f797e4c2c9d17925b41af5f6ae ("res_counter: remove
> include of cgroup.h from res_counter.h") removed the indirect inclusi=
on of
> <linux/errno.h>, breaking the build on m68k and sparc:
>=20
> In file included from mm/memcontrol.c:29:
> include/linux/res_counter.h: In function =E2=80=98res_counter_set_lim=
it=E2=80=99:
> include/linux/res_counter.h:203: error: =E2=80=98EBUSY=E2=80=99 undec=
lared (first use in this function)
> include/linux/res_counter.h:203: error: (Each undeclared identifier i=
s reported only once
> include/linux/res_counter.h:203: error: for each function it appears =
in.)
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Li Zefan <lizefan@huawei.com>
