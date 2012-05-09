From: Kay Sievers <kay@vrfy.org>
Subject: Re: linux-next: Tree for May 8 (printk)
Date: Wed, 9 May 2012 02:45:41 +0200
Message-ID: <CAPXgP133n_RL=PfdmTNWcJwFtvDBPey1OF6rKc0DJkHSYW0_Mw@mail.gmail.com>
References: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
 <4FA948B9.20600@xenotime.net> <1336518821.728.1.camel@mop>
 <4FA9ABD6.6030006@xenotime.net> <1336520271.728.4.camel@mop> <4FA9B7BF.90502@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44752 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945Ab2EIAqE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 20:46:04 -0400
Received: by pbbrp8 with SMTP id rp8so8706265pbb.19
        for <linux-next@vger.kernel.org>; Tue, 08 May 2012 17:46:04 -0700 (PDT)
In-Reply-To: <4FA9B7BF.90502@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Wed, May 9, 2012 at 2:18 AM, Randy Dunlap <rdunlap@xenotime.net> wro=
te:
> On 05/08/2012 04:37 PM, Kay Sievers wrote:

> drivers/char/mem.c:858:2: error: implicit declaration of function 'pr=
intk_emit'
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0printk_emit(facility, level, NULL, 0, "%s"=
, line);

You need the whole series, there is no  printk_emit() in that file anym=
ore.

Kay
