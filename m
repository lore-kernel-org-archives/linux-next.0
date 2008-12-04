From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: next-2008-12-04: ubifs section fixlet
Date: Thu, 04 Dec 2008 16:18:22 +0200
Message-ID: <4937E6AE.9040302@nokia.com>
References: <20081204200745.eff0ac87.sfr@canb.auug.org.au> <20081204140418.GB13953@x200.localdomain>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:37457 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbYLDOVK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 09:21:10 -0500
In-Reply-To: <20081204140418.GB13953@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Alexey Dobriyan wrote:
> Please, fold into 552ff3179d1e93a3e982357544c059f3e9a5516e
> aka "UBIFS: add debugfs support":
>=20
> WARNING: fs/ubifs/ubifs.o(.init.text+0xec): Section mismatch in refer=
ence from the function init_module() to the function .exit.text:ubifs_c=
ompressors_exit()

Pushed to ubifs-2.6.git, thanks.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
