From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 29 Oct 2012 09:43:34 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1210290942150.19184@pobox.suse.cz>
References: <20121029111403.911c815a3c7d8d9572ff8e89@canb.auug.org.au> <8d5c617feaaecfcf9e358a8b2cc35d20@hardeman.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46607 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757817Ab2J2Inj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Oct 2012 04:43:39 -0400
In-Reply-To: <8d5c617feaaecfcf9e358a8b2cc35d20@hardeman.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-15?Q?David_H=E4rdeman?= <david@hardeman.nu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>

On Mon, 29 Oct 2012, David H=C3=A4rdeman wrote:

> > allmodconfig) failed like this:
> >=20
> > drivers/hid/hid-picolcd_cir.c: In function 'picolcd_init_cir':
> > drivers/hid/hid-picolcd_cir.c:119:27: error: 'RC_TYPE_ALL' undeclar=
ed
> > (first use in this function)
>=20
> I can fix it, should be easy (rename RC_TYPE_ALL to RC_BIT_ALL).
>=20
> > Caused by commit c003ab1bedf0 ("[media] rc-core: add separate defin=
es
> for
> > protocol bitmaps and numbers").  The new reference was introduced i=
n
> > commit ae08e324146c ("HID: picoLCD: Add support for CIR") which was
> > merged by Linus on October 2 into v3.7-rc1 via the hid tree.
> >=20
> > I have used the v4l-dvb tree from next-20121026 for today.
>=20
> The question is in which form you want the patch - as a separate patc=
h or
> a new version of commit c003ab1bedf0 (i.e. the entire patch)? Also, a=
gainst
> which tree should I create the patch?

I am not able to see c003ab1bedf0 in repo at

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git

so I am not entirely sure what's happening, but I guess that you have j=
ust=20
changed the define for RC_TYPE_ALL and updated all the drivers under=20
drivers/media to use the new name. So please do so for=20
drivers/hid/hid-picolcd_cir.c the same way.

Thanks,

--=20
Jiri Kosina
SUSE Labs
