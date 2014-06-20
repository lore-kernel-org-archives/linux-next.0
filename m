From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH linux-next] staging: r8192ee: Adapt flush function
 prototype
Date: Thu, 19 Jun 2014 17:19:21 -0700
Message-ID: <20140620001921.GA22619@kroah.com>
References: <1402162759-17074-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53305 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646AbaFTAPU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jun 2014 20:15:20 -0400
Content-Disposition: inline
In-Reply-To: <1402162759-17074-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

On Sat, Jun 07, 2014 at 07:39:19PM +0200, Vincent Stehl=C3=A9 wrote:
> Commit 77be2c54c5bd 'mac80211: add vif to flush call' modifies the fl=
ush
> operation prototype. Update r8192ee function accordingly.
>=20
> This fixes the following compilation warnings:
>=20
>   drivers/staging/rtl8192ee/core.c: At top level:
>   drivers/staging/rtl8192ee/core.c:1599:2: warning: initialization fr=
om incompatible pointer type [enabled by default]
>     .flush =3D rtl_op_flush,
>     ^
>   drivers/staging/rtl8192ee/core.c:1599:2: warning: (near initializat=
ion for =E2=80=98rtl92e_ops.flush=E2=80=99) [enabled by default]
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>=20
> Hi,
>=20
> Linux next gives a "heads up" that the flush function of staging driv=
er r8192ee
> needs to be adapted soon.
>=20
> This can be seen with e.g. linux next-20140606 and x86 allmodconfig.
>=20
> Also, r8192ee would benefit from the following patch:
> http://www.spinics.net/lists/linux-driver-devel/msg47690.html

This doesn't apply as I think it's already done part of a merge...

greg k-h
