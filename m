From: Nico Schottelius <nico-linux-next@schottelius.org>
Subject: xorg not working on 2.6.28-rc1 (was xorg not working on
	2.6.27-next-20081017 (intel/lenovo x200)
Date: Fri, 24 Oct 2008 13:27:05 +0200
Message-ID: <20081024112704.GA4336@denkbrett.schottelius.org>
References: <20081023153745.GA4909@denkbrett.schottelius.org> <20081023203552.GA4175@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:47846 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbYJXNCd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Oct 2008 09:02:33 -0400
Content-Disposition: inline
In-Reply-To: <20081023203552.GA4175@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: multipart/mixed; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again!

Same issue in 2.6.28-rc1.
Log attached.

Nico

Nico -telmich- Schottelius [Thu, Oct 23, 2008 at 10:35:52PM +0200]:
> Hey!
>=20
> With next-20081023 I am not even able to start xorg anymore.
> Attached full logfile.
>=20
> With 2.6.27 I can run xorg.

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="Xorg.0.log"
Content-Transfer-Encoding: quoted-printable


X.Org X Server 1.4.2
Release Date: 11 June 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux Debian (xorg-server 2:1.4.2-7)
Current Operating System: Linux ikn 2.6.28-rc1-denkbrett #1 SMP PREEMPT Fri=
 Oct 24 12:59:17 CEST 2008 x86_64
Build Date: 30 September 2008  03:57:43PM
=20
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri Oct 24 13:07:18 2008
(=3D=3D) Using config file: "/etc/X11/xorg.conf"
(=3D=3D) No Layout section.  Using the first Screen section.
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Configured Monitor"
(=3D=3D) No device specified for screen "Default Screen".
	Using the first device section listed.
(**) |   |-->Device "Configured Video Device"
(=3D=3D) |-->Input Device "Configured Mouse"
(=3D=3D) |-->Input Device "Generic Keyboard"
(=3D=3D) The core pointer device wasn't specified explicitly in the layout.
	Using the first mouse device.
(=3D=3D) The core keyboard device wasn't specified explicitly in the layout.
	Using the first keyboard device.
(=3D=3D) Automatically adding devices
(=3D=3D) Automatically enabling devices
(=3D=3D) No FontPath specified.  Using compiled-in default.
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
	Entry deleted from font path.
(=3D=3D) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType
(=3D=3D) RgbPath set to "/etc/X11/rgb"
(=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x7c31c0
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 2.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 0.3
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/xorg/modules//libpcidata.so
(II) Module pcidata: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(--) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 8086,2a40 card 17aa,20e0 rev 07 class 06,00,00 hdr =
00
(II) PCI: 00:02:0: chip 8086,2a42 card 17aa,20e4 rev 07 class 03,00,00 hdr =
80
(II) PCI: 00:02:1: chip 8086,2a43 card 17aa,20e4 rev 07 class 03,80,00 hdr =
80
(II) PCI: 00:03:0: chip 8086,2a44 card 17aa,20e6 rev 07 class 07,80,00 hdr =
80
(II) PCI: 00:19:0: chip 8086,10f5 card 17aa,20ee rev 03 class 02,00,00 hdr =
00
(II) PCI: 00:1a:0: chip 8086,2937 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
80
(II) PCI: 00:1a:1: chip 8086,2938 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
00
(II) PCI: 00:1a:2: chip 8086,2939 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
00
(II) PCI: 00:1a:7: chip 8086,293c card 17aa,20f1 rev 03 class 0c,03,20 hdr =
00
(II) PCI: 00:1b:0: chip 8086,293e card 17aa,20f2 rev 03 class 04,03,00 hdr =
00
(II) PCI: 00:1c:0: chip 8086,2940 card 0000,0000 rev 03 class 06,04,00 hdr =
81
(II) PCI: 00:1c:1: chip 8086,2942 card 0000,0000 rev 03 class 06,04,00 hdr =
81
(II) PCI: 00:1c:3: chip 8086,2946 card 0000,0000 rev 03 class 06,04,00 hdr =
81
(II) PCI: 00:1d:0: chip 8086,2934 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
80
(II) PCI: 00:1d:1: chip 8086,2935 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
00
(II) PCI: 00:1d:2: chip 8086,2936 card 17aa,20f0 rev 03 class 0c,03,00 hdr =
00
(II) PCI: 00:1d:7: chip 8086,293a card 17aa,20f1 rev 03 class 0c,03,20 hdr =
00
(II) PCI: 00:1e:0: chip 8086,2448 card 0000,0000 rev 93 class 06,04,01 hdr =
01
(II) PCI: 00:1f:0: chip 8086,2917 card 17aa,20f5 rev 03 class 06,01,00 hdr =
80
(II) PCI: 00:1f:2: chip 8086,2929 card 17aa,20f8 rev 03 class 01,06,01 hdr =
00
(II) PCI: 00:1f:3: chip 8086,2930 card 17aa,20f9 rev 03 class 0c,05,00 hdr =
00
(II) PCI: 03:00:0: chip 8086,4236 card 8086,1011 rev 00 class 02,80,00 hdr =
00
(II) PCI: End of PCI scan
(II) Intel Bridge workaround enabled
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (0,0,13), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x100000000) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x100000000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 2: bridge is at (0:28:0), (0,2,2), BCTRL: 0x0004 (VGA_EN is cleare=
d)
(II) PCI-to-PCI bridge:
(II) Bus 3: bridge is at (0:28:1), (0,3,3), BCTRL: 0x0004 (VGA_EN is cleare=
d)
(II) Bus 3 non-prefetchable memory range:
	[0] -1	0	0xf2500000 - 0xf25fffff (0x100000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 5: bridge is at (0:28:3), (0,5,12), BCTRL: 0x0004 (VGA_EN is clear=
ed)
(II) Bus 5 I/O range:
	[0] -1	0	0x00002000 - 0x000020ff (0x100) IX[B]
	[1] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[2] -1	0	0x00002800 - 0x000028ff (0x100) IX[B]
	[3] -1	0	0x00002c00 - 0x00002cff (0x100) IX[B]
(II) Bus 5 non-prefetchable memory range:
	[0] -1	0	0xf0000000 - 0xf1ffffff (0x2000000) MX[B]
(II) Bus 5 prefetchable memory range:
	[0] -1	0	0xf2900000 - 0xf29fffff (0x100000) MX[B]
(II) Subtractive PCI-to-PCI bridge:
(II) Bus 13: bridge is at (0:30:0), (0,13,13), BCTRL: 0x0004 (VGA_EN is cle=
ared)
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:31:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is set)
(--) PCI:*(0:2:0) Intel Corporation Mobile Integrated Graphics Controller r=
ev 7, Mem @ 0xf2000000/22, 0xd0000000/28, I/O @ 0x1800/3
(--) PCI: (0:2:1) Intel Corporation Mobile Integrated Graphics Controller r=
ev 7, Mem @ 0xf2400000/20
(II) Addressable bus resource ranges are
	[0] -1	0	0x00000000 - 0xffffffff (0x100000000) MX[B]
	[1] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[5] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(II) Active PCI resource ranges:
	[0] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[1] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[2] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[3] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[4] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[5] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[6] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[7] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[8] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[9] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[10] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[11] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[12] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[13] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[14] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[15] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[16] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[17] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[18] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[19] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[20] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[21] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[22] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[23] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[24] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[25] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[1] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[2] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[3] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[4] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[5] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[6] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[7] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[8] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[9] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[10] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[11] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[12] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[13] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[14] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[15] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[16] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[17] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[18] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[19] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[20] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[21] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[22] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[23] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[24] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[25] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[5] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(II) All system resource ranges:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[5] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[6] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[7] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[8] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[9] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[10] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[11] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[12] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[13] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[14] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[15] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[18] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[19] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[20] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[21] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[22] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[23] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[24] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[25] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[26] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[27] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[28] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[29] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[30] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[31] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension SHAPE
(II) Loading extension MIT-SUNDRY-NONSTANDARD
(II) Loading extension BIG-REQUESTS
(II) Loading extension SYNC
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XC-MISC
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-Misc
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension TOG-CUP
(II) Loading extension Extended-Visual-Information
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(=3D=3D) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules//fonts/libfreetype.so
(II) Module freetype: vendor=3D"X.Org Foundation & the After X-TT Project"
	compiled for 1.4.2, module version =3D 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "intel"
(II) Loading /usr/lib/xorg/modules/drivers//intel_drv.so
(II) Module intel: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 2.3.2
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 2.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor=3D"X.Org Foundation"
	compiled for 1.4.0.90, module version =3D 1.3.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor=3D"X.Org Foundation"
	compiled for 1.4.0.90, module version =3D 1.3.1
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) intel: Driver for Intel Integrated Graphics Chipsets: i810,
	i810-dc100, i810e, i815, i830M, 845G, 852GM/855GM, 865G, 915G,
	E7221 (i915), 915GM, 945G, 945GM, 945GME, 965G, G35, 965Q, 946GZ,
	965GM, 965GME/GLE, G33, Q35, Q33,
	Mobile Intel=AE GM45 Express Chipset,
	Intel Integrated Graphics Device, G45/G43, Q45/Q43
