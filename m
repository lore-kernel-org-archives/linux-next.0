From: Michael Neuling <mikey@neuling.org>
Subject: CRYPTO_DEV_NX merge problem (Re: linux-next: Tree for July 31)
Date: Tue, 31 Jul 2012 15:58:58 +1000
Message-ID: <31974.1343714338@neuling.org>
References: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:49078 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752239Ab2GaF7A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jul 2012 01:59:00 -0400
In-reply-to: <20120731152614.de6ebe9e0d4b8fc6645b793a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kent Yoder <key@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, anton@samba.org, Seth Jennings <sjenning@linux.vnet.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>

> Please do not add anything to linux-next included branches/series that is
> destined for v3.7 until after v3.6-rc1 is released.

Looks like there is a merge conflict between:
  commit 1b074ac867a2bd08a6f12f0feed7d91e06941723
  Author: Seth Jennings <sjenning@linux.vnet.ibm.com>
  Subject: powerpc/crypto: rework Kconfig

and 
  commit fd297b3a7302ab866306f53c1fd1e97b083fe83e
  Author: Anton Blanchard <anton@samba.org>
  powerpc: Enable pseries hardware RNG and crypto modules

Seth made CRYPTO_DEV_NX a bool and Anton set it as a module.

Hence I get this with a pseries_defconfig
  arch/powerpc/configs/pseries_defconfig:372:warning: symbol value 'm' invalid for CRYPTO_DEV_NX

Seth: any reason this can stay as a tristate?

Mikey
