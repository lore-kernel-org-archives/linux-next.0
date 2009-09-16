From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: [PATCH] edac: need to export cpu_llc_id
Date: Wed, 16 Sep 2009 06:58:47 +0200
Message-ID: <20090916045847.GC5767@aftab>
References: <20090916093935.6bc2c91f.sfr@canb.auug.org.au>
 <20090916044151.GB5767@aftab>
 <4AB06EE3.4010509@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:30673 "EHLO
	TX2EHSOBE009.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbZIPE6z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2009 00:58:55 -0400
Content-Disposition: inline
In-Reply-To: <4AB06EE3.4010509@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>

On Tue, Sep 15, 2009 at 09:51:47PM -0700, H. Peter Anvin wrote:
> On 09/15/2009 09:41 PM, Borislav Petkov wrote:
> >=20
> > proper fix is at http://marc.info/?l=3Dlinux-kernel&m=3D12530245962=
1925
> >=20
> > we still have to figure out who's gonna pick it up. Ingo?
> >=20
>=20
> This was from a tree you pushed straight to Linus, so it's probably
> better you push it directly.
>=20
> You can add:
>=20
> Acked-by: H. Peter Anvin <hpa@zytor.com>

Cool, thanks. Will prep a pull request in a couple of hours.

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