(II) Primary Device is: PCI 00:02:0
(--) Assigning device section with no busID to primary device
(WW) intel: No matching Device section for instance (BusID PCI:0:2:1) found
(--) Chipset Mobile Intel=AE GM45 Express Chipset found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[5] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[6] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[7] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[8] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[9] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[10] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[11] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[12] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[13] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[14] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[15] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[18] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[19] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[20] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[21] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[22] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[23] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[24] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[25] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[26] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[27] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[28] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[29] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[30] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[31] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
(II) resource ranges after probing:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[5] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[6] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[7] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[8] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[9] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[10] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[11] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[12] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[13] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[14] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[15] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[16] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[17] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[18] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[19] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[20] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[21] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[22] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[23] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[24] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[25] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[26] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[27] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[28] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[29] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[30] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[31] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[32] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[33] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[34] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
	[35] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[36] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(II) Loading sub module "vbe"
(II) LoadModule: "vbe"
(II) Loading /usr/lib/xorg/modules//libvbe.so
(II) Module vbe: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.1.0
	ABI class: X.Org Video Driver, version 2.0
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 0.1.0
	ABI class: X.Org Video Driver, version 2.0
(=3D=3D) intel(0): Depth 24, (=3D=3D) framebuffer bpp 32
(=3D=3D) intel(0): RGB weight 888
(=3D=3D) intel(0): Default visual is TrueColor
(II) intel(0): Integrated Graphics Chipset: Intel(R) Mobile Intel=AE GM45 E=
xpress Chipset
(--) intel(0): Chipset: "Mobile Intel=AE GM45 Express Chipset"
(--) intel(0): Linear framebuffer at 0xD0000000
(--) intel(0): IO registers at addr 0xF2000000
(II) intel(0): 2 display pipes available.
(=3D=3D) intel(0): Using EXA for acceleration
(=3D=3D) intel(0): Disabling EXA render acceleration
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) intel(0): Output VGA using monitor section Configured Monitor
(II) intel(0): I2C bus "CRTDDC_A" initialized.
(II) intel(0): Output LVDS has no monitor section
(II) intel(0): I2C bus "LVDSDDC_C" initialized.
(II) intel(0): Attempting to determine panel fixed mode.
(II) intel(0): I2C device "LVDSDDC_C:ddc2" registered at address 0xA0.
(II) intel(0): EDID vendor "LEN", prod id 16400
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Reloading /usr/lib/xorg/modules//libint10.so
(II) intel(0): initializing int10
(WW) intel(0): Bad V_BIOS checksum
(II) intel(0): Primary V_BIOS segment is: 0xc000
(II) intel(0): VESA BIOS detected
(II) intel(0): VESA VBE Version 3.0
(II) intel(0): VESA VBE Total Mem: 32704 kB
(II) intel(0): VESA VBE OEM: Intel(r)Cantiga Graphics Chip Accelerated VGA =
BIOS
(II) intel(0): VESA VBE OEM Software Rev: 1.0
(II) intel(0): VESA VBE OEM Vendor: Intel Corporation
(II) intel(0): VESA VBE OEM Product: Intel(r)Cantiga Graphics Controller
(II) intel(0): VESA VBE OEM Product Rev: Hardware Version 0.0
(II) intel(0): found backlight control method /sys/class/backlight/acpi_vid=
eo1
(II) intel(0): I2C bus "SDVOCTRL_E for SDVOB" initialized.
(II) intel(0): I2C device "SDVOCTRL_E for SDVOB:SDVO Controller B" register=
ed at address 0x70.
(II) intel(0): No SDVO device found on SDVOB
(II) intel(0): I2C device "SDVOCTRL_E for SDVOB:SDVO Controller B" removed.
(II) intel(0): I2C bus "SDVOCTRL_E for SDVOB" removed.
(II) intel(0): I2C bus "SDVOCTRL_E for SDVOC" initialized.
(II) intel(0): I2C device "SDVOCTRL_E for SDVOC:SDVO Controller C" register=
ed at address 0x72.
(II) intel(0): No SDVO device found on SDVOC
(II) intel(0): I2C device "SDVOCTRL_E for SDVOC:SDVO Controller C" removed.
(II) intel(0): I2C bus "SDVOCTRL_E for SDVOC" removed.
(II) intel(0): Output TV has no monitor section
(II) intel(0): EDID vendor "LEN", prod id 16400
(II) intel(0): Output VGA disconnected
(II) intel(0): Output LVDS connected
(II) intel(0): Output TV disconnected
(II) intel(0): Output LVDS using initial mode 1280x800
(II) intel(0): Monitoring connected displays enabled
(II) intel(0): detected 512 kB GTT.
(II) intel(0): detected 32252 kB stolen memory.
(=3D=3D) intel(0): video overlay key set to 0x101fe
(=3D=3D) intel(0): Will not try to enable page flipping
(=3D=3D) intel(0): Triple buffering disabled
(=3D=3D) intel(0): Intel XvMC decoder disabled
(=3D=3D) intel(0): Using gamma correction (1.0, 1.0, 1.0)
(=3D=3D) intel(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules//libfb.so
(II) Module fb: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.3
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/xorg/modules//libexa.so
(II) Module exa: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 2.2.0
	ABI class: X.Org Video Driver, version 2.0
(II) Loading sub module "ramdac"
(II) LoadModule: "ramdac"(II) Module "ramdac" already built-in
(II) intel(0): Comparing regs from server start up to After PreInit
(WW) intel(0): Register 0x61200 (PP_STATUS) changed from 0xc0000008 to 0xd0=
000009
(WW) intel(0): PP_STATUS before: on, ready, sequencing idle
(WW) intel(0): PP_STATUS after: on, ready, sequencing on
(WW) intel(0): Register 0x61114 (PORT_HOTPLUG_STAT) changed from 0x10000000=
 to 0x10000400
(WW) intel(0): Register 0x70024 (PIPEASTAT) changed from 0x00000206 to 0x00=
000236
(WW) intel(0): PIPEASTAT before: status: VSYNC_INT_STATUS SVBLANK_INT_STATU=
S VBLANK_INT_STATUS
(WW) intel(0): PIPEASTAT after: status: VSYNC_INT_STATUS OFIELD_INT_STATUS =
EFIELD_INT_STATUS SVBLANK_INT_STATUS VBLANK_INT_STATUS
(WW) intel(0): Register 0x321b (FBC_FENCE_OFF) changed from 0x92024500 to 0=
xad008c00
(WW) intel(0): Register 0x68000 (TV_CTL) changed from 0x00000010 to 0x000c0=
010
(WW) intel(0): Register 0x68010 (TV_CSC_Y) changed from 0x00000000 to 0x033=
2012d
(WW) intel(0): Register 0x68014 (TV_CSC_Y2) changed from 0x00000000 to 0x07=
d30104
(WW) intel(0): Register 0x68018 (TV_CSC_U) changed from 0x00000000 to 0x073=
3052d
(WW) intel(0): Register 0x6801c (TV_CSC_U2) changed from 0x00000000 to 0x05=
c70200
(WW) intel(0): Register 0x68020 (TV_CSC_V) changed from 0x00000000 to 0x034=
0030c
(WW) intel(0): Register 0x68024 (TV_CSC_V2) changed from 0x00000000 to 0x06=
d00200
(WW) intel(0): Register 0x68028 (TV_CLR_KNOBS) changed from 0x00000000 to 0=
x00606000
(WW) intel(0): Register 0x6802c (TV_CLR_LEVEL) changed from 0x00000000 to 0=
x010b00e1
(WW) intel(0): Register 0x68030 (TV_H_CTL_1) changed from 0x00000000 to 0x0=
0400359
(WW) intel(0): Register 0x68034 (TV_H_CTL_2) changed from 0x00000000 to 0x8=
0480022
(WW) intel(0): Register 0x68038 (TV_H_CTL_3) changed from 0x00000000 to 0x0=
07c0344
(WW) intel(0): Register 0x6803c (TV_V_CTL_1) changed from 0x00000000 to 0x0=
0f01415
(WW) intel(0): Register 0x68040 (TV_V_CTL_2) changed from 0x00000000 to 0x0=
0060607
(WW) intel(0): Register 0x68044 (TV_V_CTL_3) changed from 0x00000000 to 0x8=
0120001
(WW) intel(0): Register 0x68048 (TV_V_CTL_4) changed from 0x00000000 to 0x0=
00900f0
(WW) intel(0): Register 0x6804c (TV_V_CTL_5) changed from 0x00000000 to 0x0=
00a00f0
(WW) intel(0): Register 0x68050 (TV_V_CTL_6) changed from 0x00000000 to 0x0=
00900f0
(WW) intel(0): Register 0x68054 (TV_V_CTL_7) changed from 0x00000000 to 0x0=
00a00f0
(WW) intel(0): Register 0x68060 (TV_SC_CTL_1) changed from 0x00000000 to 0x=
c1710088
(WW) intel(0): Register 0x68064 (TV_SC_CTL_2) changed from 0x00000000 to 0x=
4e2d1dc8
(WW) intel(0): Register 0x68070 (TV_WIN_POS) changed from 0x00000000 to 0x0=
0360024
(WW) intel(0): Register 0x68074 (TV_WIN_SIZE) changed from 0x00000000 to 0x=
02640198
(WW) intel(0): Register 0x68080 (TV_FILTER_CTL_1) changed from 0x00000000 t=
o 0x8000085e
(WW) intel(0): Register 0x68084 (TV_FILTER_CTL_2) changed from 0x00000000 t=
o 0x00028283
(WW) intel(0): Register 0x68088 (TV_FILTER_CTL_3) changed from 0x00000000 t=
o 0x00014141
(WW) intel(0): Register 0x68100 (TV_H_LUMA_0) changed from 0x00000000 to 0x=
b1403000
(WW) intel(0): Register 0x681ec (TV_H_LUMA_59) changed from 0x00000000 to 0=
x0000b060
(WW) intel(0): Register 0x68200 (TV_H_CHROMA_0) changed from 0x00000000 to =
0xb1403000
(WW) intel(0): Register 0x682ec (TV_H_CHROMA_59) changed from 0x00000000 to=
 0x0000b060
(=3D=3D) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
	[0] 0	0	0xd0000000 - 0xdfffffff (0x10000000) MS[B]
	[1] 0	0	0xf2000000 - 0xf23fffff (0x400000) MS[B]
	[2] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[3] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[4] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[5] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[6] -1	0	0xf2500000 - 0xf2501fff (0x2000) MX[B]
	[7] -1	0	0xf2827400 - 0xf28274ff (0x100) MX[B]
	[8] -1	0	0xf2826000 - 0xf28267ff (0x800) MX[B]
	[9] -1	0	0xf2827000 - 0xf28273ff (0x400) MX[B]
	[10] -1	0	0xf2620000 - 0xf2623fff (0x4000) MX[B]
	[11] -1	0	0xf2826c00 - 0xf2826fff (0x400) MX[B]
	[12] -1	0	0xf2625000 - 0xf2625fff (0x1000) MX[B]
	[13] -1	0	0xf2600000 - 0xf261ffff (0x20000) MX[B]
	[14] -1	0	0xf2826800 - 0xf282680f (0x10) MX[B]
	[15] -1	0	0xf2400000 - 0xf24fffff (0x100000) MX[B](B)
	[16] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[17] -1	0	0xf2000000 - 0xf23fffff (0x400000) MX[B](B)
	[18] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B](OprD)
	[19] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B](OprD)
	[20] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B](OprD)
	[21] 0	0	0x00001800 - 0x00001807 (0x8) IS[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[24] -1	0	0x00001c60 - 0x00001c7f (0x20) IX[B]
	[25] -1	0	0x00001c20 - 0x00001c3f (0x20) IX[B]
	[26] -1	0	0x00001838 - 0x0000183b (0x4) IX[B]
	[27] -1	0	0x00001c40 - 0x00001c47 (0x8) IX[B]
	[28] -1	0	0x0000183c - 0x0000183f (0x4) IX[B]
	[29] -1	0	0x00001c48 - 0x00001c4f (0x8) IX[B]
	[30] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[31] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[32] -1	0	0x000018c0 - 0x000018df (0x20) IX[B]
	[33] -1	0	0x000018a0 - 0x000018bf (0x20) IX[B]
	[34] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[35] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[36] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[37] -1	0	0x00001800 - 0x00001807 (0x8) IX[B](B)
	[38] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B](OprU)
	[39] 0	0	0x000003c0 - 0x000003df (0x20) IS[B](OprU)
