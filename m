From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 29
Date: Wed, 29 Dec 2010 10:54:28 +0100
Message-ID: <AANLkTimHgKKw8eeH==YYY_Z9keewxamfOpRzLVDgKxv6@mail.gmail.com>
References: <20101229130700.0ef93735.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:33369 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758Ab0L2Jy3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Dec 2010 04:54:29 -0500
In-Reply-To: <20101229130700.0ef93735.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Dec 29, 2010 at 3:07 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> Changes since 20101228:
>

What is the recommended way in case of these "comparison" warnings?
Send to whom/where?

% grep comparison build_linux-next_next20101229.dileks.1.log
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/block/DAC960.c:5094:30:
warning: comparison between =E2=80=98DAC960_V2_IOCTL_Opcode_T=E2=80=99 =
and =E2=80=98enum
<anonymous>=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/block/drbd/drbd_nl.c:1010:14:
warning: comparison between =E2=80=98enum drbd_ret_codes=E2=80=99 and =E2=
=80=98enum
drbd_state_ret_codes=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/f=
s/pstore/platform.c:55:11:
warning: comparison of distinct pointer types lacks a cast
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/n=
et/netfilter/nf_conntrack_netlink.c:790:11:
warning: comparison between =E2=80=98enum ctattr_tuple=E2=80=99 and =E2=
=80=98enum ctattr_type=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/media/dvb/dvb-core/dmxdev.c:583:13:
warning: comparison between =E2=80=98enum dmx_ts_pes=E2=80=99 and =E2=80=
=98enum <anonymous>=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/media/dvb/frontends/stv090x.c:1486:27:
warning: comparison between =E2=80=98enum stv090x_search=E2=80=99 and =E2=
=80=98enum
stv090x_delsys=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/media/dvb/frontends/stv090x.c:1487:24:
warning: comparison between =E2=80=98enum stv090x_search=E2=80=99 and =E2=
=80=98enum
stv090x_delsys=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/scsi/mvsas/mv_sas.c:1206:34:
warning: comparison between =E2=80=98enum sas_device_type=E2=80=99 and =
=E2=80=98enum
sas_dev_type=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/scsi/mvsas/mv_sas.c:1209:39:
warning: comparison between =E2=80=98enum sas_device_type=E2=80=99 and =
=E2=80=98enum
sas_dev_type=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/scsi/pm8001/pm8001_hwi.c:2934:32:
warning: comparison between =E2=80=98enum sas_device_type=E2=80=99 and =
=E2=80=98enum
sas_dev_type=E2=80=99
/home/sd/src/linux-2.6/linux-2.6.37-rc7/debian/build/source_i386_none/d=
rivers/scsi/pm8001/pm8001_hwi.c:2936:37:
warning: comparison between =E2=80=98enum sas_device_type=E2=80=99 and =
=E2=80=98enum
sas_dev_type=E2=80=99

- Sedat -
