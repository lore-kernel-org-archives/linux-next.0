From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Tue, 1 Mar 2016 09:38:30 +0100
Message-ID: <56D55506.4050007@atmel.com>
References: <20160301145700.784f5fcf@canb.auug.org.au>
 <20160301150054.2cb0e728@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:51470 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751209AbcCAIiW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 03:38:22 -0500
In-Reply-To: <20160301150054.2cb0e728@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Le 01/03/2016 05:00, Stephen Rothwell a =E9crit :
> Hi all,
>=20
> On Tue, 1 Mar 2016 14:57:00 +1100 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>
>> Today's linux-next merge of the clk tree got a conflict in:
>>
>>   drivers/clk/at91/clk-main.c
>>
>> between commit:
>>
>>   99a81706526f ("clk: at91: remove IRQ handling and use polling")
>>
>> from the arm-soc tree and commit:
>>
>>   8c1b1e54faed ("clk: at91: Remove impossible checks for of_clk_get_=
parent_count()")
>>
>> from the clk tree.
>=20
> And the same for drivers/clk/at91/clk-master.c

Stephen,

Both fixes seem good. Thanks!

Bye,
--=20
Nicolas Ferre
