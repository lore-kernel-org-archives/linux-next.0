From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: next: x86/msr.h: build fails
Date: Wed, 20 May 2009 18:06:34 +0200
Message-ID: <20090520160634.GB27991@aftab>
References: <20090520094141.GA16421@orion> <20090520101446.GA16517@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-sin.frontbridge.com ([207.46.51.80]:52011 "EHLO
	SG2EHSOBE006.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412AbZETQGq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2009 12:06:46 -0400
Content-Disposition: inline
In-Reply-To: <20090520101446.GA16517@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, May 20, 2009 at 02:14:46PM +0400, Alexander Beregalov wrote:
> On Wed, May 20, 2009 at 01:41:41PM +0400, Alexander Beregalov wrote:
> > Hi Borislav,
> >=20
> > What do you think about this fix?
> > I have no idea what value should be for the cpu variable.
>=20
> This patch should be better.
> This is !SMP code, then cpu=3D0 is ok.
>=20
>=20
> From: Alexander Beregalov <a.beregalov@gmail.com>
> Subject: [PATCH] x86: msr.h: fix build error
>=20
> Fix this build error:
> .../asm/msr.h: In function 'rdmsr_on_cpus':
> .../asm/msr.h:248: error: request for member 'l' in something not a s=
tructure or union
> .../asm/msr.h:248: error: request for member 'h' in something not a s=
tructure or union
> .../asm/msr.h:248: error: too few arguments to function 'rdmsr_on_cpu=
'
> .../asm/msr.h: In function 'wrmsr_on_cpus':
> .../asm/msr.h:253: error: request for member 'l' in something not a s=
tructure or union
> .../asm/msr.h:253: error: request for member 'h' in something not a s=
tructure or union
> .../asm/msr.h:253: error: too few arguments to function 'wrmsr_on_cpu=
'
>=20
> This is !SMP code so `cpu` should be 0.
>=20
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

thanks, applied.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
