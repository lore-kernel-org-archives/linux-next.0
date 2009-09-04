From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for September 4
Date: Fri, 4 Sep 2009 12:45:40 +0200
Message-ID: <20090904104540.GC28389@aftab>
References: <20090904182309.dbb05c96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:42816 "EHLO
	TX2EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779AbZIDKrM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Sep 2009 06:47:12 -0400
Content-Disposition: inline
In-Reply-To: <20090904182309.dbb05c96.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

On Fri, Sep 04, 2009 at 06:23:09PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20090903:

=2E.

> Merging edac-amd/for-next
> CONFLICT (content): Merge conflict in arch/x86/kernel/smpboot.c
> CONFLICT (content): Merge conflict in include/linux/topology.h

current topology patches in -tip have significantly diverged from the
versions I carry in the edac tree so please remove the last from the
testing lineup temporarily. Will fix the issue after I'm back from my
vacation the week after next.

Thanks.

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
