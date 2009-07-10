From: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH Resend2] Remove 'SBC8240 Wind River' Device Driver Code
Date: Fri, 10 Jul 2009 10:14:55 +0300
Message-ID: <1247210095.20721.362.camel@localhost.localdomain>
References: <20090701135247.27488.10776.sendpatchset@subratamodak.linux.ibm.com>
	 <1246846628.5743.2.camel@subratamodak.linux.ibm.com>
	 <1247205588.20721.353.camel@localhost.localdomain>
	 <1247206539.6630.0.camel@subratamodak.linux.ibm.com>
	 <4A56DD51.5040703@gmail.com>
	 <1247209961.6630.3.camel@subratamodak.linux.ibm.com>
Reply-To: dedekind@infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:59563 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbZGJHWM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2009 03:22:12 -0400
In-Reply-To: <1247209961.6630.3.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org, carolyn.j.smith@exgate.tek.com, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Cromie <jim.cromie@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, linux-next <linux-next@vger.kernel.org>, Scott Wood <scottwood@freescale.com>, dwmw2@infradead.org, Balbir Singh <balbir@linux.vnet.ibm.com>

On Fri, 2009-07-10 at 12:42 +0530, Subrata Modak wrote:
> On Fri, 2009-07-10 at 09:18 +0300, Artem Bityutskiy wrote:
> > Subrata Modak wrote:
> > > On Fri, 2009-07-10 at 08:59 +0300, Artem Bityutskiy wrote:
> > >> On Mon, 2009-07-06 at 07:47 +0530, Subrata Modak wrote:
> > >>> Hi,
> > >>>
> > >>> Is there somebody else whom i should also address to get an att=
ention
> > >>> for this patch ? I apolozise if i have not included someone. Ki=
ndly
> > >>> connect to the concerned.
> > >> I'm putting your patch to l2-mtd-2.6.git.
> > >=20
> > > Thanks very much. Would i receive some automatic confirmation onc=
e it
> > > make to Linus tree ?
> >=20
> > I do not think so. I'm not MTD maintainer and in l2-mtd-2.6.git
> > I just collect random patches, which the maintainer then usually
> > takes from my tree.
>=20
> Thanks. I just want this through before 2.6.31 stable is released, so
> that the build fails does not occur on next trees based on that stabl=
e
> one.

Then you should bug dwmw2.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
