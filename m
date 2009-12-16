From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for December 16 (amd64_edac)
Date: Wed, 16 Dec 2009 18:45:24 +0100
Message-ID: <20091216174524.GH11618@aftab>
References: <20091216183212.118c5e14.sfr@canb.auug.org.au>
 <20091216092424.5f87214c.randy.dunlap@oracle.com>
 <4B2919BD.40001@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.15]:6751 "EHLO
	VA3EHSOBE005.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751715AbZLPRpY convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2009 12:45:24 -0500
Content-Disposition: inline
In-Reply-To: <4B2919BD.40001@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Dec 16, 2009 at 09:32:45AM -0800, H. Peter Anvin wrote:
> On 12/16/2009 09:24 AM, Randy Dunlap wrote:
> > On Wed, 16 Dec 2009 18:32:12 +1100 Stephen Rothwell wrote:
> >=20
> >> Hi all,
> >>
> >> My usual call for calm: please do not put stuff destined for 2.6.3=
4 into
> >> linux-next trees until after 2.6.33-rc1.
> >>
> >> Changes since 20091215:
> >=20
> >=20
> > When CONFIG_SMP=3Dn, CONFIG_X86_MSR=3Dm:
> >=20
> > ERROR: "msrs_free" [drivers/edac/amd64_edac_mod.ko] undefined!
> > ERROR: "msrs_alloc" [drivers/edac/amd64_edac_mod.ko] undefined!
> >=20
> >=20
> > Should EDAC_AMD64 also depend on SMP?
> >=20
>=20
> That seems absurd... more likely msrs_free/msrs_alloc should not be
> SMP-specific, or stubs need to be provided.

see <arch/x86/lib/Makefile>:

obj-$(CONFIG_SMP) :=3D msr.o

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Andrew Bowd, Thomas M. McCoy, Giuliano=
 Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
