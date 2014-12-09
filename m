From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the bcm2835 tree with the arm-soc
 tree
Date: Tue, 9 Dec 2014 08:21:12 +0000
Message-ID: <20141209082112.GQ3951@x1>
References: <20141208120619.68287b54@canb.auug.org.au>
 <2406890.FlzRjyvuXd@wuerfel>
 <20141208130009.GL3951@x1>
 <3348703.0b5FTH9Sa3@wuerfel>
 <20141208134903.GN3951@x1>
 <5485CD02.7010903@wwwdotorg.org>
 <20141208165127.GP3951@x1>
 <5485E1EA.2070902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:63619 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbaLIIVS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2014 03:21:18 -0500
Received: by mail-ie0-f172.google.com with SMTP id tr6so70002ieb.3
        for <linux-next@vger.kernel.org>; Tue, 09 Dec 2014 00:21:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5485E1EA.2070902@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Matthias Klein <matthias.klein@linux.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Mon, 08 Dec 2014, Stephen Warren wrote:

> On 12/08/2014 09:51 AM, Lee Jones wrote:
> >On Mon, 08 Dec 2014, Stephen Warren wrote:
> ...
> >>The primary purpose of the kernel.org linux-rpi.git repo is for
> >>staging patches into arm-soc/linux-next. As such, just like any
> >>other similar repo, users should expect at least the for-xxx (e.g.
> >>for-next) branches to get reset as kernel versions tick over, in
> >>order to contain the content for the next kernel. Anyone using thos=
e
> >>branches for anything else (e.g. local development) simply has to b=
e
> >>prepared to do a rebase themselves when that happens.
> >
> >I agree with this.
> >
> >>Equally, and patches that get sent to arm-soc should probably never
> >>be applied to linux-rpi.git; anything that gets applied to
> >>linux-rpi.git should get sent to arm-soc as a pull request. That
> >>avoids duplicate commits.
> >
> >I'm okay to follow this rule if my perception of the tree is changed=
=2E
> >The current view is that this repo can be used by engineers/hobbyist=
s
> >as a single resource to pick up RPi patches which are yet to complet=
e
> >their full transition into Mainline.
> >
> >Arnd and I had a discussion where I flagged my concerns about these
> >kinds of conflicts.  The outcome was that as long as the patches wer=
e
> >simple enough, then no conflict should arise.  Unfortunately this
> >turned out not to be quite true.
> >
> >So I'm happy with whatever.  Stephen, the repo is your concept.  I'l=
l
> >play it however you want me to play it.  As the merge-window is now
> >open I'm going to eradicate rpi/for-next in any case.
>=20
> Eradicate or reset? If you delete it, Stephen Rothwell will have a
> problem fetching it when creating linux-next. Usually to empty out
> the for-next branch, you'd reset it to some recent Linus tag; 3.18
> seems like a good one at present.

Yes, in this case eradicate =3D=3D `git reset <blah>`.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
