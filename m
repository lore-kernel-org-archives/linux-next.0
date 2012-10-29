From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 29 Oct 2012 07:52:59 -0200
Message-ID: <20121029075259.76dc5cd8@infradead.org>
References: <20121029111403.911c815a3c7d8d9572ff8e89@canb.auug.org.au>
	<8d5c617feaaecfcf9e358a8b2cc35d20@hardeman.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:46488 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827Ab2J2JxV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Oct 2012 05:53:21 -0400
In-Reply-To: <8d5c617feaaecfcf9e358a8b2cc35d20@hardeman.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David =?UTF-8?B?SMOkcmRlbWFu?= <david@hardeman.nu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>, Jiri Kosina <jkosina@suse.cz>

Em Mon, 29 Oct 2012 09:09:13 +0100
David H=C3=A4rdeman <david@hardeman.nu> escreveu:

> On Mon, 29 Oct 2012 11:14:03 +1100, Stephen Rothwell
> <sfr@canb.auug.org.au>
> wrote:
> > Hi Mauro,
> >=20
> > After merging the v4l-dvb tree, today's linux-next build (x86_64
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

Please do it as a separate patch against linux-media.git. As the origin=
al
patch was already merging there, and we don't rebase the tree, there's
not much option.

Regards,
Mauro
