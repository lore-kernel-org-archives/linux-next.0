From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [BUILD FAILURE 11/12] Next April 14 : PPC64 randconfig
	[drivers/spi/mpc52xx_psc_spi.c]
Date: Tue, 14 Apr 2009 12:42:47 -0600
Message-ID: <fa686aa40904141142s3717812ep293973fefce8853d@mail.gmail.com>
References: <1239733836.5344.83.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:14142 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446AbZDNSnC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 14:43:02 -0400
In-Reply-To: <1239733836.5344.83.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Linuxppc-dev <Linuxppc-dev@ozlabs.org>, David Brownell <dbrownell@users.sourceforge.net>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kumar Gala <galak@kernel.crashing.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Thanks Subrata.  I'll look into this.

g.

On Tue, Apr 14, 2009 at 12:30 PM, Subrata Modak
<subrata@linux.vnet.ibm.com> wrote:
> Observed the following build error:
> ---
> CC =A0 =A0 =A0drivers/spi/mpc52xx_psc_spi.o
> drivers/spi/mpc52xx_psc_spi.c: In function =91mpc52xx_psc_spi_do_prob=
e=92:
> drivers/spi/mpc52xx_psc_spi.c:398: error: =91struct fsl_spi_platform_=
data=92
> has no member named =91activate_cs=92
> drivers/spi/mpc52xx_psc_spi.c:399: error: =91struct fsl_spi_platform_=
data=92
> has no member named =91deactivate_cs=92
> make[2]: *** [drivers/spi/mpc52xx_psc_spi.o] Error 1
> make[1]: *** [drivers/spi] Error 2
> make: *** [drivers] Error 2
> ---
>
> Regards--
> Subrata
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
