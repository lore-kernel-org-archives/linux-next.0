From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: URL change for mfd tree?
Date: Thu, 31 Jul 2014 08:25:45 +0100
Message-ID: <20140731072545.GG9030@lee--X1>
References: <20140730092453.089e1094@canb.auug.org.au>
 <20140730071254.GC9030@lee--X1>
 <20140731090116.01e54d15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:35882 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932112AbaGaHZv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Jul 2014 03:25:51 -0400
Received: by mail-ig0-f172.google.com with SMTP id h15so8859404igd.17
        for <linux-next@vger.kernel.org>; Thu, 31 Jul 2014 00:25:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140731090116.01e54d15@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 31 Jul 2014, Stephen Rothwell wrote:
> On Wed, 30 Jul 2014 08:12:54 +0100 Lee Jones <lee.jones@linaro.org> w=
rote:
> >
> > > I noticed commit 71e297b17bb6 ("MAINTAINERS: Update MFD repo loca=
tion")
> > > in the mfd-lj tree today.  In linux-next, I have the following mf=
d
> > > trees:
> > >=20
> > > git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-fixes.git=
#master
> > > git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-next.git#=
master
> > > git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd=
-next
> > >=20
> > > Does your commit mean that I should remove the first two?
> >=20
> > Yes please.  They haven't been used for ~6 months and aren't likely=
 to
> > be used again.
>=20
> I have removed them and renamed mfd-lj to mfd.

Perfect, much obliged.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
