From: Tony Luck <tony.luck@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 8 Apr 2010 09:19:01 -0700
Message-ID: <o2w12c511ca1004080919pa73e0552mec30ca706d9277a9@mail.gmail.com>
References: <20100408131251.b69e2fa2.sfr@canb.auug.org.au>
	 <alpine.DEB.2.00.1004080452150.11948@skynet.skynet.ie>
	 <20100408141423.82e04416.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f193.google.com ([209.85.222.193]:50842 "EHLO
	mail-pz0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758771Ab0DHQTE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2010 12:19:04 -0400
In-Reply-To: <20100408141423.82e04416.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pauli Nieminen <suokkos@gmail.com>, Jerome Glisse <jglisse@redhat.com>

Does anyone else see:

drivers/gpu/drm/ttm/ttm_page_alloc.c: In function =91ttm_page_alloc_deb=
ugfs=92:
drivers/gpu/drm/ttm/ttm_page_alloc.c:830: error: implicit declaration
of function =91seq_printf=92

when building the next-20100408 tag?

-Tony
