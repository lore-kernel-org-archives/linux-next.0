From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: strange commit in the mfd tree
Date: Thu, 22 Jan 2015 07:53:28 +0000
Message-ID: <20150122075328.GN22024@x1>
References: <20150122095638.46a0b503@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:40398 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751191AbbAVHxd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2015 02:53:33 -0500
Received: by mail-ie0-f181.google.com with SMTP id rp18so94279iec.12
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2015 23:53:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150122095638.46a0b503@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com

On Thu, 22 Jan 2015, Stephen Rothwell wrote:

> Hi Lee,
>=20
> I noticed this commit in the mfd tree:
>=20
> f11b9265e6ca "[FIX/HACK] Disable DRM"
>=20
> Is that really appropriate here?  Especially given it has no explanat=
ion.
>=20
> I guess it will make my builds slightly faster :-)

You're right, this is an escapee.  It should have been removed
post-testing.  I have asked Rob Clark to take a look at the issue it
'solves'. FYI, arm,multi_v7 fails to build with raised warning levels
>=3D1.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
