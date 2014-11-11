From: Fabian Frederick <fabf@skynet.be>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 11 Nov 2014 12:20:19 +0100 (CET)
Message-ID: <318149421.176770.1415704819915.open-xchange@webmail.nmp.skynet.be>
References: <20141111131216.3742d156@canb.auug.org.au>
Reply-To: Fabian Frederick <fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailsec111.isp.belgacom.be ([195.238.20.107]:14239 "EHLO
	mailsec111.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752832AbaKKLUW convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2014 06:20:22 -0500
In-Reply-To: <20141111131216.3742d156@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org



> On 11 November 2014 at 03:12 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
>
> Hi Jens,
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/built-in.o: In function `cdrom_sysctl_handler':
> cdrom_sysctl.c:(.text+0x156d92): undefined reference to `cdrom_mutex'
> cdrom_sysctl.c:(.text+0x156da0): undefined reference to `cdrom_autocl=
ose'
> cdrom_sysctl.c:(.text+0x156dae): undefined reference to `cdrom_autoej=
ect'
> cdrom_sysctl.c:(.text+0x156dbc): undefined reference to `cdrom_debug'
> cdrom_sysctl.c:(.text+0x156dca): undefined reference to `cdrom_lockdo=
or'
> cdrom_sysctl.c:(.text+0x156dd8): undefined reference to
> `cdrom_check_media_type'
> cdrom_sysctl.c:(.text+0x156e0b): undefined reference to `cdrom_list'
> cdrom_sysctl.c:(.text+0x156e37): undefined reference to `cdrom_autocl=
ose'
> cdrom_sysctl.c:(.text+0x156e57): undefined reference to `cdrom_autoej=
ect'
> cdrom_sysctl.c:(.text+0x156e77): undefined reference to
> `cdrom_check_media_type'
> cdrom_sysctl.c:(.text+0x156ea4): undefined reference to `cdrom_lockdo=
or'
> cdrom_sysctl.c:(.text+0x156eb5): undefined reference to `cdrom_list'
> cdrom_sysctl.c:(.text+0x15702e): undefined reference to `cdrom_mutex'
> drivers/built-in.o: In function `cdrom_print_info.constprop.0':
> cdrom_sysctl.c:(.text+0x1570f3): undefined reference to `cdrom_list'
> cdrom_sysctl.c:(.text+0x157189): undefined reference to `cdrom_list'
> drivers/built-in.o: In function `cdrom_sysctl_info':
> cdrom_sysctl.c:(.text+0x1572c3): undefined reference to `cdrom_mutex'
> cdrom_sysctl.c:(.text+0x1576dc): undefined reference to `cdrom_mutex'
> drivers/built-in.o: In function `cdrom_sysctl_register':
> (.text+0x157765): undefined reference to `cdrom_autoclose'
> drivers/built-in.o: In function `cdrom_sysctl_register':
> (.text+0x157781): undefined reference to `cdrom_autoeject'
> drivers/built-in.o: In function `cdrom_sysctl_register':
> (.text+0x15778e): undefined reference to `cdrom_debug'
> drivers/built-in.o: In function `cdrom_sysctl_register':
> (.text+0x15779b): undefined reference to `cdrom_lockdoor'
> drivers/built-in.o: In function `cdrom_sysctl_register':
> (.text+0x1577a8): undefined reference to `cdrom_check_media_type'
>
> Probably caused by commit d01681d1457c ("cdrom: export sysctl code").
> This build has CONFIG_SYSCTL=3Dy, CONFIG_BLK_DEV_IDECD=3Dm,
> CONFIG_BLK_DEV_SR=3Dm, CONFIG_PARIDE_PCD=3Dm, CONFIG_CDROM_PKTCDVD=3D=
m,
> CONFIG_GDROM=3Dn.
>
> I have used the block tree from next-20141110 for today.
> --
> Cheers,
> Stephen Rothwell=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sfr@canb.auug.org.au

Hi Stephen,

Problem is in Makefile:

obj-$(CONFIG_BLK_DEV_SR) +=3D cdrom.o
obj-$(CONFIG_PARIDE_PCD) +=3D cdrom.o
obj-$(CONFIG_CDROM_PKTCDVD) +=3D cdrom.o
+obj-$(CONFIG_SYSCTL) +=3D cdrom_sysctl.o

I tried cdrom-$(CONFIG_SYSCTL)=C2=A0 +=3D cdrom_sysctl.o
to add sysctl only when cdrom.o is created

but now

drivers/scsi/sr_mod.ko
drivers/ide/ide-cd_mod.ko
drivers/ide/ide-cd_mod.ko

can't find cdrom.c functions ...

Is there another way to do it ?

Regards,
=46abian
