From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for May 20 (amd64_edac)
Date: Wed, 20 May 2009 19:17:54 +0200
Message-ID: <20090520171754.GB29913@aftab>
References: <20090520170807.b75a9d86.sfr@canb.auug.org.au> <4A142CC9.4050904@oracle.com> <20090520164112.GA29913@aftab> <4A14352C.5020508@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]:27418
	"EHLO VA3EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754209AbZETRSC convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2009 13:18:02 -0400
Content-Disposition: inline
In-Reply-To: <4A14352C.5020508@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dougthompson@xmission.com

Hi,

On Wed, May 20, 2009 at 09:51:56AM -0700, Randy Dunlap wrote:

[..]

> Distros don't use defaults or defconfig anyway, and having them
> enabled bloats kernels.  I'm sure that Linus has also expressed
> opinions about enabling options in this way, but I can't find it
> just now.

This is one of those situations where you have the pros and the cons
staring at you. For what is worth, I myself have sent several patches
removing Kconfig options defaulting to m for hardware which is not even
present on a two-digit percentage of machines. I was told then, that it
is defaulting to m so that the code sees some more compiles on differen=
t
hardware but we end up automating stuff to turn them off in the .config
and the whole thing doesn't serve its purpose in the end anyway.

Besides, those who enable EDAC should probably know what they need to
turn on, in addition to that. Also, the bloating part is not good(tm).

So off it is...

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
