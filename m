From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH linux-next] arm: multi_v7_defconfig: add fsl lpuart
 serial console
Date: Fri, 12 Jul 2013 11:04:20 -0700
Message-ID: <20130712180420.GA28285@quad.lixom.net>
References: <1373392491-32056-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33021 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965095Ab3GLSEU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jul 2013 14:04:20 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so9196165pab.35
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2013 11:04:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1373392491-32056-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vstehle@debian
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>, Russell King <linux@arm.linux.org.uk>

On Tue, Jul 09, 2013 at 07:54:51PM +0200, Vincent Stehl=E9 wrote:
> Add Freescale LPUART serial console support. This gives us the boot m=
essages on
> UART on e.g. the Vybrid VF610 Tower board.
>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@freescale.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Russell King <linux@arm.linux.org.uk>
> ---
>=20
>=20
> Hi,
>=20
> Would you please consider adding LPUART for ARM multi_v7_defconfig, p=
lease?
>=20
> (This patch is built on top of the following patches:
> http://comments.gmane.org/gmane.linux.kernel/1519712)
>=20
> Best regards,

Thanks, applied to fixes. Note that I squashed together the three patch=
es to
one though.


-Olof
