From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: Removal of GENERIC_GPIO breaks -next
Date: Wed, 17 Apr 2013 13:21:19 +0200
Message-ID: <20130417112117.GA993@ab42.lan>
References: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.abilis.ch ([195.70.19.74]:23479 "EHLO mail.abilis.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966275Ab3DQMHk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 08:07:40 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shaveta Leekha <shaveta@freescale.com>, linux-next <linux-next@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>

Hi Alexandre and Stephen,

Concerning the arch/arc/plat-tb10x/Kconfig issue, I already have a patc=
h
pending which will select PINCTRL_TB10X and GPIO_TB10X for the TB10x
platform as soon as both drivers are accepted into the kernel. Both
drivers were submitted to lkml last week, see
http://www.spinics.net/lists/kernel/msg1515239.html and
http://www.spinics.net/lists/kernel/msg1515240.html.

I suggest to add the removal of GENERIC_GPIO to that patch and arrange
with Vineet to push it through the normal arc upstream when the TB10x
pinctrl/gpio drivers show up in linux-next. Alternatively, an
independent patch could be produced and applied either through the same
channel or sent to this list. Tell me what you prefer.

Greetings,
  Christian

On Wed, Apr 17, 2013 at 07:37:33PM +0900, Alexandre Courbot wrote:
> Hi Stephen,
>=20
> It seems like the last few patches I pushed to my branch are going to
> break powerpc/85xx due to a merge issue. I have tried to warn you by
> email today but maybe you haven't read it yet.
>=20
> arch/powerpc/platforms/85xx/Kconfig has a "select GENERIC_GPIO" which
> will cause compilation breakage because I removed the GENERIC_GPIO
> config option for all platforms. This line should be removed by my
> "Convert selectors of GENERIC_GPIO to GPIOLIB" patch, but this line
> slipped in between and is thus still here.
>=20
> Also arch/arc/plat-tb10x/Kconfig now defines GENERIC_GPIO, this will
> not cause breakage but should not be here anymore (ideally removed by
> the "Remove GENERIC_GPIO config option" patch)
>=20
> Apart from these two issues, things seem to have gone fine, but I'm
> not sure how they should be addressed and by who?
>=20
> Thanks,
> Alex.

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
