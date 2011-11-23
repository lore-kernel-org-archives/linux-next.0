From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] dmatest: don't use set_freezable_with_signal()
Date: Wed, 23 Nov 2011 09:39:47 -0800
Message-ID: <20111123173947.GD29639@google.com>
References: <20111121184316.GH15314@google.com>
 <CABE8wwu-ZH47tFkaEmYfWtXzgeR9KmEWXbtXD5FEQc3R9tV7aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABE8wwu-ZH47tFkaEmYfWtXzgeR9KmEWXbtXD5FEQc3R9tV7aQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Williams, Dan J" <dan.j.williams@intel.com>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Stephen Rothwell <sfr@canb.auug.org.au>, rjw@sisk.pl, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Tue, Nov 22, 2011 at 11:48:07PM -0800, Williams, Dan J wrote:
> > Guennadi, Dan, how does this look? =A0If it's okay, do you guys min=
d
> > routing this through pm tree? =A0I have some patches stacked on top
> > removal of freezable_with_signal and it would be much easier to rou=
te
> > these together.
> >
> > Thank you.
>=20
> Acked-by: Dan Williams <dan.j.williams@intel.com>
>=20
> (for the revised commit a75ca055 on
> git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git pm-freezer)

Awesome, will add Acked-by and push it to Rafael.

Thank you.

--=20
tejun
