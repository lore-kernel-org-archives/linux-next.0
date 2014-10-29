From: David Miller <davem@davemloft.net>
Subject: Re: randconfig build error with next-20141028, in net/bridge
Date: Wed, 29 Oct 2014 15:37:45 -0400 (EDT)
Message-ID: <20141029.153745.182320154112584088.davem@davemloft.net>
References: <CA+r1ZhjGo_pWi5hsxra65fCm0kwLfit4ai4_sAiwKKj0fPLxVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:45939 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932072AbaJ2Ths (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Oct 2014 15:37:48 -0400
In-Reply-To: <CA+r1ZhjGo_pWi5hsxra65fCm0kwLfit4ai4_sAiwKKj0fPLxVg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jim.epost@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, stephen@networkplumber.org, bridge@lists.linux-foundation.org, kyeyoonp@codeaurora.org

From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 28 Oct 2014 07:52:47 -0700

> Building with the attached random configuration file,
> 
> net/built-in.o: In function `br_handle_frame_finish':
> (.text+0x40edf): undefined reference to `arp_tbl'
> net/built-in.o: In function `br_handle_frame_finish':
> (.text+0x40f3a): undefined reference to `arp_send'
> make: *** [vmlinux] Error 1

Kyeyoon-ssi, you will need to do something about this.

Your choices are either selecting INET (and thus also
CRYPTO and CRYPTO_AES, since INET needs those in order
to build properly), making bridging depeng on INET,
or protecting the new proxy-arp code with INET ifdef
checks.
