From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for May 20 (amd64_edac)
Date: Wed, 20 May 2009 18:41:12 +0200
Message-ID: <20090520164112.GA29913@aftab>
References: <20090520170807.b75a9d86.sfr@canb.auug.org.au> <4A142CC9.4050904@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-dub.frontbridge.com ([213.199.154.16]:4956 "EHLO
	IE1EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508AbZETQld convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 12:41:33 -0400
Content-Disposition: inline
In-Reply-To: <4A142CC9.4050904@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dougthompson@xmission.com

Hi,

On Wed, May 20, 2009 at 09:16:09AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20090519:
> >=20
> > Undropped tree:
> > 	edac-amd
> >=20
> > The edac-amd tree lost its build failure.
>=20
>=20
> When K8_NB is not enabled:
>=20
> drivers/built-in.o: In function `amd64_edac_init':
> amd64_edac.c:(.init.text+0x254f6): undefined reference to `cache_k8_n=
orthbridges'
> amd64_edac.c:(.init.text+0x25c38): undefined reference to `num_k8_nor=
thbridges'

ah, well, one dependency goes another one comes in :(. Thanks, will fix=
=2E..

> Error with EDAC_AMD64 =3Dy or =3Dm.
> Error on both i386 and on x86_64.
>=20
>=20
> Comments on Kconfig for EDAC_AMD64:
>=20
> config EDAC_AMD64
> 	tristate "AMD64 (Opteron, Athlon64) K8, F10h, F11h"
> 	depends on EDAC_MM_EDAC && X86 && PCI
> 	default m
> 	help
> 	Support for error detection and correction on the AMD 64
> 	Families of Memory Controllers (K8, F10h and F11h)
>=20
>=20
> Does this actually apply to X86_32 or should the depends be on
> X86_64 instead of X86?

and since K8_NB depends on X86_64, this answers that question :).
=20
> The default y on EDAC_MM_EDAC and default m on EDAC_AMD64 should
> be removed.

The reasoning behind those comes from Ingo: people who enable EDAC
should get the modules automatically on instead of going through the
different entries in the subtree. Which sounds kind of reasonable, no?

See

http://marc.info/?l=3Dlinux-kernel&m=3D124173363813847

for details.

> The 2 lines of help text should be indented by 2 spaces.

ok, will do.

> Would be Good to have the amd64_edac maintainer(s) email addresses
> in MAINTAINERS file, please.

This is coming up.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
