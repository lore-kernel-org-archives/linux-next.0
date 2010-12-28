From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 28 Dec 2010 11:18:20 +0200
Message-ID: <4D19AB5C.3000608@nokia.com>
References: <20101228103234.29e09106.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.128.24]:32431 "EHLO mgw-da01.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751588Ab0L1JNv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Dec 2010 04:13:51 -0500
In-Reply-To: <20101228103234.29e09106.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 12/28/2010 01:32 AM, ext Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> sound/soc/codecs/tpa6130a2.c: In function 'tpa6130a2_add_controls':
> sound/soc/codecs/tpa6130a2.c:342: warning: unused variable 'dapm'
>=20
> Introduced by commit 39646871a47fd8808c08de0ce7d7ca8393af2805 ("ASoC:
> tpa6130a2: Replace DAPM code with direct interface").

Sorry about that.
I'll send the fix in a few minutes.

--=20
P=E9ter
