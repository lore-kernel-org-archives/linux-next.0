From: Cong Wang <amwang@redhat.com>
Subject: Re: [PATCH -next] drivers/base/inode.c: let vmstat_text be optional
Date: Fri, 05 Aug 2011 10:38:59 +0800
Message-ID: <4E3B57C3.80203@redhat.com>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au> <20110804152211.ea10e3e7.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20110804152211.ea10e3e7.rdunlap@xenotime.net>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

=E4=BA=8E 2011=E5=B9=B408=E6=9C=8805=E6=97=A5 06:22, Randy Dunlap =E5=86=99=
=E9=81=93:
> From: Randy Dunlap<rdunlap@xenotime.net>
>
> vmstat_text is only available when PROC_FS or SYSFS is enabled.
> This causes build errors in drivers/base/node.c when they are
> both disabled:
>
> drivers/built-in.o: In function `node_read_vmstat':
> node.c:(.text+0x10e28f): undefined reference to `vmstat_text'
>
> Rather than litter drivers/base/node.c with #ifdef/#endif around
> the affected lines of code, add macros for optional sysdev
> attributes so that those lines of code will be ignored, without
> using #ifdef/#endif in the .c file(s).  I.e., the ifdeffery
> is done only in a header file with sysdev_create_file_optional()
> and sysdev_remove_file_optional().
>

This looks ugly for me, because other sysfs files here are not optional
only due to that they don't rely on vmstat_text.

I still think my approach to fix this is better, that is, introducing
a new Kconfig for drivers/base/node.c which depends on CONFIG_SYSFS.

Thanks.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter=
.ca/
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
