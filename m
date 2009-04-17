From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: Re: [BUILD FAILURE 03/12] Next April 14 : PPC64
	randconfig	[arch/powerpc/platforms/ps3/setup.c]
Date: Fri, 17 Apr 2009 11:17:18 +0530
Message-ID: <1239947239.4875.6.camel@subratamodak.linux.ibm.com>
References: <1239733704.5344.75.camel@subratamodak.linux.ibm.com>
	 <49E787DC.2050800@am.sony.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e2.ny.us.ibm.com ([32.97.182.142]:52291 "EHLO e2.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbZDQFrZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Apr 2009 01:47:25 -0400
In-Reply-To: <49E787DC.2050800@am.sony.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geoff Levand <geoffrey.levand@am.sony.com>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Paul Mackerras <paulus@samba.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, 2009-04-16 at 12:32 -0700, Geoff Levand wrote:
> On 04/14/2009 11:28 AM, Subrata Modak wrote:
> > Observed the following build error:
> > ---
> > arch/powerpc/platforms/ps3/setup.c:49: error: redefinition of
> > =E2=80=98smp_send_stop=E2=80=99
> > include/linux/smp.h:125: error: previous definition of =E2=80=98smp=
_send_stop=E2=80=99
> > was here
>=20
> Hi Subrata,
>=20
> Thanks for the report.  I submitted a fix to the powerpc ML:
>=20
>  http://patchwork.ozlabs.org/patch/26084/

Thanks Geoff.

Regards--
Subrata

>=20
> -Geoff
>=20
