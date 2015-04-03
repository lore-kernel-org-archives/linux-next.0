From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Fri, 3 Apr 2015 16:05:10 +0200
Message-ID: <20150403140510.GA12376@kroah.com>
References: <20150327184835.6b214809@canb.auug.org.au>
 <18153784.217855.1427830545058.open-xchange@webmail.nmp.proximus.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43028 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752650AbbDCOFO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2015 10:05:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 23D0220790
	for <linux-next@vger.kernel.org>; Fri,  3 Apr 2015 10:05:10 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <18153784.217855.1427830545058.open-xchange@webmail.nmp.proximus.be>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fabian Frederick <fabf@skynet.be>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Tue, Mar 31, 2015 at 09:35:45PM +0200, Fabian Frederick wrote:
>=20
>=20
> > On 27 March 2015 at 08:48 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> >
> > Hi all,
> >
> > After merging the char-misc tree, today's linux-next build (powerpc
> > allyesconfig) produced this warning:
> >
> > In file included from include/linux/module.h:17:0,
> >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from drivers/uio/uio_pdrv_genirq=
=2Ec:21:
> > include/linux/moduleparam.h:326:22: warning: initialization discard=
s 'const'
> > qualifier from pointer target type
> >=A0 =A0static const struct kparam_string __param_string_##name=A0 \
> >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^
> > drivers/uio/uio_pdrv_genirq.c:260:1: note: in expansion of macro
> > 'module_param_string'
> >=A0 module_param_string(of_id, uio_of_genirq_match[0].compatible, 12=
8, 0);
> >=A0 ^
> >
> > Introduced by commit 4d8beff2ae07 ("uio: constify of_device_id arra=
y").
>=20
> Hi Stephen,
>=20
> Absolutely, my patch is wrong ; comment below explains struct is fill=
ed
> afterwards.Sorry.
> Greg, should I send you a revert or maybe we could standardize that d=
river ? (it
> seems it's the only one to work that way).
>=20
> static const struct of_device_id uio_of_genirq_match[] =3D {
> =A0 =A0 =A0 =A0 { /* This is filled with module_parm */ },
> =A0 =A0 =A0 =A0 { /* Sentinel */ },
> };

A revert would be great, and then work to fix it "correctly" so we can
make it constant would be wonderful.  But I don't know how you would do
that at first glance.

I'll just go revert the patch now, thanks.

thanks,

greg k-h
