From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 28 Aug 2015 09:40:41 +0200
Message-ID: <alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com>
References: <20150828115041.037554b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:45225 "EHLO
	bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbbH1Hkp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2015 03:40:45 -0400
In-Reply-To: <20150828115041.037554b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


On Fri, 28 Aug 2015, Stephen Rothwell wrote:

> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from sound/soc/codecs/ics43432.c:12:0:
> sound/soc/codecs/ics43432.c:60:25: error: 'ics43432_dt_ids' undeclare=
d here (not in a function)
>  MODULE_DEVICE_TABLE(of, ics43432_dt_ids);
>                          ^
> include/linux/module.h:223:21: note: in definition of macro 'MODULE_D=
EVICE_TABLE'
>  extern const typeof(name) __mod_##type##__##name##_device_table  \
>                      ^
> include/linux/module.h:223:27: error: '__mod_of__ics43432_dt_ids_devi=
ce_table' aliased to undefined symbol 'ics43432_dt_ids'
>  extern const typeof(name) __mod_##type##__##name##_device_table  \
>                            ^=20
> sound/soc/codecs/ics43432.c:60:1: note: in expansion of macro 'MODULE=
_DEVICE_TABLE'
>  MODULE_DEVICE_TABLE(of, ics43432_dt_ids);
>  ^
>=20
> Caused by commit
>=20
>   3b7ce99748f0 ("ASoC: ics43432: Add codec driver for InvenSense ICS-=
43432")
>=20
> Not really build tested with CONFIG_OF set, right? :-(

Well, actually, yes.

In fact the exact same construct is used by a handful of other codec=20
drivers which apparently don't fail.

I'm suspecting something slightly more convoluted like a missing #inclu=
de .

> I have reverted that commit for today.

Ok. I'll get to work on this ASAP.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
