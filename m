From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 - next-20160729 build failures
Date: Thu, 04 Aug 2016 18:10:57 +0200
Message-ID: <2405930.iJXNaXEjI5@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <1880505.MpH3ISbtMJ@wuerfel> <20160804214713.4baa832e@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:60712 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758699AbcHDQMP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2016 12:12:15 -0400
In-Reply-To: <20160804214713.4baa832e@roar.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>, Segher Boessenkool <segher@kernel.crashing.org>

On Thursday, August 4, 2016 9:47:13 PM CEST Nicholas Piggin wrote:

> +	__used							\
> +	__attribute__((section("___kentry" "+" #sym ",\"a\",@note #"), used)) \


I've just started testing this, but the first problem I ran into
is that @ and # are special characters that have an architecture
specific meaning to the assembler. On ARM, you need "%note @" instead
of "@note #".

	Arnd
