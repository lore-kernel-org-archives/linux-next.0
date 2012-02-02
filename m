From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Subject: RE: linux-next: build failure after merge of the modem-shm tree
Date: Thu, 2 Feb 2012 14:28:21 +0100
Message-ID: <81C3A93C17462B4BBD7E272753C105791FB737BB80@EXDCVYMBSTM005.EQ1STM.local>
References: <20120201160057.7be520d38bf5d0dd6d29024d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125]:35583 "EHLO
	eu1sys200aog108.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753809Ab2BBN2t convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Feb 2012 08:28:49 -0500
In-Reply-To: <20120201160057.7be520d38bf5d0dd6d29024d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> After merging the modem-shm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> scripts/Makefile.headersinst:18: include/linux/shm/Kbuild: No such fi=
le
> or directory

Sorry, I missed that!
I have rebased to v3.3-rc2 and fixed this issue,
tested x86_64 allmodconfig and it works for me.

Please pull:
git://github.com/sjurbren/modem-ipc.git for-next.

Please get back to me if you get any other issues.

Best Regards,
Sjur Br=E6ndeland
