From: Pauli Nieminen <suokkos@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 8 Apr 2010 23:50:26 +0300
Message-ID: <i2m548cdfc21004081350o2ba0ad71v23a10ab4c2156e0c@mail.gmail.com>
References: <20100408131251.b69e2fa2.sfr@canb.auug.org.au>
	 <alpine.DEB.2.00.1004080452150.11948@skynet.skynet.ie>
	 <20100408141423.82e04416.sfr@canb.auug.org.au>
	 <o2w12c511ca1004080919pa73e0552mec30ca706d9277a9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f223.google.com ([209.85.220.223]:48639 "EHLO
	mail-fx0-f223.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933234Ab0DHUu3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2010 16:50:29 -0400
In-Reply-To: <o2w12c511ca1004080919pa73e0552mec30ca706d9277a9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>

On Thu, Apr 8, 2010 at 7:19 PM, Tony Luck <tony.luck@gmail.com> wrote:
> Does anyone else see:
>
> drivers/gpu/drm/ttm/ttm_page_alloc.c: In function =91ttm_page_alloc_d=
ebugfs=92:
> drivers/gpu/drm/ttm/ttm_page_alloc.c:830: error: implicit declaration
> of function =91seq_printf=92
>
> when building the next-20100408 tag?
>
> -Tony
>

http://marc.info/?l=3Ddri-devel&m=3D127067975811418&w=3D2
