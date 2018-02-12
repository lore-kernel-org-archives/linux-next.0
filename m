From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the nios2 tree
Date: Mon, 12 Feb 2018 13:14:14 +1100
Message-ID: <20180212131414.0ca70c63@canb.auug.org.au>
References: <20180212092043.33045460@canb.auug.org.au>
        <1518398629.49408.4.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932237AbeBLCOR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Feb 2018 21:14:17 -0500
In-Reply-To: <1518398629.49408.4.camel@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Ley Foon Tan <lftan@altera.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ley,

On Mon, 12 Feb 2018 09:23:49 +0800 Ley Foon Tan <ley.foon.tan@intel.com> wr=
ote:
>
> On Mon, 2018-02-12 at 09:20 +1100, Stephen Rothwell wrote:
> >=20
> > Commits
> >=20
> > =C2=A0 5d13c7317998 ("nios2: dts: Remove leading 0x and 0s from bindings
> > notation")
> > =C2=A0 e0691ebb33c1 ("nios2: defconfig: Cleanup from old Kconfig option=
s")
> >=20
> > are missing a Signed-off-by from their committer.
>=20
> There are Signed-off-by in the commits.
>=20
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

They are the authors of the patches, but you are the committer i.e. you
are on the path form the authors to Linus, so you need to add a
Signed-off-by tag as well.  I see Linus has merged theses commits now,
so there is nothing to be done for them, but in the future please add a
Signed-off-by tag for anything that you commit.

See section 11 of Documentation/process/submitting-patches.rst
--=20
Cheers,
Stephen Rothwell
