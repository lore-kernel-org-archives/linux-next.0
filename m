From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
	tree
Date: Wed, 15 Dec 2010 16:43:16 +0000
Message-ID: <20101215164316.GA5641@flint.arm.linux.org.uk>
References: <20101215105435.3ce83f21.sfr@canb.auug.org.au> <20101214235746.GB21913@flint.arm.linux.org.uk> <AANLkTimdZ3FRs82RzSZR19gDJbkNe2UfEY-kLQOwvd_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42154 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab0LOQnd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2010 11:43:33 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimdZ3FRs82RzSZR19gDJbkNe2UfEY-kLQOwvd_Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Martin <dave.martin@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 15, 2010 at 12:28:39PM +0000, Dave Martin wrote:
> Hi,
>=20
> On Tue, Dec 14, 2010 at 11:57 PM, Russell King <rmk@arm.linux.org.uk>=
 wrote:
> > On Wed, Dec 15, 2010 at 10:54:35AM +1100, Stephen Rothwell wrote:
> >> Hi Russell,
> >>
> >> Today's linux-next merge of the arm tree got a conflict in
> >> arch/arm/Kconfig between commit 6e6fc998b8c127fe06b9350a1f16e41bfe=
4f109d
> >> ("ARM: 6533/1: Thumb-2: Make CONFIG_THUMB2_KERNEL depend on !CPU_V=
6")
> >> from the arm-current tree and commit
> >> 4a50bfe365a977f634311504484342fbfffe855c ("ARM: Ensure experimenta=
l
> >> options are so marked") from the arm tree.
> >>
> >> Just context changes. =A0I fixed it up (see below) and can carry t=
he fix as
> >> necessary.
> >
> > Yea, rather unfortunate. =A0I'll fix it up locally once arm-current=
 is
> > merged into mainline.
>=20
> Looks like this was a case of two simple changes on neighbouring line=
s
> -- I'll try to avoid such conflicts for the future.

It's not a problem.

--=20
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
