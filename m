From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Subject: RE: Please include modem_shm in linux-next
Date: Tue, 31 Jan 2012 09:45:22 +0100
Message-ID: <81C3A93C17462B4BBD7E272753C105791FB6FA76E1@EXDCVYMBSTM005.EQ1STM.local>
References: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
	<81C3A93C17462B4BBD7E272753C105791FB10F9CC9@EXDCVYMBSTM005.EQ1STM.local>
	<20120113111055.83755960f93161d3542e4763@canb.auug.org.au>
 <CACRpkdYjvu2Tq7b6wGn9CnMtDjb7zcenbcUM7Br2gEVq7Xpq4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137]:55766 "EHLO
	eu1sys200aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753140Ab2AaIub convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jan 2012 03:50:31 -0500
In-Reply-To: <CACRpkdYjvu2Tq7b6wGn9CnMtDjb7zcenbcUM7Br2gEVq7Xpq4Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

>> I would also like to hear from Linus Walleij ...
>=20
> Please replace my repo with Sjurs (whenever it merges fine).
>=20
> Sjur, I guess an option would be if you rebase your for-next
> onto 3.3-rc1 as soon as it appears?=20

I have rebased to v3.3-rc1. Please pull:
git://github.com/sjurbren/modem-ipc.git for-next.

This replaces the previous branch "xshm-for-next" pulled from Linus Wal=
leij.
Please get back to me if you get any issues.

Thanks,
Sjur Br=E6ndeland