(II) intel(0): Kernel reported 478208 total, 1 used
(II) intel(0): I830CheckAvailableMemory: 1912828 kB available
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: Open failed
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: Open failed
drmOpenByBusid: Searching for BusID pci:0000:00:02.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: drmOpenMinor returns 9
drmOpenByBusid: drmGetBusid reports pci:0000:00:02.0
(II) [drm] loaded kernel module for "i915" driver.
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) intel(0): [drm] Using the DRM lock SAREA also for drawables.
(II) intel(0): [drm] framebuffer mapped by ddx driver
(II) intel(0): [drm] added 1 reserved context for kernel
(II) intel(0): X context handle =3D 0x1
(II) intel(0): [drm] installed DRM signal handler
(**) intel(0): Framebuffer compression disabled
(**) intel(0): Tiling enabled
(=3D=3D) intel(0): VideoRam: 262144 KB
(II) intel(0): Attempting memory allocation with tiled buffers.
(II) intel(0): Tiled allocation successful.
(II) intel(0): [drm] Registers =3D 0xf2000000
(II) intel(0): [drm] ring buffer =3D 0xd0000000
(II) intel(0): [drm] mapped front buffer at 0xd0100000, handle =3D 0xd01000=
00
(II) intel(0): [drm] mapped back buffer at 0xd8da1000, handle =3D 0xd8da1000
(II) intel(0): [drm] mapped depth buffer at 0xdb0e1000, handle =3D 0xdb0e10=
00
(II) intel(0): [drm] mapped classic textures at 0xdd421000, handle =3D 0xdd=
421000
(II) intel(0): [drm] Initialized kernel agp heap manager, 33554432
(II) intel(0): [dri] visual configs initialized
(II) intel(0): Page Flipping disabled
(=3D=3D) intel(0): Write-combining range (0xd0000000,0x10000000)
(II) intel(0): vgaHWGetIOBase: hwp->IOBase is 0x03d0, hwp->PIOOffset is 0x0=
000
(II) EXA(0): Offscreen pixmap area of 110592000 bytes
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(=3D=3D) intel(0): Backing store disabled
(=3D=3D) intel(0): Silken mouse enabled
(II) intel(0): Initializing HW Cursor
(II) intel(0): [DRI] installation complete
(II) intel(0): xf86BindGARTMemory: bind key 0 at 0x01f7f000 (pgoffset 8063)
(WW) intel(0): xf86BindGARTMemory: binding of gart memory with key 0
	at offset 0x1f7f000 failed (Invalid argument)

Fatal server error:
Couldn't bind memory for front buffer


--W/nzBZO5zC0uMSeA--

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkBsQgACgkQuL75KpiFGIzokACg4aTgLMQU6CT1N9Sgc9WqQSao
NLEAni1U+IjUnhG3Sk7X0xHC1Azw4xlC
=GtY1
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
