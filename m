From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: URL change for mfd tree?
Date: Wed, 30 Jul 2014 08:12:54 +0100
Message-ID: <20140730071254.GC9030@lee--X1>
References: <20140730092453.089e1094@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140730092453.089e1094@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> I noticed commit 71e297b17bb6 ("MAINTAINERS: Update MFD repo location=
")
> in the mfd-lj tree today.  In linux-next, I have the following mfd
> trees:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-fixes.git#mas=
ter
> git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-next.git#mast=
er
> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-nex=
t
>=20
> Does your commit mean that I should remove the first two?

Yes please.  They haven't been used for ~6 months and aren't likely to
be used again.

Kind regards,
Lee

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
