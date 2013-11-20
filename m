From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Regarding the l2-mtd branch in linux-next
Date: Wed, 20 Nov 2013 16:45:22 -0300
Message-ID: <20131120194521.GB27064@localhost>
References: <20131120114654.GA26240@localhost>
 <20131120183417.GI9468@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:54937 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754628Ab3KTTpR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2013 14:45:17 -0500
Content-Disposition: inline
In-Reply-To: <20131120183417.GI9468@ld-irv-0074.broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, Nov 20, 2013 at 10:34:17AM -0800, Brian Norris wrote:
> Hi Ezequiel,
>=20
> On Wed, Nov 20, 2013 at 08:46:55AM -0300, Ezequiel Garcia wrote:
> > Can you explain in detail the differences between l2-mtd/master and
> > l2-mtd/next?
> >=20
> > I'm seeing linux-next merges the former, but instead maybe it shoul=
d
> > be the latter?
> >=20
> > What do you think?
>=20
> I only created the l2-mtd.git 'next' branch recently because I don't
> think linux-next likes to see new stuff during the merge window that'=
s
> not going into the current release cycle. So I just queued up stuff i=
n a
> different branch temporarily, and I plan to bring it into 'master' on
> top of 3.13-rc1 once the merge window closes.
>=20
> In answer to your second question, then, the inclusion of
> l2-mtd.git/master in linux-next is exactly as intended.
>=20
> I am new at this whole maintainership thing, though, and I could be v=
ery
> wrong about the intended development process regarding linux-next and
> the merge window. I couldn't find much clear documentation regarding
> this process. I suppose it's something you learn over time. Any comme=
nts
> are welcome.
>=20

Hm, I see. Well, I'm not an expert but the above sounds just about the
right thing to do.

Sorry for the noise!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
