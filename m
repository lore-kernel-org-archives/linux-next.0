From: Fabian Frederick <fabf@skynet.be>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 31 Mar 2015 21:35:45 +0200 (CEST)
Message-ID: <18153784.217855.1427830545058.open-xchange@webmail.nmp.proximus.be>
References: <20150327184835.6b214809@canb.auug.org.au>
Reply-To: Fabian Frederick <fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailsec110.isp.belgacom.be ([195.238.20.106]:55162 "EHLO
	mailsec110.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751593AbbCaTfp convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 15:35:45 -0400
In-Reply-To: <20150327184835.6b214809@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org



> On 27 March 2015 at 08:48 Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>
>
> Hi all,
>
> After merging the char-misc tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> In file included from include/linux/module.h:17:0,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from dr=
ivers/uio/uio_pdrv_genirq.c:21:
> include/linux/moduleparam.h:326:22: warning: initialization discards =
'const'
> qualifier from pointer target type
>=C2=A0 =C2=A0static const struct kparam_string __param_string_##name=C2=
=A0 \
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^
> drivers/uio/uio_pdrv_genirq.c:260:1: note: in expansion of macro
> 'module_param_string'
>=C2=A0 module_param_string(of_id, uio_of_genirq_match[0].compatible, 1=
28, 0);
>=C2=A0 ^
>
> Introduced by commit 4d8beff2ae07 ("uio: constify of_device_id array"=
).

Hi Stephen,

Absolutely, my patch is wrong ; comment below explains struct is filled
afterwards.Sorry.
Greg, should I send you a revert or maybe we could standardize that dri=
ver ? (it
seems it's the only one to work that way).

static const struct of_device_id uio_of_genirq_match[] =3D {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* This is filled with module_parm */ },
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* Sentinel */ },
};

Regards,
=46abian

> --
> Cheers,
> Stephen Rothwell=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sfr@canb.auug.org.au
